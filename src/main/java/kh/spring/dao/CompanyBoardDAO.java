package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ComBoardLikeDTO;
import kh.spring.dto.CompanyBoardDTO;

@Repository
public class CompanyBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//CRUD
	public int insert(CompanyBoardDTO dto) {
		return mybatis.insert("CompanyBoard.insert",dto);
	}
	
	public List<CompanyBoardDTO> selectAll(int start, int end){
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		return mybatis.selectList("CompanyBoard.selectAll", map);
	}
	
	public CompanyBoardDTO selectBySeq(int seq) {
		return mybatis.selectOne("CompanyBoard.selectBySeq",seq);
	}

	public int delete(int seq) {
		return mybatis.delete("CompanyBoard.delete", seq);
	}
	
	//좋아요 테이블 삭제
	public int delete2(int seq) {
		return mybatis.delete("CompanyBoard.delete2",seq);
	}
	
	public int modify(CompanyBoardDTO dto) {
		return mybatis.update("CompanyBoard.modify", dto);
	}
	
	// 조회수
	public int addViewCount(int seq) {
		return mybatis.update("CompanyBoard.addViewCount", seq);
	}
	
	// 페이징
	public int getRecordCount() throws Exception{
		return mybatis.selectOne("CompanyBoard.recordCount");
	}
	
	//	좋아요
	public int getBoardLike(ComBoardLikeDTO dto) throws Exception {
        return mybatis.selectOne("CompanyBoard.getBoardLike", dto);
    }
	
	public void insertBoardLike(ComBoardLikeDTO dto) throws Exception {
        mybatis.insert("CompanyBoard.createBoardLike",dto);
    }
	
	public void deleteBoardLike(ComBoardLikeDTO dto) throws Exception {
       mybatis.delete("CompanyBoard.deleteBoardLike", dto);
    }

	public void updateBoardLike(int boardId) throws Exception {
        mybatis.update("CompanyBoard.updateBoardLike",boardId);
    }
	
	// 뎃글 카운트
	public int replyCount(int seq) {
		Map<String, String> map = new HashMap<>();
		map.put("seq", String.valueOf(seq));
		return mybatis.selectOne("CompanyBoard.replyCount", map);
	}

}
