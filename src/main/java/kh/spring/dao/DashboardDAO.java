package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.DashboardDTO;
import kh.spring.dto.MemberDTO;

@Repository
public class DashboardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<DashboardDTO> joinTable(){
		return mybatis.selectList("Dashboard.joinTable");
	}

	public int insertTable(DashboardDTO dto) {
		return mybatis.insert("Dashboard.insertTable", dto);
	}

	public List<DashboardDTO> selectAllDash(){
		return mybatis.selectList("Dashboard.selectAllDash");
	}

	public int deleteTable() {
		return mybatis.delete("Dashboard.deleteTable");
	}

	public int cntMember() {
		return mybatis.selectOne("Dashboard.cntMember");
	}

	public int cntPreMem() {
		return mybatis.selectOne("Dashboard.cntPreMem");
	}


	public int cntPlan() {
		return mybatis.selectOne("Dashboard.cntPlan");
	}

	public int cntTour() {
		return mybatis.selectOne("Dashboard.cntTour");
	}

	public int cntCom() {
		return mybatis.selectOne("Dashboard.cntCom");
	}

	public int cntPrePlan() {
		return mybatis.selectOne("Dashboard.cntPrePlan");
	}
	public int cntPreTour() {
		return mybatis.selectOne("Dashboard.cntPreTour");
	}

	public int cntPreCom() {
		return mybatis.selectOne("Dashboard.cntPreCom");
	}

	public List<MemberDTO> selectAllMem(){
		return mybatis.selectList("Dashboard.selectAllMem");
	}







	//	방문자

	public int setVisitTotalCount() { 
		return mybatis.insert("Dashboard.setVisitTotalCount"); 
	}


	public int getVisitTotalCount() { 
		return mybatis.selectOne("Dashboard.getVisitTotalCount"); }

	public int getVisitTodayCount() { 
		return mybatis.selectOne("Dashboard.getVisitTodayCount"); }

	public int insertVisitor(int visitcnt) { 
		return mybatis.insert("Dashboard.insertVisitor", visitcnt); }
	/*
	 * public int updateVisitor() { return
	 * mybatis.update("Dashboard.updateVisitor"); }
	 */



}
