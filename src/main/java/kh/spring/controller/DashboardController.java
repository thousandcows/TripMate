package kh.spring.controller;

import java.util.ArrayList;
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
		
		
		// 총 게시글 수(계획 + 여행지 + 동행)
		  int cntPlan = ds.cntPlan();
		  int cntTour = ds.cntTour();
		  int cntCom = ds.cntCom();
		  
		  int totalPost = cntPlan + cntTour + cntCom;
		  map.put("totalPost", totalPost);
		  

		return map;
	}
	
	
	@RequestMapping("chart1")
	public @ResponseBody String chart1(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		List<DashboardDTO> dlist = ds.selectAllDash();

		return gson.toJson(dlist);
	}
	
	
	@RequestMapping("chart2")
	public @ResponseBody String chart2(Model model) throws Exception {
		
		Gson gson = new Gson(); 
		
		int cate1 = ds.cntCate1();
		int cate2 = ds.cntCate2();
		int cate3 = ds.cntCate3();
		int cate4 = ds.cntCate4();
		int gender1 = ds.cntGender1();
		int gender2 = ds.cntGender2();
		
		List<Integer> dlist = new ArrayList();
		dlist.add(cate1);
		dlist.add(cate2);
		dlist.add(cate3);
		dlist.add(cate4);
		dlist.add(gender1);
		dlist.add(gender2);

		return gson.toJson(dlist);
	}
	
	
}
