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

import kh.spring.dao.TourBoardDAO;
import kh.spring.dao.TourReplyDAO;
import kh.spring.dto.NoticeDTO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.dto.TourBoardLikeDTO;
import kh.spring.dto.TourReplyDTO;
import kh.spring.dto.TourReplyReplyDTO;
import kh.spring.service.AdminService;
import kh.spring.service.TourBoardService;
import kh.spring.service.TourReplyService;
import kh.spring.statics.Statics;

@Controller
@RequestMapping("/tourboard/")
public class TourBoardController {
	
	@Autowired
	private TourBoardDAO bdao;
	
	@Autowired
	private TourReplyDAO rdao;
	
	@Autowired
	public TourBoardService bservice;
	
	@Autowired
	public TourReplyService rservice;
	
	@Autowired
	public AdminService aservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request) throws Exception{
		
		String searchOption = request.getParameter("searchOption");
		String searchText = request.getParameter("searchText");
		
		if(searchText==null&&searchOption==null) {
			
			String cpage = request.getParameter("cpage");
			if(cpage == null) {cpage = "1";}
			
			
			int currentPage = Integer.parseInt(request.getParameter("cpage"));
			int pageTotalCount = bservice.getPageTotalCount(searchOption, searchText);
			
			if(currentPage < 1) {
				currentPage = 1;
			}
			if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			
			int start =  currentPage*Statics.RECORD_COUNT_PER_PAGE-(Statics.RECORD_COUNT_PER_PAGE-1);
			int end = currentPage*Statics.RECORD_COUNT_PER_PAGE;
			
			List<TourBoardDTO> list = bservice.selectAll(start, end, null, null);			
			String navi = bservice.getPageNavi(currentPage, searchOption, searchText);
			
			String loginEmailId = (String)request.getSession().getAttribute("loginEmailID");
			
			List<NoticeDTO> nt_list = bservice.ntselectAll();  
			
			model.addAttribute("nt_list", nt_list);
			model.addAttribute("writer", loginEmailId);
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
			
			return "tourboard/list";
			
		}else{			
			
			String cpage = request.getParameter("cpage");
			if(cpage == null) {cpage = "1";}
			
			
			int currentPage = Integer.parseInt(request.getParameter("cpage"));
			int pageTotalCount = bservice.getPageTotalCount(searchOption, searchText);
			
			if(currentPage < 1) {
				currentPage = 1;
			}
			if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			
			int start =  currentPage*Statics.RECORD_COUNT_PER_PAGE-(Statics.RECORD_COUNT_PER_PAGE-1);
			int end = currentPage*Statics.RECORD_COUNT_PER_PAGE;
			List<TourBoardDTO> list = bservice.selectAll(start, end, searchOption, searchText);
			
			String navi = bservice.getPageNavi(currentPage, searchOption, searchText);
			
			String loginEmailId = (String)request.getSession().getAttribute("loginEmailID");
			List<NoticeDTO> nt_list = bservice.ntselectAll();  
			
			model.addAttribute("nt_list", nt_list);
			model.addAttribute("writer", loginEmailId);
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
			
			return "tourboard/list";
		}		
	}
	
	@RequestMapping("write")
	public String write() {
		
		return "tourboard/write";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(TourBoardDTO bdto) throws Exception{
		
		String nick = (String) session.getAttribute("loginNick");
		bdto.setNick(nick);
		
		int mem_id = (int)session.getAttribute("loginSeq");
		bdto.setMem_seq(mem_id);
	
		bservice.writeProc(bdto);		
		
		return "redirect:/tourboard/list?cpage=1";
	}

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
	
	@RequestMapping("detail")
	public String detail(int seq, Model model, HttpServletRequest request) throws Exception {
		
		String loginNick = (String)request.getSession().getAttribute("loginNick");
		Integer login_seq = (Integer) session.getAttribute("loginSeq");
		
        TourBoardDTO dto = bservice.selectBySeq(seq);
        
        bservice.addViewCount(seq);
        
        int replyCount = bservice.replyCount(seq);
        int replyReplyCount = bservice.replyReplyCount(seq);
        
        int totalReplyCount = replyCount + replyReplyCount;
        dto.setRep_count(totalReplyCount);
        bservice.addReplyCount(seq, totalReplyCount);
        
        List<TourReplyDTO> rp_list = rservice.selectAll(seq);
        
        List<TourReplyReplyDTO> re_list = rservice.selectReAll();

        // 좋아요 반영
     	if(loginNick != null) {
     		int loginSeq = (int) session.getAttribute("loginSeq");   
     		TourBoardLikeDTO t_dto = new TourBoardLikeDTO();
     		t_dto.setPar_seq(seq);
     		t_dto.setMem_seq(loginSeq);
     		int boardlike = bservice.likeDuplCheck(t_dto);
     			
     		model.addAttribute("heart", boardlike);
     	}
     	
     	// 좋아요 카운트
     	int likeCount = bservice.totalBoardLike(seq);
     	
     	
     	model.addAttribute("loginSeq", login_seq);
     	model.addAttribute("likeCount", likeCount);        
     	model.addAttribute("loginNick", loginNick);
        model.addAttribute("dto", dto);
        model.addAttribute("rp_list", rp_list); 
        model.addAttribute("re_list", re_list);
        return "tourboard/detail";
    }

	@RequestMapping("modify")
	public String modify(int seq, String title, String category, String explanation) throws Exception{

		String contents = explanation;
		int result = bservice.modify(seq, title, contents, category);
		return "redirect:/tourboard/detail?seq="+seq;
	}

	@RequestMapping("toModify")
	public String modifyPage(TourBoardDTO dto, String explanation, Model model) {
		
		dto.setContents(explanation);
		model.addAttribute("dto", dto);
		return "tourboard/modifyPage";
	}
	
	@RequestMapping("delete")
	public String delete(int seq) throws Exception{

		int result = bservice.delete(seq);
		return "redirect:/tourboard/list?cpage=1";
	}
	
	// 좋아요
	@ResponseBody
    @RequestMapping(value = "heart", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Integer> heart(HttpServletRequest httpRequest) throws Exception {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int loginSeq = (int) session.getAttribute("loginSeq");     
        int boardId = Integer.parseInt(httpRequest.getParameter("boardId"));  
        TourBoardLikeDTO dto = new TourBoardLikeDTO();
        
        dto.setPar_seq(boardId);
        dto.setMem_seq(loginSeq);
	        
        if(heart >= 1) {
        	bservice.deleteBoardLike(dto);
            heart=0;
            map.put("heart", heart);
        } else {
        	int dupl = bservice.likeDuplCheck(dto);
        	if(dupl==0) {
        		bservice.insertBoardLike(dto);
                heart=1;
                map.put("heart", heart);
        	}else {
        		heart=1;
        		map.put("heart", heart);
        	}
        }
	        
        int likeCount = bservice.totalBoardLike(boardId);
        map.put("likeCount", likeCount);
        return map;
	}
	
	@RequestMapping("noticeDetail")
	public String noticeDetail(int seq, Model model) {

		NoticeDTO ndto = bservice.selectByNtSeq(seq);
        aservice.addViewCount(seq);
		
		model.addAttribute("dto", ndto);
		
		return "tourboard/noticeDetail";
	}
	
	@RequestMapping("noticeModify")
	public String noticeModify(int seq, String title, String explanation) throws Exception{
		
		String contents = explanation;
		bservice.noticeModify(seq, title, contents);
		System.out.println("다시 돌아갈 준비 중");
		return "redirect:/tourboard/noticeDetail?seq="+seq;
	}
}
