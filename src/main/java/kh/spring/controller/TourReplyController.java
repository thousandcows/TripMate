package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.TourReplyDAO;
import kh.spring.dto.TourReplyDTO;
import kh.spring.dto.TourReplyReplyDTO;
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
		
		rservice.reinsert(rpseq, recontents);
		return "redirect:/tourboard/detail?seq="+writeseq;
	}
	
	@RequestMapping("remodify")
	public String remodify(int writeseq, int idseq, String recontent) {
		
		System.out.println(idseq + " : " + recontent);
		rservice.remodify(idseq, recontent);
		return "redirect:/tourboard/detail?seq="+writeseq;
	}
	
	@RequestMapping("redelete")
	public String redelete(int idseq, int writeseq) {
		
		System.out.println(idseq + " : " + writeseq);
		rservice.redelete(idseq);
		return "redirect:/tourboard/detail?seq="+writeseq;
	}
}
