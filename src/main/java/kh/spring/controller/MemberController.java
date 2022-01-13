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
		System.out.println("넘어온 이메일값 : " + email);
		System.out.println("보내는 이메일 확인값 : " + memberService.emailCheck(email));
		return String.valueOf(memberService.emailCheck(email));
	}
	
	// 닉네임 체크
	@ResponseBody
	@RequestMapping(value="nickNameCheck", produces="application/text;charset=utf-8")
	public String nickNameCheck(String nickName) {
		System.out.println("넘어온 닉네임값 : " + nickName);
		System.out.println("보내는 닉네임 확인값 : " + memberService.nickNameCheck(nickName));
		return String.valueOf(memberService.nickNameCheck(nickName));
	}
	
	// 휴대폰 체크
	@ResponseBody
	@RequestMapping(value="phoneCheck", produces="application/text;charset=utf-8")
	public String phoneCheck(String phone) {
		System.out.println("넘어온 휴대폰값 : " + phone);
		System.out.println("보내는 휴대폰 확인값 : " + memberService.phoneCheck(phone));
		return String.valueOf(memberService.phoneCheck(phone));
	}
	
	// 회원가입 구현 예정
//	@RequestMapping("normalSignup")
//	public String normalSignup() {
//		
//	}
	
	
	
	
	
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
