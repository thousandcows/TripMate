package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.CompanyBoardDTO;
import kh.spring.service.CompanyBoardService;

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
	
	
	
}
