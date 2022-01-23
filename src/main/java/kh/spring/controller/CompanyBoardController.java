package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.ComBoardLikeDTO;
import kh.spring.dto.ComMemDTO;
import kh.spring.dto.ComReplyDTO;
import kh.spring.dto.ComReplyReplyDTO;
import kh.spring.dto.CompanyBoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ComReplyService;
import kh.spring.service.CompanyBoardService;
import kh.spring.statics.Statics;

@Controller
@RequestMapping("/companyboard/")
public class CompanyBoardController {

	@Autowired
	private CompanyBoardService cbs;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	public ComReplyService crs;
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request) throws Exception {
		
//		검색어 
		String searchOption = request.getParameter("searchOption");
		String searchText = request.getParameter("searchText");
		
		System.out.println("1컨트롤러에 들어오는 searchOption : searchText = "+ searchOption + " :  " + searchText);
		
		if(searchText==null&&searchOption==null) {
			String cpage = request.getParameter("cpage");
			if(cpage == null) {cpage = "1";}
			
			int currentPage = Integer.parseInt(request.getParameter("cpage"));
			int pageTotalCount = cbs.getPageTotalCount(searchOption, searchText);
			
			if(currentPage < 1) {
				currentPage = 1;
			}
			if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			
			int start =  currentPage*Statics.RECORD_COUNT_PER_PAGE-(Statics.RECORD_COUNT_PER_PAGE-1);
			int end = currentPage*Statics.RECORD_COUNT_PER_PAGE;
			
			List<CompanyBoardDTO> list = cbs.selectAll(start, end, null, null);			
			String navi = cbs.getPageNavi(currentPage, searchOption, searchText);
			
			String nick = (String) session.getAttribute("loginNick");
			System.out.println("loginNick = "+ nick);

			
			model.addAttribute("nick",nick);
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
			
			return "companyboard/list";
			
		}else {
			String cpage = request.getParameter("cpage");
			if(cpage == null) {cpage = "1";}
			
			
			int currentPage = Integer.parseInt(request.getParameter("cpage"));
			int pageTotalCount = cbs.getPageTotalCount(searchOption, searchText);
			System.out.println("컨트롤러에 currentPage, pageTotalCount: " + currentPage + " : " + pageTotalCount);
			
			if(currentPage < 1) {
				currentPage = 1;
			}
			if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			
			int start =  currentPage*Statics.RECORD_COUNT_PER_PAGE-(Statics.RECORD_COUNT_PER_PAGE-1);
			int end = currentPage*Statics.RECORD_COUNT_PER_PAGE;
			List<CompanyBoardDTO> list = cbs.selectAll(start, end, searchOption, searchText);
			//System.out.println("컨트롤러에 가져온 작성자 이름 검색 값 : " + list.get(0).getNick());
			System.out.println("컨트롤러에 start, end, searchoption, searchtext: " + start + " : " + end + " : " + searchOption + " : " + searchText);
			
			
			String navi = cbs.getPageNavi(currentPage, searchOption, searchText);
			
			String nick = (String) session.getAttribute("loginNick");
			System.out.println("loginNick = "+ nick);
			
			model.addAttribute("nick",nick);
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
			
			return "companyboard/list";
		}

	}
	
	// 작성 버튼 클릭시 작성 페이지로의 이동을 위한 메소드
	@RequestMapping("write")
	public String write() {
		return "companyboard/write";
	}
	
	// 작성완료 버튼 클릭 시 db 삽입 및 리스트로 넘어가는 메소드 구현
	@RequestMapping("writeProc")
	public String writeProc(CompanyBoardDTO dto) {
		String loginNick = (String) session.getAttribute("loginNick");
		int loginSeq = (int) session.getAttribute("loginSeq");   
		
		dto.setNick(loginNick);
		dto.setMem_seq(loginSeq);
		
		int result = cbs.insert(dto);
		return "redirect:/companyboard/list?cpage=1"; 
	}
	
	// 글 제목 클릭시 상세페이지 이동 메소드
	@RequestMapping("detail")
	public String detail(int seq, Model model) throws Exception {
		
		
		String loginNick = (String) session.getAttribute("loginNick");
		
		// dto, 조회수
		CompanyBoardDTO dto = cbs.selectBySeq(seq);
		//dto.setNick(loginNick);
		int result = cbs.addViewCount(seq);
		model.addAttribute("dto",dto);
		
		// 좋아요 반영
		
		
		if(loginNick != null) {
			int loginSeq = (int) session.getAttribute("loginSeq");   
			ComBoardLikeDTO c_dto = new ComBoardLikeDTO();
			c_dto.setPar_seq(seq);
			c_dto.setMem_seq(loginSeq);
			int boardlike = cbs.likeDuplCheck(c_dto);
			
			model.addAttribute("heart", boardlike);
		}
		
		
		//댓글+대댓글 갯수
//		System.out.println("seq : " + seq);
		int replyCount = cbs.replyCount(seq);
//		System.out.println("replyCount : " + replyCount);
		int replyReplyCount = cbs.replyReplyCount(seq);
//		System.out.println("replyReplyCount : " + replyReplyCount);
		
        List<ComReplyDTO> rep_list = crs.selectAll(seq);
        List<ComReplyReplyDTO> re_rep_list = crs.selectReAll();
        
        int sumReplyCount = replyCount+replyReplyCount;
        dto.setRep_count(sumReplyCount);
        cbs.addReplyCount(seq, sumReplyCount);

        model.addAttribute("rep_list", rep_list);
        model.addAttribute("re_rep_list", re_rep_list);
        
        //신청자 리스트
		
		 List<MemberDTO> recruit_list = cbs.selectAllMem(seq);
		 model.addAttribute("recruit_list",recruit_list);
		 
		 
		 // 신청자 카운트
		 int memCount = cbs.memCount(seq);
		 System.out.println(memCount + ": memcount 입니다.");
		 model.addAttribute("memCount",memCount);
		 
		 // 좋아요 카운트
		 int likeCount = cbs.totalBoardLike(seq);
		 System.out.println(likeCount + ": likeCount 입니다.");
		 model.addAttribute("likeCount", likeCount);
		 
        
		
		return "companyboard/detail";
	}
	
	//수정완료 버튼 클릭 시 db 수정 
	@RequestMapping("modify")
	public String modify(CompanyBoardDTO dto) {
		int result = cbs.modify(dto);
		return "redirect:/companyboard/detail?seq="+dto.getSeq();
	}
	
	//삭제 버튼 클릭 시 db에서 삭제
	@RequestMapping("deleteProc")
	public String deleteProc(int seq) throws Exception{
		int result = cbs.delete(seq);
		cbs.delete2(seq);
		
		return "redirect:/companyboard/list?cpage=1";
	}	
	
	// 좋아요
	@ResponseBody
    @RequestMapping(value = "heart", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Integer> heart(HttpServletRequest httpRequest) throws Exception {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int loginSeq = (int) session.getAttribute("loginSeq");     
        int boardId = Integer.parseInt(httpRequest.getParameter("boardId"));  

        ComBoardLikeDTO dto = new ComBoardLikeDTO();
        
        dto.setPar_seq(boardId);
        dto.setMem_seq(loginSeq);
        
        
		 
        if(heart >= 1) {
            cbs.deleteBoardLike(dto);
            heart=0;
            map.put("heart", heart);
        } else {
        	int dupl = cbs.likeDuplCheck(dto);
        	if(dupl==0) {
        		cbs.insertBoardLike(dto);
                heart=1;
                map.put("heart", heart);
        	}else {
        		heart=1;
        		map.put("heart", heart);
        	}
        }
        
        int likeCount = cbs.totalBoardLike(boardId);
        map.put("likeCount", likeCount);
        System.out.println("likeCount 값 controller에서.. " + likeCount);

        return map;

    }
	
	
	// 참가신청 버튼 클릭 시 com_mem에 insert
	@RequestMapping("attend")
	public String attend(ComMemDTO dto,int seq, Model model) {
		
		String loginNick = (String) session.getAttribute("loginNick");
		int loginSeq = (int) session.getAttribute("loginSeq");   
		
		dto.setMem_seq(loginSeq);
		dto.setPar_seq(seq);
		
		int dupl = cbs.memDuplCheck(dto);
		System.out.println(dupl + "");
		if(dupl == 0) {
			cbs.insertMem(dto);	
		}
		
		model.addAttribute("dupl",dupl);
		
		
		return "redirect:/companyboard/detail?seq="+dto.getPar_seq();
	}
	
	// 모집마감후 board의 expired값 셋팅
	@RequestMapping("expired")
	public String expired(int seq) {
		
		cbs.updateExpired(seq);
		
		return "redirect:/companyboard/detail?seq="+seq;
	}
	
	// 마감 취소
	@RequestMapping("expiredCancel")
	public String expiredCancel(int seq) {
			
		cbs.updateExpiredCancel(seq);
			
		return "redirect:/companyboard/detail?seq="+seq;
	}
	
	// 신청자리스트에서 뺴기
	@RequestMapping("deleteMem")
	public String deleteMem(int seq, int writeseq) throws Exception{
		int result = cbs.deleteMem(seq);
		return "redirect:/companyboard/detail?seq="+writeseq;
	}
	

}
