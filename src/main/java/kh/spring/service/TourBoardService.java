package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TourBoardDAO;
import kh.spring.dto.TourBoardDTO;

@Service
public class TourBoardService {

	@Autowired
	public TourBoardDAO dao;
	
	@Autowired
	public TourBoardService bservice;
	
	public List<TourBoardDTO> selectAll() {
		return dao.selectAll();
	}
	
	public int writeProc(TourBoardDTO dto) {
		
		return dao.insert(dto);
	}
	
	public TourBoardDTO selectBySeq(int seq) {
		return dao.selectBySeq(seq);
	}
	
	public int addViewCount(int seq) {
		return dao.addViewCount(seq);
	}
	
	public int modify(int seq, String title, String contents) {
		return dao.modify(seq, title, contents);
	}
	
	public int delete(int seq) {
		return dao.delete(seq);
	}
	
	
	
}
