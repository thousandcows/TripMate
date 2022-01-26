package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.DashboardDTO;
import kh.spring.service.DashboardService;

@Controller
@RequestMapping("/dashboard/")
public class DashboardController {

	@Autowired
	private DashboardService ds;

	@RequestMapping("insertTable")
	public String insertTable() throws Exception {

		List<DashboardDTO> dlist = ds.joinTable();
		ds.deleteTable();
		for (int i = 0; i < dlist.size(); i++) {
			ds.insertTable(dlist.get(i));
		}

		return "redirect:/admin/dashboard";
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
}
