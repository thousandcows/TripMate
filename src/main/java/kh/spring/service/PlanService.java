package kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.PlanDAO;
import kh.spring.dto.PlanDTO;
import kh.spring.statics.Statics;

@Service
public class PlanService {

	@Autowired
	public PlanDAO dao;

	public PlanDTO callPlan(int seq) {
		return dao.callPlan(seq);
	}
	
	public List<Integer> listCount(int mem_seq,int page) {
		int total = dao.listCount(mem_seq);
		int totalPage = 0;
		if(total%Statics.RECORD_COUNT_PER_PAGE==0) {
			totalPage = (total/Statics.RECORD_COUNT_PER_PAGE);			
		}else {
			totalPage = (total/Statics.RECORD_COUNT_PER_PAGE)+1;
		}
		int startNavi = (page-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;         

		boolean needPrev = true; 
		boolean needNext = true; 
		
		if(startNavi == 1) {
			needPrev = false;
		}

		if(endNavi >= totalPage) {
			needNext = false;
		}
		
		if(endNavi > totalPage) {
			endNavi = totalPage;
		}

		List<Integer> pageNavi = new ArrayList<>();
		if(needPrev) {pageNavi.add(startNavi-2) ;}
		for(int i = startNavi; i<=endNavi; i++) {
			pageNavi.add(i);
		}
		if(needNext) { pageNavi.add(endNavi+1);}
		return pageNavi;
         
		
	}
	
	public List<PlanDTO> listing(int seq,int page){
		int startNum = (page*Statics.RECORD_COUNT_PER_PAGE)-(Statics.RECORD_COUNT_PER_PAGE-1);
		int endNum = page*Statics.RECORD_COUNT_PER_PAGE;
		return dao.listing(seq,startNum,endNum);
	}
	

	public int chooseTheme(PlanDTO dto) {
		int result = dao.createTheme(dto);
		return result;
	}
	
	public void changeTheme(PlanDTO dto) {
		dao.changeTheme(dto);
	}
	
	public void saveList(String[] check,int seq) {
		for(int i =0;i<check.length;i++) {
			String[] split = check[i].split("&");
			int target = Integer.parseInt(split[0]);
			dao.saveList(target,seq);
		}
	}
}
