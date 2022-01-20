package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ComReplyDAO;
import kh.spring.dto.ComReplyDTO;

@Service
public class ComReplyService {

	@Autowired
	public ComReplyDAO rdao;
	
	public int reply(int rseq, String reply) {

		return rdao.insert(rseq, reply);
	}
	
	public List<ComReplyDTO> selectAll(int seq) {
		return rdao.selectAll(seq);
	}
	
	public int modify(ComReplyDTO rdto) {
		
		return rdao.modify(rdto);
	}
	
	public int delete(int seq) {
		
		return rdao.delete(seq);
	}
	
}
