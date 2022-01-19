package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.TourReplyDAO;
import kh.spring.dto.TourReplyDTO;
import kh.spring.service.TourReplyService;

@Controller
@RequestMapping("/tourreply/")
public class TourReplyController {
	
	@Autowired
	private TourReplyDAO rdao;
	
	@Autowired
	public TourReplyService rservice;
	
	@RequestMapping("reply")
	public String reply(int rseq, String reply) {
		int seq = rseq;
		rservice.reply(seq, reply);
		return "redirect:/tourboard/detail?seq="+seq;
	}
	
	@RequestMapping("modify")
	public String modify(TourReplyDTO rdto) {
		
		int result = rservice.modify(rdto);
		
		int bseq = rdto.getPar_seq();
		return "redirect:/tourboard/detail?seq="+bseq;
	}
	
	@RequestMapping("delete")
	public String delete(int rpseq, int bseq) {
		
		rservice.delete(rpseq);				
		return "redirect:/tourboard/detail?seq="+bseq;
	}
	
	@RequestMapping("rereply")
	public String rereply(int writeseq, int rpseq, String recontents) {
		
		System.out.println("submit 도착 : " + writeseq + " : " + rpseq + " : " + recontents);
		rservice.reinsert(rpseq, recontents);
		return "redirect:/tourboard/detail?seq="+writeseq;
	}
}
