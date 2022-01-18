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

	public List<TourBoardDTO> selectAll(int start, int end) {

		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("TourBoard.selectAll", map);
	}

	public int insert(TourBoardDTO bdto) {

		return mybatis.insert("TourBoard.insert", bdto);
	}

	public TourBoardDTO selectBySeq(int seq) {

		return mybatis.selectOne("TourBoard.selectBySeq", seq);
	}
	
	public int addViewCount(int seq) {

		return mybatis.update("TourBoard.addViewCount", seq);
	}
	
	public int modify(int seq, String title, String contents, String category) {
		
		Map<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("category",  category);
		map.put("seq", String.valueOf(seq));

		return mybatis.update("TourBoard.modify", map);
	}
	
	public int delete(int seq) {
		
		return mybatis.delete("TourBoard.delete", seq);
	}
	
	public int getRecordCount() throws Exception{
		
		return mybatis.selectOne("TourBoard.recordCount");
	}
	
	
	
}
