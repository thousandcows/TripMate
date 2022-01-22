package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.AreaDTO;
import kh.spring.dto.AreaReplyDTO;
import kh.spring.dto.SavedDTO;

@Repository
public class AreaDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int saveCheck(SavedDTO dto) {
		return mybatis.selectOne("Area.saveCheck",dto);
	}
	
	public int saveInsert(SavedDTO dto) {
		return mybatis.insert("Area.saveInsert",dto);
	}
	
	public int saveDelete(SavedDTO dto) {
		return mybatis.delete("Area.saveDelete",dto);
	}
	
	public void replyInsert(AreaReplyDTO dto) {
		mybatis.insert("Area.replyInsert",dto);
	}
	
	public int replyCount(int area_seq) {
		return mybatis.selectOne("Area.replyCount",area_seq);
	}
	
	public List<AreaReplyDTO> replyPrint(int start,int end, int area_seq){
		Map<String,Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("area_seq", area_seq);
		return mybatis.selectList("Area.replyPrint", map);
	}
	
	public void replyDelete(int seq) {
		mybatis.delete("Area.replyDelete",seq);
	}
	
	public void replyUpdate(AreaReplyDTO dto) {
		mybatis.update("Area.replyUpdate",dto);
	}
	
	public double countRate(int area_seq) {
		return mybatis.selectOne("Area.countRate",area_seq);
	}
	
	public String findPhoto(int seq) {
		return mybatis.selectOne("Area.findPhoto",seq);
	}
	
	public int checkDB(int seq) {
		return mybatis.selectOne("Area.checkDB",seq);
	}
	
	public void insertArea(int seq,AreaDTO dto) {
		Map<String,String> map = new HashMap<>();
		map.put("seq", Integer.toString(seq));
		map.put("name", dto.getName());
		map.put("location", dto.getLocation());
		map.put("photo", dto.getPhoto());
		mybatis.insert("Area.insertArea",map);
	}
}
