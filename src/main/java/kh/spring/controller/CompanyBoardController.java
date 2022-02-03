package kh.spring.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.ComBoardLikeDTO;
import kh.spring.dto.ComMemDTO;
import kh.spring.dto.ComReplyDTO;
import kh.spring.dto.ComReplyReplyDTO;
import kh.spring.dto.CompanyBoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NoticeDTO;
import kh.spring.service.AdminService;
import kh.spring.service.ComReplyService;
import kh.spring.service.CompanyBoardService;
import kh.spring.service.MemberService;
import kh.spring.service.TourBoardService;
import kh.spring.statics.Statics;

@Controller
@RequestMapping("/companyboard/")
public class CompanyBoardController {

	@Autowired
	private CompanyBoardService cbs;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private TourBoardService bservice;
	
	@Autowired
	private AdminService aservice;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	public ComReplyService crs;
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request) throws Exception {
		
//		검색어 
		String searchOption = request.getParameter("searchOption");
		String searchText = request.getParameter("searchText");
		
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
			
			List<NoticeDTO> nt_list = cbs.ntselectAll();  
			
			model.addAttribute("nt_list", nt_list);			
			model.addAttribute("nick",nick);
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
			
			return "companyboard/list";
			
		}else {
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
			List<CompanyBoardDTO> list = cbs.selectAll(start, end, searchOption, searchText);
		
			String navi = cbs.getPageNavi(currentPage, searchOption, searchText);
			
			String nick = (String) session.getAttribute("loginNick");
			
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
		
		Integer login_seq = (Integer) session.getAttribute("loginSeq");
		model.addAttribute("loginSeq", login_seq);
		
		// dto, 조회수
		CompanyBoardDTO dto = cbs.selectBySeq(seq);
		int writer_seq = dto.getMem_seq();
		MemberDTO mdto = mservice.myInfoSelectAll(writer_seq);
		int result = cbs.addViewCount(seq);
		model.addAttribute("dto",dto);
		model.addAttribute("loginInfo", mdto);
		// 좋아요 반영		
		if(loginNick != null) {
			int loginSeq = (int) session.getAttribute("loginSeq");   
			ComBoardLikeDTO c_dto = new ComBoardLikeDTO();
			c_dto.setPar_seq(seq);
			c_dto.setMem_seq(loginSeq);
			int boardlike = cbs.likeDuplCheck(c_dto);
			
			model.addAttribute("heart", boardlike);
		}
		
		
		int replyCount = cbs.replyCount(seq);
		int replyReplyCount = cbs.replyReplyCount(seq);
		
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
		 model.addAttribute("memCount",memCount);
		 
		 // 좋아요 카운트
		 int likeCount = cbs.totalBoardLike(seq);
		 model.addAttribute("likeCount", likeCount);
		 
        
		
		return "companyboard/detail";
	}
	
	//수정완료 버튼 클릭 시 db 수정 
	@RequestMapping("modify")
	public String modify(CompanyBoardDTO dto) {
		int result = cbs.modify(dto);
		return "redirect:/companyboard/detail?seq="+dto.getSeq();
	}
	
	@RequestMapping("toModify")
	public String modifyPage(CompanyBoardDTO dto, Model model) {

		model.addAttribute("dto", dto);
		return "companyboard/modifyPage";
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
	
	
	// 이미지
	@RequestMapping(value="imageUpload" , produces = "application/text;charset=utf-8")
	@ResponseBody
	public String imageUpload(MultipartFile[] file) throws Exception{		
	
		String sysName = null;
		String realPath = null;
		for (MultipartFile mf : file) {
			// 파일이 비어있지 않다면 for문을 돌리라는 의미이다. 빈 파일을 업로드하지 못하게 막는 코드이다.
			if (!mf.isEmpty()) {
				// cos.jar를 통해 request를 multipart request로 업그레이드 시켜 데이터를 뽑아내어 사용했다.
				// spring은 apachi fileupload를 사용하기 때문에 maven repository에서 다운로드 받아온다.

				realPath = session.getServletContext().getRealPath("")+"\\resources\\images";
				// Servers -> Tomcat 우클릭 -> Browse Deployment Location... : realPath의 위치

				// realPath 객체를 만들고 만약에 realPathFile 폴더가 없으면 폴더를 만들라는 이야기
				File realPathFile = new File(realPath);
				if (!realPathFile.exists()) {
					realPathFile.mkdir();
				}

				// oriName : 사용자가 업로드한 파일의 원본 이름
				String oriName = mf.getOriginalFilename();

				// sysName : 서버에 저장할 파일 이름
				// UUID.randomUUID() : 절대 겹치지 않는 문자배열을 만들어준다.
				sysName = UUID.randomUUID() + "_" + oriName;

				// 서버에 업로드되어 메모리에 적재된 파일의 내용을 어디에 저장할지 결정하는 부분
				mf.transferTo(new File(realPath + "/" + sysName));
			}
		}
		return "\\images\\" + sysName;
	}
	
	@RequestMapping("noticeDetail")
	public String noticeDetail(int seq, Model model) {

		NoticeDTO ndto = bservice.selectByNtSeq(seq);
        aservice.addViewCount(seq);
        
		model.addAttribute("dto", ndto);
		
		return "companyboard/noticeDetail";
	}
	
	@RequestMapping("noticeModify")
	public String noticeModify(int seq, String title, String explanation) throws Exception{
		
		String contents = explanation;
		bservice.noticeModify(seq, title, contents);
		return "redirect:/companyboard/noticeDetail?seq="+seq;
	}
}
