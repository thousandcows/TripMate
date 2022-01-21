package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.PlanDTO;

@Repository
public class PlanDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public PlanDTO callPlan(int seq) {
		return mybatis.selectOne("Plan.callPlan",seq);
	}
	
	public int createTheme(PlanDTO dto) {
		mybatis.insert("Plan.createTheme",dto);
		return dto.getSeq();
	}
	
	public void changeTheme(PlanDTO dto) {
		mybatis.update("Plan.changeTheme",dto);
	}
	
	public void saveList(int check,int par_seq) {
		Map<String,Integer> map = new HashMap<>();
		map.put("area_seq", check);
		map.put("par_seq", par_seq);
		mybatis.insert("Plan.saveList",map);
	}
}
