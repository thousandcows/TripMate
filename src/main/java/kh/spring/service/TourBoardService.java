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
	
	public int writeProc(String title, String contents) {
		System.out.println("서비스에서의 값 : " + title + " " + contents);
		return dao.insert(title, contents);
	}
	
	public TourBoardDTO selectBySeq(int seq) {
		return dao.selectBySeq(seq);
	}
	
	public int modify(int seq, String title, String contents) {
		return dao.modify(seq, title, contents);
	}
	
	
	
	
	
}
