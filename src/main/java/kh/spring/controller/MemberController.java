package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.NormalMemberDTO;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	public MemberService memberService;
	
	@Autowired
	private HttpSession session;
	
	// 이메일 체크
	@ResponseBody
	@RequestMapping(value="emailCheck", produces="application/text;charset=utf-8")
	public String emailChek(String email) {
		System.out.println("넘어온 일반회원가입 이메일값 : " + email);
		System.out.println("보내는 일반회원가입 이메일 확인값 : " + memberService.emailCheck(email));
		return String.valueOf(memberService.emailCheck(email));
	}
	
	// 닉네임 체크
	@ResponseBody
	@RequestMapping(value="nickNameCheck", produces="application/text;charset=utf-8")
	public String nickNameCheck(String nickName) {
		System.out.println("넘어온 일반회원가입 닉네임값 : " + nickName);
		System.out.println("보내는 일반회원가입 닉네임 확인값 : " + memberService.nickNameCheck(nickName));
		return String.valueOf(memberService.nickNameCheck(nickName));
	}
	
	// 휴대폰 체크
	@ResponseBody
	@RequestMapping(value="phoneCheck", produces="application/text;charset=utf-8")
	public String phoneCheck(String phone) {
		System.out.println("넘어온 일반회원가입 휴대폰값 : " + phone);
		System.out.println("보내는 일반회원가입 휴대폰 확인값 : " + memberService.phoneCheck(phone));
		return String.valueOf(memberService.phoneCheck(phone));
	}
	
	// 일반 회원가입
	@RequestMapping("normalSignup")
	public String normalSignup(String emailID, String nick, String phone, String pw) {
		memberService.normalSignup(emailID, nick, phone, pw);
		return "redirect:/";
	}
	
	// 일반 로그인
	@ResponseBody
	@RequestMapping(value="normalLogin", produces="application/text;charset=utf-8")
	public String normalLogin(String emailID, String pw) {
		System.out.println("넘어온 일반로그인 아이디 : " + emailID);
		System.out.println("넘어온 일반로그인 PW : " + pw);
		int result = memberService.normalLoginCheck(emailID, pw);
		System.out.println("로그인 조회 결과 : " + result);
		if(result == 0) {
			return "0";
		} else {
			NormalMemberDTO dto = memberService.normalLoginSelectAll(emailID, pw);
			session.setAttribute("loginSeq", dto.getSeq());
			session.setAttribute("loginEmailID", dto.getEmailID());
			session.setAttribute("loginNick", dto.getNick());
			return "1";
		}
	}
	
	// 일반 로그아웃?
	@RequestMapping("normalLogout")
	public String normalLogout() {
//		session.removeAttribute("loginEmailID");
		session.invalidate(); // 이게 맞을듯
		return "redirect:/";
		// 나중에 현재페이지 로그인&로그아웃으로 변경할것
	}
	
	
	
	
	
	// 일반 회원가입
	@RequestMapping("nomalSignup")
	public String signup() {
		// 바로 로그인되게 해버릴까 고민중
		return "/";
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		e.getMessage();
		return "redirect:/";
	}
}
