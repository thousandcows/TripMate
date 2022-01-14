package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.TourBoardDAO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.service.TourBoardService;

@Controller
@RequestMapping("/tourboard/")
public class TourBoardController {
	
	@Autowired
	private TourBoardDAO dao;
	
	@Autowired
	public TourBoardService tservice;
	
	@RequestMapping("list")
	public String list(Model model) {
		
		List<TourBoardDTO> list = tservice.selectAll();
		model.addAttribute("list", list);
		
		return "tourboard/list";
	}
	
	@RequestMapping("write")
	public String write() {
		
		return "tourboard/write";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(TourBoardDTO dto, MultipartFile[] file) {
		
//		String writer = (String) session.getAttribute("loginID");
//		dto.setWriter(writer);	

//		String realPath = session.getServletContext().getRealPath("upload");	

//		tourb_seq.nextval, 1,	#{title}, #{contents}, 'trip', default, default, default, default
//		System.out.println("explanation : " + explanation);
//		String contents = explanation;
		
		tservice.writeProc(dto);
		
		return "redirect:/tourboard/list";
	}
	
	@RequestMapping("detail")
	public String detail(int seq, Model model) {
        TourBoardDTO dto = tservice.selectBySeq(seq);
        int result = tservice.addViewCount(seq);
//        int parentSeq = bdto.getSeq();        
//        List<FilesDTO> files = fservice.selectByParentSeq(parentSeq);        

        model.addAttribute("dto", dto);
//        model.addAttribute("files", files);
        return "tourboard/detail";
    }
	
	@RequestMapping("modify")
	public String modify(int seq, String title, String explanation) throws Exception{

		String contents = explanation;
		int result = tservice.modify(seq, title, contents);
		return "redirect:/tourboard/detail?seq="+seq;
	}
	
	@RequestMapping("delete")
	public String delete(int seq) throws Exception{

		int result = tservice.delete(seq);
		return "redirect:/tourboard/list";
	}
}
