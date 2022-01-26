package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CompanyBoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NoticeDTO;
import kh.spring.dto.TourBoardDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberDTO> memberAllList(){
		
		return mybatis.selectList("Admin.memberAllList");
	}
	
	public List<TourBoardDTO> tourboardAllList(){
		
		return mybatis.selectList("Admin.tourboardAllList");
	}
	
	public List<CompanyBoardDTO> companyboardAllList(){
		
		return mybatis.selectList("Admin.companyboardAllList");
	}
	
	public List<NoticeDTO> noticeAllList(){
		
		return mybatis.selectList("Admin.noticeAllList");
	}
	
	public int boardDelete(int boardNum, int seq) {
		
		if(boardNum==1) {			
			return mybatis.delete("Admin.tourboardDelete", seq);
			
		}else if(boardNum==2){			
			return mybatis.delete("Admin.companyboardDelete", seq);
			
		}else {			
			return mybatis.delete("Admin.noticeDelete", seq);
		}
	}
	
	public int boardReplyDelete(int boardNum, int seq) {
		
		if(boardNum==1) {
			return mybatis.delete("Admin.tourboardReplyDelete", seq);
			
		}else {
			return mybatis.delete("Admin.companyboardReplyDelete", seq);
		}
	}
	
	public int boardReplyReplyDelete(int boardNum, int seq) {
		
		if(boardNum==1) {
			return mybatis.delete("Admin.tourboardReplyReplyDelete", seq);
			
		}else {
			return mybatis.delete("Admin.companyboardReplyReplyDelete", seq);
		}
	}
	
	public int memberLeave(int seq) {
		
		return mybatis.delete("Admin.memberLeave",seq);
	}
	
	public int noticeInsert(NoticeDTO ndto) {
		
		return mybatis.insert("Admin.noticeInsert", ndto);
	}
	
	public NoticeDTO selectBySeq(int seq) {
		
		return mybatis.selectOne("Admin.selectBySeq", seq);
	}
	
	public int noticeModify(int seq, String title, String contents) {
		
		Map<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("seq", String.valueOf(seq));
		return mybatis.update("Admin.noticeModify", map);
	}
}
