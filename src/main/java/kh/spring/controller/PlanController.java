package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.dto.AreaListDTO;
import kh.spring.dto.PlanDTO;
import kh.spring.service.AreaService;
import kh.spring.service.PlanService;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	@Autowired
	public HttpSession session;
	
	@Autowired
	public PlanService pServe;
	
	@Autowired
	public AreaService aService;
	
	@RequestMapping("main")
	public String main() {
		return "/plan/main";
	}
	
	@RequestMapping("newPlan")
	public String newPlan() {
		return "/plan/planning";
	}
	
	@RequestMapping("modify")
	public String modify(int seq, Model model) {
		PlanDTO dto = pServe.callPlan(seq);
		model.addAttribute("seq",seq);
		model.addAttribute("dto",dto);
		return "/plan/planning";
	}
	
	@RequestMapping("chooseTheme")
	public String chooseTheme(PlanDTO dto, RedirectAttributes re) {
		int loginSeq = (int)session.getAttribute("loginSeq");
		dto.setMem_seq(loginSeq);
		int seq = pServe.chooseTheme(dto);
		re.addAttribute("seq",seq);
		return "redirect:/plan/modify";
	}
	
	@RequestMapping("changeTheme")
	public String changeTheme(PlanDTO dto,RedirectAttributes re) {
		pServe.changeTheme(dto);
		re.addAttribute("seq",dto.getSeq());
		return "redirect:/plan/modify";
	}
	
	@ResponseBody
	@RequestMapping(value="search", params= {"page","target"}) //검색 출력
	public String main(int page, String target, Model model) throws Exception{
		String list = aService.searchAjax(page, target);
		return list;		
	}
	
	@RequestMapping("saveList")
	public String saveList(int[] check,int seq, RedirectAttributes re) {
		re.addAttribute("seq",seq);
		pServe.saveList(check, seq);
		return "redirect:/plan/modify";
	}
		
	@RequestMapping("chooseSpot")
	public String chooseSpot() {
		return "";
	}
}
