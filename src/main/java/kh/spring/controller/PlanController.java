package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.PlanDTO;
import kh.spring.service.PlanService;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	@Autowired
	public HttpSession session;
	
	@Autowired
	public PlanService pServe;
	
	@RequestMapping("main")
	public String main() {
		return "/plan/main";
	}
	
	@RequestMapping("newPlan")
	public String newPlan() {
		int loginSeq = (int)session.getAttribute("loginSeq");
		return "/plan/planning";
	}
	
	@RequestMapping("chooseTheme")
	public String chooseTheme(PlanDTO dto) {
		int loginSeq = (int)session.getAttribute("loginSeq");
		dto.setMem_seq(loginSeq);
		pServe.chooseTheme(dto);
		return "/plan/planning";
	}
}
