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

	
	@ResponseBody
    @RequestMapping(value = "ajax1", method = RequestMethod.POST)
	public HashMap<String, Integer> ajax1() throws Exception {

		String loginNick = (String) session.getAttribute("loginNick");
	
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		List<DashboardDTO> dlist = ds.joinTable();
		
		System.out.println(dlist.get(0).getStan_date() + " : " + dlist.get(0).getVisitor() + " : " + dlist.get(0).getUser_n() + " : " + dlist.get(0).getPlan() + " : " + dlist.get(0).getTour_board() + " : " + dlist.get(0).getCom_board());
		
		ds.deleteTable();
		
		// 방문자수 : 오늘 방문자수
		  int visitcnt = ds.getVisitTodayCount();
		  dlist.get(dlist.size()-1).setVisitor(visitcnt); 
		  map.put("visitCnt", visitcnt);
		  
		for (int i = 0; i < dlist.size(); i++) {
			ds.insertTable(dlist.get(i));
		}
		 
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
	
	
	@RequestMapping("chart")
	public @ResponseBody String newMemDaily(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		List<DashboardDTO> dlist = ds.selectAllDash();

		return gson.toJson(dlist);
	}
	
	
}
