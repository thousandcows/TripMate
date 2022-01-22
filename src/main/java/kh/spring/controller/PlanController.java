package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.dto.AreaDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.PlanDTO;
import kh.spring.service.AreaService;
import kh.spring.service.MemberService;
import kh.spring.service.PlanService;
import kh.spring.statics.Statics;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	@Autowired
	public HttpSession session;
	
	@Autowired
	public PlanService pServe;
	
	@Autowired
	public AreaService aService;
	
	@Autowired
	public MemberService mServe;
	
	@RequestMapping("main")
	public String main(int page, Model model) {
		int loginSeq = (int)session.getAttribute("loginSeq");
		List<Integer> paging = pServe.listCount(loginSeq,page);
		List<PlanDTO> list = pServe.listing(loginSeq,page);
		model.addAttribute("paging",paging);
		model.addAttribute("firstNum",paging.get(0));
		model.addAttribute("lastNum",paging.get(paging.size()-1));
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		return "/plan/main";
	}
	
	@RequestMapping("newPlan")
	public String newPlan() {
		return "/plan/planning";
	}
	
	@RequestMapping("modify")
	public String modify(int seq, Model model) throws Exception{
		PlanDTO dto = pServe.callPlan(seq);
		int loginSeq = (int) session.getAttribute("loginSeq");
		// 찜목록 조회 갯수
		List<AreaDTO> adto = new ArrayList<>();
		List<Integer> mySaveListSeq = mServe.mySaveListSeq(loginSeq, Statics.SAVE_LIST_START,
				Statics.SAVE_LIST_END);
		List<Integer> isMySaveListMore = mServe.mySaveListSeq(loginSeq, Statics.IS_MY_SAVE_LIST_MORE,
				Statics.IS_MY_SAVE_LIST_MORE);
		List<String> savedListRate = new ArrayList<>();
		for (int saveSeq : mySaveListSeq) {
			adto.add(aService.detailBuild(saveSeq));
			String rate = mServe.savedAreaGrade(saveSeq);
			savedListRate.add(rate);
		}
		model.addAttribute("isMySaveListMore", isMySaveListMore);
		model.addAttribute("savedListRate", savedListRate);
		model.addAttribute("mySaveListSeq", mySaveListSeq);
		model.addAttribute("saveList", adto);
		model.addAttribute("seq",seq);
		model.addAttribute("dto",dto);
		return "/plan/planning";
	}
	
	// 찜목록 더보기
	@ResponseBody
	@RequestMapping(value = "moreSaving", produces = "application/text;charset=utf-8")
	public String moreSaving(int btn) throws Exception {
		int loginSeq = (int) session.getAttribute("loginSeq");
		return mServe.moreSaving(loginSeq, btn);
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
	public String saveList(String[] check,int seq, RedirectAttributes re) {
		
		
		
		aService.checkDB(check);
		pServe.saveList(check, seq);
		
		re.addAttribute("seq",seq);
		return "redirect:/plan/modify";
	}
		
	@RequestMapping("chooseSpot")
	public String chooseSpot() {
		return "";
	}
}
