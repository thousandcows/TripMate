package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.DashboardDAO;
import kh.spring.dto.DashboardDTO;

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
	
	public int cntMember() {
		return ddao.cntMember();
	}


}
