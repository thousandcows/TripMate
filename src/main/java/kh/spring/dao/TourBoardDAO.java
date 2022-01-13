package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.TourBoardDTO;

@Repository
public class TourBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<TourBoardDTO> selectAll() {

		return mybatis.selectList("TourBoard.selectAll");
	}

	public int insert(String title, String contents) {

		System.out.println("DAO에서의 title : " + title);
		System.out.println("DAO에서의 contents : " + contents);
		Map<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("contents", contents);
		return mybatis.insert("TourBoard.insert", map);
	}

	public TourBoardDTO selectBySeq(int seq) {

		return mybatis.selectOne("TourBoard.selectBySeq", seq);
	}
	
	public int modify(int seq, String title, String contents) {
		
		Map<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("seq", String.valueOf(seq));

		return mybatis.update("TourBoard.modify", map);
	}
	
	public int delete(int seq) {
		
		return mybatis.delete("TourBoard.delete", seq);
	}
	
	
	
	
	
}
