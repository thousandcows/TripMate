package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ComReplyDAO;
import kh.spring.dto.ComReplyDTO;
import kh.spring.dto.ComReplyReplyDTO;

@Service
public class ComReplyService {

	@Autowired
	public ComReplyDAO rdao;
	
	public int reply(int rseq, String reply, String nick, int mem_seq) {

		System.out.println("서비스 nick : " + nick + "mem_seq : " + mem_seq);
		return rdao.insert(rseq, reply, nick, mem_seq);
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
	
	public int reinsert(int rpseq, String recontent, String nick, int mem_seq) {
		
		return rdao.reinsert(rpseq, recontent, nick, mem_seq);
	}
	
	public List<ComReplyReplyDTO> selectReAll(){
	
		return rdao.selectReAll();
	}
	
	public int remodify(int idseq, String content) {
		
		return rdao.remodify(idseq, content);
	}
	
	public int redelete(int idseq) {
		
		return rdao.redelete(idseq);
	}
	
}
