package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.DashboardDAO;
import kh.spring.dto.DashboardDTO;
import kh.spring.dto.MemberDTO;

@Service
public class DashboardService {

	@Autowired
	private DashboardDAO ddao;

	public List<DashboardDTO> joinTable(){
		return ddao.joinTable();
	}
	
	public int insertTable(DashboardDTO dto) {
		return ddao.insertTable(dto);
	}
	
	public List<DashboardDTO> selectAllDash(){
		return ddao.selectAllDash();
	}

	public int deleteTable() {
		return ddao.deleteTable();
	}
	
	public int cntCate1() {
		return ddao.cntCate1();
	}
	
	public int cntCate2() {
		return ddao.cntCate2();
	}
	
	public int cntCate3() {
		return ddao.cntCate3();
	}
	
	public int cntCate4() {
		return ddao.cntCate4();
	}
	
	public int cntGender1() {
		return ddao.cntGender1();
	}
	
	public int cntGender2() {
		return ddao.cntGender2();
	}
	
	
	
	public int cntPlan() {
		return ddao.cntPlan();
	}
	
	public int cntTour() {
		return ddao.cntTour();
	}
	
	public int cntCom() {
		return ddao.cntCom();
	}
	
	public int cntPrePlan() {
		return ddao.cntPrePlan();
	}

	
	public int cntPreTour() {
		return ddao.cntPreTour();
	}
	
	public int cntPreCom() {
		return ddao.cntPreCom();
	}

	
	public int cntMember() {
		return ddao.cntMember();
	}
	
	public int cntPreMem() {
		return ddao.cntPreMem();
	}
	
	public List<MemberDTO> selectAllMem(){
		return ddao.selectAllMem();
	}
	
	
	public int setVisitTotalCount() { 
		return ddao.setVisitTotalCount(); 
	}
	  
	public int getVisitTotalCount() { 
		return ddao.getVisitTotalCount(); 
	}
	  
	public int getVisitTodayCount() { 
		return ddao.getVisitTodayCount(); 
	}
	  
	public int insertVisitor(int visitcnt) { 
		return ddao.insertVisitor(visitcnt);
	 }
	 



}
