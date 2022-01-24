package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("reply")
	public String reply(int rseq, String reply, HttpServletRequest request) {
		
		int seq = rseq;
		String loginNick = (String)request.getSession().getAttribute("loginNick");
		int mem_seq = (int)session.getAttribute("loginSeq");
		rservice.reply(seq, reply, loginNick, mem_seq);
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
	public String rereply(int writeseq, int rpseq, String recontents, HttpServletRequest request) {
		
		String loginNick = (String)request.getSession().getAttribute("loginNick");
		rservice.reinsert(rpseq, recontents, loginNick);
		return "redirect:/tourboard/detail?seq="+writeseq;
	}
	
	@RequestMapping("remodify")
	public String remodify(int writeseq, int idseq, String recontent) {
		
		rservice.remodify(idseq, recontent);
		return "redirect:/tourboard/detail?seq="+writeseq;
	}
	
	@RequestMapping("redelete")
	public String redelete(int idseq, int writeseq) {
		
		rservice.redelete(idseq);
		return "redirect:/tourboard/detail?seq="+writeseq;
	}
}
