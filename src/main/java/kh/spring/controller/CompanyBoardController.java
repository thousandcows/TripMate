package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.CompanyBoardDTO;
import kh.spring.service.CompanyBoardService;
import kh.spring.statics.Statics;

@Controller
@RequestMapping("/companyboard/")
public class CompanyBoardController {

	@Autowired
	private CompanyBoardService cbs;
	
	@RequestMapping("list")
	public String list(Model model) {
		
		List<CompanyBoardDTO> list = cbs.selectAll();
		model.addAttribute("list",list);
		
		return "companyboard/list";
	}
	
	// 작성 버튼 클릭시 작성 페이지로의 이동을 위한 메소드
	@RequestMapping("write")
	public String write() {
		return "companyboard/write";
	}
	
	// 작성완료 버튼 클릭 시 db 삽입 및 리스트로 넘어가는 메소드 구현
	@RequestMapping("writeProc")
	public String writeProc(CompanyBoardDTO dto) {
		int result = cbs.insert(dto);
		return "redirect:/companyboard/list"; 
	}
	
	// 글 제목 클릭시 상세페이지 이동 메소드
	@RequestMapping("detail")
	public String detail(int seq, Model model) {
		CompanyBoardDTO dto = cbs.selectBySeq(seq);
		int result = cbs.addViewCount(seq);
		
		model.addAttribute("dto",dto);
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
		return "redirect:/companyboard/list";
	}	

}
