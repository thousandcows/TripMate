package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AdminDAO;
import kh.spring.dto.CompanyBoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NoticeDTO;
import kh.spring.dto.TourBoardDTO;

@Service
public class AdminService {

	@Autowired
	public AdminDAO adao;
	
	public List<MemberDTO> memberAllList(){
		return adao.memberAllList();		
	}
	
	public List<TourBoardDTO> tourboardAllList(){
		
		return adao.tourboardAllList();
	}
	
	public List<CompanyBoardDTO> companyboardAllList(){
		
		return adao.companyboardAllList();
	}
	
	public List<NoticeDTO> noticeAllList(){
	
		return adao.noticeAllList();
	}
	
	public int boardDelete(int boardNum, int seq) {
		
		adao.boardReplyReplyDelete(boardNum, seq);
		adao.boardReplyDelete(boardNum, seq);
		return adao.boardDelete(boardNum, seq);
	}
	
	public int memberLeave(int seq) {
		
		return adao.memberLeave(seq);
	}
	
	public int noticeInsert(NoticeDTO ndto) {
		
		return adao.noticeInsert(ndto);
	}
	
}
