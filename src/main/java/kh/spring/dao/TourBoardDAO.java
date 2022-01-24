package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.TourBoardDTO;
import kh.spring.dto.TourBoardLikeDTO;

@Repository
public class TourBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<TourBoardDTO> selectAll(int start, int end, String searchOption, String searchText) {
		
		if (searchOption==null) {
			Map<String, String> map = new HashMap<>();
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			return mybatis.selectList("TourBoard.selectAll", map);
			
		}else if(searchOption.equals("search_title")){
			Map<String, String> map = new HashMap<>();
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
			map.put("searchText", searchText);

			return mybatis.selectList("TourBoard.selectAllTitle", map);
			
		}else {
			Map<String, String> map = new HashMap<>();
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
			map.put("searchText", searchText);

			return mybatis.selectList("TourBoard.selectAllWriter", map);
		}

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
		map.put("category", category);
		map.put("seq", String.valueOf(seq));

		return mybatis.update("TourBoard.modify", map);
	}

	public int delete(int seq) {

		return mybatis.delete("TourBoard.delete", seq);
	}

	public int getRecordCount(String searchOption, String searchText) throws Exception {
		
		if (searchOption==null) {
			return mybatis.selectOne("TourBoard.recordCount");
			
		} else if(searchOption.equals("search_title")){
			return mybatis.selectOne("TourBoard.recordCountTitle", searchText);
			
		}else {
			return mybatis.selectOne("TourBoard.recordCountWriter", searchText);
		}
	}

	public int replyCount(int seq) {

		Map<String, String> map = new HashMap<>();
		map.put("seq", String.valueOf(seq));
		return mybatis.selectOne("TourBoard.replyCount", map);
	}

	public int replyReplyCount(int seq) {

		Map<String, String> map = new HashMap<>();
		map.put("seq", String.valueOf(seq));
		return mybatis.selectOne("TourBoard.relyReplyCount", map);
	}
	
	public int addReplyCount(int seq, int totalReplyCount) {
		
		Map<String, String> map = new HashMap<>();
		map.put("seq", String.valueOf(seq));
		map.put("rep_count", String.valueOf(totalReplyCount));
		return mybatis.update("TourBoard.totalReplyCount", map);
	}
	
	public int delete2(int seq) {
		
		return mybatis.delete("TourBoard.delete2", seq);
	}
	public int getBoardLike(TourBoardLikeDTO dto) throws Exception{
		
		return mybatis.selectOne("TourBoard.getBoardLike", dto);
	}
	
	public void insertBoardLike(TourBoardLikeDTO dto) throws Exception{
		
		mybatis.insert("TourBoard.createBoardLike", dto);
	}
	
	public void deleteBoardLike(TourBoardLikeDTO dto) throws Exception{
		
		mybatis.delete("TourBoard.deleteBoardLike", dto);
	}
	
	public void updateBoardLike(int boardId) throws Exception{
		
		mybatis.update("TourBoard.updateBoardLike", boardId);
	}

}
