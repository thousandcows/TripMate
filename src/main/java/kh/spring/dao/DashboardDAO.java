package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.DashboardDTO;

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


}
