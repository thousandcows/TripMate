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

	public int insert(TourBoardDTO dto) {

		System.out.println(dto.getCategory() + " : " + dto.getTitle() + " : " + dto.getContents());
		return mybatis.insert("TourBoard.insert", dto);
	}

	public TourBoardDTO selectBySeq(int seq) {

		return mybatis.selectOne("TourBoard.selectBySeq", seq);
	}
	
	public int addViewCount(int seq) {

		return mybatis.update("TourBoard.addViewCount", seq);
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
