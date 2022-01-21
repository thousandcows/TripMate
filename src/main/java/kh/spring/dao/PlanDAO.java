package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.PlanDTO;

@Repository
public class PlanDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void chooseTheme(PlanDTO dto) {
		mybatis.insert("Plan.chooseTheme",dto);
	}
}
