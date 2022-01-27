package kh.spring.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.dto.AreaDTO;
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
		if(paging.size()>0) {
			model.addAttribute("firstNum",paging.get(0));
			model.addAttribute("lastNum",paging.get(paging.size()-1));
		}else {
			model.addAttribute("firstNum",0);					
			model.addAttribute("lastNum",0);
		}
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		return "/plan/main";
	}
	
	@RequestMapping("detail")
	public String detail(int seq,Model model) throws Exception {
		PlanDTO dto = pServe.getDetail(seq);
		List<String> date = pServe.calDate(dto.getStartDate(),dto.getEndDate());
		List<List<AreaDTO>> list = new ArrayList<>();
		for(int i = 0; i<date.size();i++) {
			list.add(pServe.detailPlanList(seq,date.get(i)));			
		}
		int loginSeq = (int)session.getAttribute("loginSeq");
		
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		model.addAttribute("loginSeq",loginSeq);
		return "/plan/detail";
	}
	
	@RequestMapping("newPlan")
	public String newPlan() {
		return "/plan/planning";
	}
	
	@RequestMapping("modify")
	public String modify(int seq, Model model) throws Exception{
		PlanDTO dto = pServe.callPlan(seq);
		int loginSeq = (int) session.getAttribute("loginSeq");
		//공유 기능 추가시 제거, 공유기능 추가시 DB 별도테이블 생성
		if(dto.getMem_seq() != loginSeq) {
			return "/";
		}
		
		// 찜목록 조회 갯수
		List<AreaDTO> adto = new ArrayList<>();
		List<Integer> mySaveListSeq = mServe.mySaveListSeq(loginSeq, Statics.SAVE_LIST_START,Statics.SAVE_LIST_END);
		List<Integer> isMySaveListMore = mServe.mySaveListSeq(loginSeq, Statics.IS_MY_SAVE_LIST_MORE,Statics.IS_MY_SAVE_LIST_MORE);
		List<String> savedListRate = new ArrayList<>();
		for (int saveSeq : mySaveListSeq) {
			adto.add(aService.detailBuild(saveSeq));
			String rate = mServe.savedAreaGrade(saveSeq);
			savedListRate.add(rate);
		}
		List<String> date = pServe.calDate(dto.getStartDate(),dto.getEndDate());
		model.addAttribute("date",date);
		model.addAttribute("isMySaveListMore", isMySaveListMore);
		model.addAttribute("savedListRate", savedListRate);
		model.addAttribute("mySaveListSeq", mySaveListSeq);
		model.addAttribute("saveList", adto);
		model.addAttribute("seq",seq);
		model.addAttribute("dto",dto);
		return "/plan/planning";
	}
	
	@RequestMapping("delete")
	public String delete(int seq) {
		pServe.delete(seq);
		return "redirect:/plan/main?page=1";
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
	public String main(int page, String target) throws Exception{
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
	
	@RequestMapping("insertMemo")
	public String insertMemo(int seq, String memo,RedirectAttributes re) {
		pServe.insertMemo(seq,memo);
		re.addAttribute("seq",seq);
		return "redirect:/plan/modify";
	}
		
	
	@ResponseBody
	@RequestMapping(value="detailPlanList", produces = "application/text;charset=utf-8")
	public String detailPlanList(int seq,String date) {
		List<AreaDTO> list = pServe.detailPlanList(seq, date);
		String result = pServe.detailToAjax(list);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="planSort", produces = "application/text;charset=utf-8")
	public String planSort(@RequestParam(value="target[]")int[] target) throws Exception{
		pServe.sortPlan(target);
		return "OK";
	}
	
	@ResponseBody
	@RequestMapping(value="planDateSort", produces = "application/text;charset=utf-8")
	public String planDateSort(@RequestParam(value="seq")int seq,@RequestParam(value="day") String day) throws Exception{
		pServe.sortDatePlan(seq,day);
		return "OK";
	}
	
	@ResponseBody
	@RequestMapping(value="planDateDelete", produces = "application/text;charset=utf-8")
	public String planDateDelete(@RequestParam(value="seq")int seq) {
		pServe.deleteDatePlan(seq);
		return "OK";
	}
	
}
