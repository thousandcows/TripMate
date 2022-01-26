package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ComBoardLikeDTO;
import kh.spring.dto.ComMemDTO;
import kh.spring.dto.CompanyBoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NoticeDTO;

@Repository
public class CompanyBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//CRUD
	public int insert(CompanyBoardDTO dto) {
		return mybatis.insert("CompanyBoard.insert",dto);
	}
	
	public List<CompanyBoardDTO> selectAll(int start, int end, String searchOption, String searchText){
		if (searchOption==null) {
			Map<String, String> map = new HashMap<>();
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			return mybatis.selectList("CompanyBoard.selectAll", map);
			
		}else if(searchOption.equals("search_title")){
			Map<String, String> map = new HashMap<>();
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
			map.put("searchText", searchText);

			return mybatis.selectList("CompanyBoard.selectAllTitle", map);
			
		}else {
			Map<String, String> map = new HashMap<>();
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
			map.put("searchText", searchText);

			return mybatis.selectList("CompanyBoard.selectAllWriter", map);
		}
	}
	
	public List<NoticeDTO> ntselectAll(){
		
		return mybatis.selectList("CompanyBoard.ntselectAll");
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
	public int getRecordCount(String searchOption, String searchText) throws Exception {

		System.out.println("DAO recoredCount에서의 searchOption : " + searchOption);
		
		if (searchOption==null) {
			return mybatis.selectOne("CompanyBoard.recordCount");
			
		} else if(searchOption.equals("search_title")){
			return mybatis.selectOne("CompanyBoard.recordCountTitle", searchText);
			
		}else {
			System.out.println("DAO recordCount에서 작성자로 찾는 중  : " + searchText);
			return mybatis.selectOne("CompanyBoard.recordCountWriter", searchText);
		}
	}
	
	//	좋아요
	/*
	 * public int getBoardLike(ComBoardLikeDTO dto) throws Exception { return
	 * mybatis.selectOne("CompanyBoard.getBoardLike", dto); }
	 */
	public void insertBoardLike(ComBoardLikeDTO dto) throws Exception {
        mybatis.insert("CompanyBoard.createBoardLike",dto);
    }
	
	public void deleteBoardLike(ComBoardLikeDTO dto) throws Exception {
       mybatis.delete("CompanyBoard.deleteBoardLike", dto);
    }

	public void updateBoardLike(int boardId) throws Exception {
        mybatis.update("CompanyBoard.updateBoardLike",boardId);
    }
	
	public int totalBoardLike(int seq) throws Exception {
        return mybatis.selectOne("CompanyBoard.totalBoardLike",seq);
    }
	
	// 뎃글 카운트
	public int replyCount(int seq) {
		Map<String, String> map = new HashMap<>();
		map.put("seq", String.valueOf(seq));
		return mybatis.selectOne("CompanyBoard.replyCount", map);
	}
	
	
	
	// 대댓글 카운트
	public int replyReplyCount(int seq) {
		Map<String, String> map = new HashMap<>();
		map.put("seq", String.valueOf(seq));
		return mybatis.selectOne("CompanyBoard.replyReplyCount", map);
	}
	
	//댓글 개수
	public int addReplyCount(int seq, int totalReplyCount) {
	      
	      Map<String, String> map = new HashMap<>();
	      map.put("seq", String.valueOf(seq));
	      map.put("rep_count", String.valueOf(totalReplyCount));
	      return mybatis.update("CompanyBoard.totalReplyCount", map);
	}
	
	// 참여멤버 insert
	public int insertMem(ComMemDTO dto) {
		return mybatis.insert("CompanyBoard.insertMem",dto);
	}
	
	// 마감
	public int updateExpired(int seq) {
		return mybatis.update("CompanyBoard.updateExpired",seq);
	}
	
	// 마감 취소
	public int updateExpiredCancel(int seq) {
		return mybatis.update("CompanyBoard.updateExpiredCancel",seq);
	}
	
	// 신청자 리스트	
	public List<MemberDTO> selectAllMem(int seq){
		Map<String, String> map = new HashMap<>();
		map.put("seq", String.valueOf(seq));
		return mybatis.selectList("CompanyBoard.selectAllMem", seq);
	}
	
	// 신청자 삭제
	public int deleteMem(int seq) {
		return mybatis.delete("CompanyBoard.deleteMem", seq);
	}
	
	// 신청자 카운트
	public int memCount(int seq) {;
		return mybatis.selectOne("CompanyBoard.memCount", seq);
	}
	
	// 중복체크
	public int memDuplCheck(ComMemDTO dto) {
		return mybatis.selectOne("CompanyBoard.memDuplCheck",dto);
	}
	
	public int likeDuplCheck(ComBoardLikeDTO dto) {
		return mybatis.selectOne("CompanyBoard.likeDuplCheck",dto);
	}
}
