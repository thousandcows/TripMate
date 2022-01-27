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
	
	
	
	
	
	/*
	 * public int updateVisitor() { return ddao.updateVisitor(); }
	 */
	// 방문자
	
	
	public int setVisitTotalCount() { 
		return ddao.setVisitTotalCount(); 
	}
	  
	  public int getVisitTotalCount() { return ddao.getVisitTotalCount(); }
	  
	  public int getVisitTodayCount() { return ddao.getVisitTodayCount(); }
	  
	  public int insertVisitor(int visitcnt) { return ddao.insertVisitor(visitcnt);
	  }
	 



}
