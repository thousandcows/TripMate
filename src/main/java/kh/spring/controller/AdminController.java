package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.CompanyBoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NoticeDTO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Autowired
	public AdminService aservice;

	@Autowired
	private HttpSession session;

	@RequestMapping("dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}

	@RequestMapping("member")
	public String member(Model model) {
		
		List<MemberDTO> mem_list = aservice.memberAllList();
		
		model.addAttribute("mem_list", mem_list);
		return "admin/member";
	}

	@RequestMapping("board")
	public String board(Model model) {

		List<TourBoardDTO> tb_list = aservice.tourboardAllList();
		List<CompanyBoardDTO> cb_list = aservice.companyboardAllList();
		
		model.addAttribute("tb_list", tb_list);
		model.addAttribute("cb_list", cb_list);
		
		return "admin/board";
	}
	
	@RequestMapping("notice")
	public String notice(Model model) {
		
		List<NoticeDTO> nt_list = aservice.noticeAllList();
		
		model.addAttribute("nt_list", nt_list);
		return "admin/notice";
	}
	
	@RequestMapping("noticeWrite")
	public String noticeWrite() {
		
		return "admin/noticeWrite";
	}
	
	@RequestMapping("noticeEnroll")
	public String noticeEnroll(NoticeDTO ndto) {
		
		aservice.noticeInsert(ndto);
		return "redirect:/admin/notice";
	}
	
	@RequestMapping("delete")
	public String delete(int seq, int boardNum) {

		aservice.boardDelete(boardNum, seq);
		
		if(boardNum==0) {			
			return "redirect:/admin/notice";
			
		}else {			
			return "redirect:/admin/board";			
		}		
	}
	
	@RequestMapping("leave")
	public String leave(int seq) {
		
		aservice.memberLeave(seq);
		return "redirect:/admin/member";
	}
	
	@RequestMapping("noticeDetail")
	public String noticeDetail(int seq, Model model) {
		
		NoticeDTO ndto = aservice.selectBySeq(seq);
		
		model.addAttribute("ndto", ndto);
		return "/admin/noticeDetail";
	}
	
	@RequestMapping("noticeModify")
	public String noticeModify(int seq, String title, String contents) {
		
		aservice.noticeModify(seq, title, contents);
		return "redirect:/admin/noticeDetail?seq="+seq;
	}
}
