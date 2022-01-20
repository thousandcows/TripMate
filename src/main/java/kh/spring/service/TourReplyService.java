package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TourReplyDAO;
import kh.spring.dto.TourReplyDTO;
import kh.spring.dto.TourReplyReplyDTO;

@Service
public class TourReplyService {

	@Autowired
	public TourReplyDAO rdao;

	@Autowired
	public TourReplyService rservice;

	public int reply(int rseq, String reply) {

		return rdao.insert(rseq, reply);
	}
	
	public List<TourReplyDTO> selectAll(int seq) {
		return rdao.selectAll(seq);
	}
	
	public int modify(TourReplyDTO rdto) {
		
		return rdao.modify(rdto);
	}
	
	public int delete(int seq) {
		
		return rdao.delete(seq);
	}

	public int reinsert(int rpseq, String recontent) {
		
		return rdao.reinsert(rpseq, recontent);
	}
	
	public List<TourReplyReplyDTO> selectReAll(){
	
		return rdao.selectReAll();
	}
	
	public int remodify(int idseq, String content) {
		
		return rdao.remodify(idseq, content);
	}
	
	public int redelete(int idseq) {
		
		return rdao.redelete(idseq);
	}
}
