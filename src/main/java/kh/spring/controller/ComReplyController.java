package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.ComReplyDAO;
import kh.spring.dto.ComReplyDTO;
import kh.spring.service.ComReplyService;

@Controller
@RequestMapping("/comreply/")
public class ComReplyController {

	@Autowired
	private ComReplyDAO dao;
	
	@Autowired
	public ComReplyService crs;
	
	@RequestMapping("reply")
	public String reply(int rseq, String reply) {
		int seq = rseq;
		crs.reply(seq, reply);
		return "redirect:/companyboard/detail?seq="+seq;
	}
	
	@RequestMapping("modify")
	public String modify(ComReplyDTO rdto) {
		
		int result = crs.modify(rdto);
		
		int bseq = rdto.getPar_seq();
		return "redirect:/tourboard/detail?seq="+bseq;
	}
	
	@RequestMapping("delete")
	public String delete(int rpseq, int bseq) {
		
		crs.delete(rpseq);				
		return "redirect:/tourboard/detail?seq="+bseq;
	}
}
