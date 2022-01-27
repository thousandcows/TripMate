package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.DashboardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.DashboardService;

@Controller
@RequestMapping("/dashboard/")
public class DashboardController {

	@Autowired
	private DashboardService ds;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("insertTable")
	public String insertTable( Model model ) throws Exception {

		String loginNick = (String) session.getAttribute("loginNick");
		
	
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		List<DashboardDTO> dlist = ds.joinTable();
		
		ds.deleteTable();
		
		// 방문자수 : 오늘 방문자수
		  int visitcnt = ds.getVisitTodayCount();
		  dlist.get(dlist.size()-1).setVisitor(visitcnt); 
		  model.addAttribute("visitCnt",visitcnt);
		  
		for (int i = 0; i < dlist.size(); i++) {
			ds.insertTable(dlist.get(i));
			/* System.out.println(dlist.get(i).getStan_date()); */
		}
		 
			/* ds.insertVisitor(visitcnt); */
		  
		// 일간 가입자수 : 현재 가입자
		
		  int cntMember = ds.cntMember(); 
		  model.addAttribute("cntMember", cntMember);
//		  map.put("cntMember", cntMember);
		 
		
		// 증감량 
		  int cntPreMem = ds.cntPreMem();
		  int withdrawal = cntMember-cntPreMem;
		  model.addAttribute("withdrawal", withdrawal);
//		  map.put("withdrawal", withdrawal);
		
		// 총 게시글 수(계획 + 여행지 + 동행)
		  int cntPlan = ds.cntPlan();
		  int cntTour = ds.cntTour();
		  int cntCom = ds.cntCom();
		  
		  int totalPost = cntPlan + cntTour + cntCom;
		  model.addAttribute("totalPost", totalPost);
//		  map.put("totalPost", totalPost);
		  
		// 증감량
		  int cntPrePlan = ds.cntPrePlan();
		  int cntPreTour = ds.cntPreTour();
		  int cntPreCom = ds.cntPreCom();
		  int prePost = cntPrePlan + cntPreTour + cntPreCom;
		  
		  int plmaPost = totalPost - prePost;
		  model.addAttribute("plmaPost", plmaPost);
//		  map.put("plmaPost", plmaPost);
		

		
		return "admin/dashboard";
	}

	
	@ResponseBody
    @RequestMapping(value = "ajax1", method = RequestMethod.POST)
	public HashMap<String, Integer> ajax1() throws Exception {

		String loginNick = (String) session.getAttribute("loginNick");
		
	
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		List<DashboardDTO> dlist = ds.joinTable();
		
		System.out.println("여기도착했나요????");
		
		ds.deleteTable();
		
		// 방문자수 : 오늘 방문자수
		  int visitcnt = ds.getVisitTodayCount();
		  System.out.println("방문자수" + visitcnt);
		  dlist.get(dlist.size()-1).setVisitor(visitcnt); 
		  map.put("visitCnt", visitcnt);
		  
		for (int i = 0; i < dlist.size(); i++) {
			ds.insertTable(dlist.get(i));
			/* System.out.println(dlist.get(i).getStan_date()); */
		}
		 
			/* ds.insertVisitor(visitcnt); */
		  
		// 일간 가입자수 : 현재 가입자
		
		  int cntMember = ds.cntMember(); 
		  map.put("cntMember", cntMember);
		 
		
		// 증감량 
		  int cntPreMem = ds.cntPreMem();
		  int withdrawal = cntMember-cntPreMem;
		  map.put("withdrawal", withdrawal);
		
		// 총 게시글 수(계획 + 여행지 + 동행)
		  int cntPlan = ds.cntPlan();
		  int cntTour = ds.cntTour();
		  int cntCom = ds.cntCom();
		  
		  int totalPost = cntPlan + cntTour + cntCom;
		  map.put("totalPost", totalPost);
		  
		// 증감량
		  int cntPrePlan = ds.cntPrePlan();
		  int cntPreTour = ds.cntPreTour();
		  int cntPreCom = ds.cntPreCom();
		  int prePost = cntPrePlan + cntPreTour + cntPreCom;
		  
		  int plmaPost = totalPost - prePost;
		  map.put("plmaPost", plmaPost);

		return map;
	}
	
	
	@RequestMapping("newMemDaily")
	public @ResponseBody String newMemDaily(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		List<DashboardDTO> dlist = ds.selectAllDash();

		return gson.toJson(dlist);
	}
	
	@RequestMapping("tourDaily")
	public @ResponseBody String tourDaily(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		List<DashboardDTO> dlist = ds.selectAllDash();

		return gson.toJson(dlist);
	}
	
	
	@RequestMapping("comDaily")
	public @ResponseBody String comDaily(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		List<DashboardDTO> dlist = ds.selectAllDash();

		return gson.toJson(dlist);
	}
	
	@RequestMapping("planDaily")
	public @ResponseBody String planDaily(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		List<DashboardDTO> dlist = ds.selectAllDash();

		return gson.toJson(dlist);
	}
	
	@RequestMapping("visitDaily")
	public @ResponseBody String visitDaily(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		List<DashboardDTO> dlist = ds.selectAllDash();

		return gson.toJson(dlist);
	}
}
