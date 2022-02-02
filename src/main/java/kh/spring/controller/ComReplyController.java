package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.ComReplyDAO;
import kh.spring.dto.ComReplyDTO;
import kh.spring.dto.CompanyBoardDTO;
import kh.spring.service.ComReplyService;

@Controller
@RequestMapping("/comreply/")
public class ComReplyController {

	@Autowired
	private ComReplyDAO dao;

	@Autowired
	public ComReplyService crs;

	@RequestMapping("reply")
	public String reply(int rseq, String reply, HttpServletRequest request) throws Exception {
		int seq = rseq;

		String nick = (String) request.getSession().getAttribute("loginNick");
		int mem_seq = (int) request.getSession().getAttribute("loginSeq");

		crs.reply(seq, reply, nick, mem_seq);	
		
		return "redirect:/companyboard/detail?seq=" + seq;
	}

	@RequestMapping("modify")
	public String modify(ComReplyDTO rdto) {
		
		int result = crs.modify(rdto);
		int bseq = rdto.getPar_seq();
		return "redirect:/companyboard/detail?seq=" + bseq;
	}

	@RequestMapping("delete")
	public String delete(int rpseq, int bseq) {

		crs.delete(rpseq);
		return "redirect:/companyboard/detail?seq=" + bseq;
	}

	@RequestMapping("rereply")
	public String rereply(int writeseq, int rpseq, String recontents, HttpServletRequest request) {

		String nick = (String) request.getSession().getAttribute("loginNick");
		int mem_seq = (int) request.getSession().getAttribute("loginSeq");

		crs.reinsert(rpseq, recontents, nick, mem_seq);
		return "redirect:/companyboard/detail?seq=" + writeseq;
	}

	@RequestMapping("remodify")
	public String remodify(int writeseq, int idseq, String recontent) {

		crs.remodify(idseq, recontent);
		return "redirect:/companyboard/detail?seq=" + writeseq;
	}

	@RequestMapping("redelete")
	public String redelete(int idseq, int writeseq) {

		crs.redelete(idseq);
		return "redirect:/companyboard/detail?seq=" + writeseq;
	}
}
