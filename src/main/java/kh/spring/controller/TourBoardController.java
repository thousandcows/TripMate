package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.TourBoardDAO;
import kh.spring.dao.TourReplyDAO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.dto.TourReplyDTO;
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
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request) throws Exception{
		
		String cpage = request.getParameter("cpage");
		if(cpage == null) {cpage = "1";}
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageTotalCount = bservice.getPageTotalCount();
		
		if(currentPage < 1) {
			currentPage = 1;
		}
		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int start =  currentPage*Statics.RECORD_COUNT_PER_PAGE-(Statics.RECORD_COUNT_PER_PAGE-1);
		int end = currentPage*Statics.RECORD_COUNT_PER_PAGE;
		
		String navi = bservice.getPageNavi(currentPage);
		
		List<TourBoardDTO> list = bservice.selectAll(start, end);
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		
		return "tourboard/list";
	}
	
	@RequestMapping("write")
	public String write() {
		
		return "tourboard/write";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(TourBoardDTO bdto, MultipartFile[] file) {
		
//		String writer = (String) session.getAttribute("loginID");
//		dto.setWriter(writer);	

//		String realPath = session.getServletContext().getRealPath("upload");	

//		tourb_seq.nextval, 1,	#{title}, #{contents}, 'trip', default, default, default, default
//		System.out.println("explanation : " + explanation);
//		String contents = explanation;
		
		bservice.writeProc(bdto);
		
		return "redirect:/tourboard/list?cpage=1";
	}
	
	@RequestMapping("detail")
	public String detail(int seq, Model model) {
        TourBoardDTO dto = bservice.selectBySeq(seq);
        
        bservice.addViewCount(seq);
        int replyCount = bservice.replyCount(seq);
        
        dto.setRep_count(replyCount);
        List<TourReplyDTO> rp_list = rservice.selectAll(seq);
        
//		int parentSeq = bdto.getSeq();        
//		List<FilesDTO> files = fservice.selectByParentSeq(parentSeq);

        
        model.addAttribute("dto", dto);
        model.addAttribute("rp_list", rp_list);        
//        model.addAttribute("files", files);
        return "tourboard/detail";
    }

	@RequestMapping("modify")
	public String modify(int seq, String title, String category, String explanation) throws Exception{

		String contents = explanation;
		int result = bservice.modify(seq, title, contents, category);
		return "redirect:/tourboard/detail?seq="+seq;
	}

	@RequestMapping("delete")
	public String delete(int seq) throws Exception{

		int result = bservice.delete(seq);
		return "redirect:/tourboard/list?cpage=1";
	}
	
	
}
