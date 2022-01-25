package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.AreaDTO;
import kh.spring.dto.DetailPlanDTO;
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
	
	public List<PlanDTO> listing(int seq,int startNum,int endNum){
		Map<String,Integer> map = new HashMap<>();
		map.put("seq", seq);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return mybatis.selectList("Plan.getList",map);
	}
	
	public int listCount(int seq) {
		return mybatis.selectOne("Plan.listCount",seq);
	}
	
	public List<DetailPlanDTO> detailPlanSort(int seq, String date){
		Map<String,String> map = new HashMap<>();
		map.put("seq", Integer.toString(seq));
		map.put("date", date);
		return mybatis.selectList("Plan.detailPlanSort",map);
	}
	
	public AreaDTO planListPrint(int seq) {
		return mybatis.selectOne("Plan.planListPrint",seq);
	}
	
	public PlanDTO getDetail(int seq) {
		return mybatis.selectOne("Plan.getDetail",seq);
	}
	
	public int sortZero(int seq) {
		Map<String,Integer> map = new HashMap<>();
		map.put("seq",seq);
		map.put("tar", 0);
		mybatis.update("Plan.sortZero",map);
		return map.get("tar");
	}
	
	public void sortPlan(int firstSeq, int secondSeq) {
		Map<String,Integer> map = new HashMap<>();
		map.put("firstSeq", firstSeq);
		map.put("secondSeq", secondSeq);
		mybatis.update("Plan.sortPlan",map);
	}
	
	public void sortDatePlan(int seq, String day) {
		Map<String,String> map = new HashMap<>();
		map.put("seq", Integer.toString(seq));
		map.put("day", day);
		mybatis.update("Plan.sortDatePlan",map);
	}
	
	public void deletePlan(int seq) {
		mybatis.delete("Plan.deletePlan",seq);
	}
}
