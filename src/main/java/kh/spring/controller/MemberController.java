package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	public MemberService memberService;
	
	// 이메일 체크
	@ResponseBody
	@RequestMapping(value="emailCheck", produces="application/text;charset=utf-8")
	public String emailChek(String email) {
		return String.valueOf(memberService.emailCheck(email));
	}
	
	// 일반 회원가입
	@RequestMapping("nomalSignup")
	public String signup() {
		
		return "/";
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		e.getMessage();
		return "redirect:/";
	}
}
