package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.TourReplyDAO;
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
}
