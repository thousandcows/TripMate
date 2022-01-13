package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.KakaoProfile;
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
	@RequestMapping(value = "emailCheck", produces = "application/text;charset=utf-8")
	public String emailChek(String email) {
		System.out.println("넘어온 일반회원가입 이메일값 : " + email);
		System.out.println("보내는 일반회원가입 이메일 확인값 : " + memberService.emailCheck(email));
		return String.valueOf(memberService.emailCheck(email));
	}

	// 닉네임 체크
	@ResponseBody
	@RequestMapping(value = "nickNameCheck", produces = "application/text;charset=utf-8")
	public String nickNameCheck(String nickName) {
		System.out.println("넘어온 일반회원가입 닉네임값 : " + nickName);
		System.out.println("보내는 일반회원가입 닉네임 확인값 : " + memberService.nickNameCheck(nickName));
		return String.valueOf(memberService.nickNameCheck(nickName));
	}

	// 휴대폰 체크
	@ResponseBody
	@RequestMapping(value = "phoneCheck", produces = "application/text;charset=utf-8")
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
		// 바로 로그인되게 해버릴까 고민중
	}

	// 일반 로그인
	@ResponseBody
	@RequestMapping(value = "normalLogin", produces = "application/text;charset=utf-8")
	public String normalLogin(String emailID, String pw) {
		System.out.println("넘어온 일반로그인 아이디 : " + emailID);
		System.out.println("넘어온 일반로그인 PW : " + pw);
		int result = memberService.normalLoginCheck(emailID, pw);
		System.out.println("로그인 조회 결과 : " + result);
		if (result == 0) {
			return "0";
		} else {
			NormalMemberDTO dto = memberService.normalLoginSelectAll(emailID, pw);
			session.setAttribute("loginSeq", dto.getSeq());
			session.setAttribute("loginEmailID", dto.getEmailID());
			session.setAttribute("loginNick", dto.getNick());
			return "1";
		}
	}

	// 일반 로그아웃(프론트 미구현)
	@RequestMapping("normalLogout")
	public String normalLogout() {
//		session.removeAttribute("loginEmailID");
		session.invalidate(); // 이게 맞을듯
		return "redirect:/";
		// 나중에 현재페이지 로그인&로그아웃으로 변경할것
	}

	///////////// 카카오 로그인 시작 /////////////
	private final String CLIENT_ID = "b7b0a7f6722957ddef971b2ff4061bd7"; // REST ID
	private final String REDIRECT_URL = "http://localhost/member/kakaoLogin"; // 리퀘스트시킬 URL(나중엔 아이피로 변경 카카오 디벨로퍼에서도 변경해줘야함.)

	@ResponseBody
	@RequestMapping("getKakaoAuthUrl")
	public String getKakaoAuthUrl() { // 로그인 ajax동작시 오는곳(카카오 자체 서버에서 코드를 받아와야하기때문)
		String KaUrl = "https://kauth.kakao.com/oauth/authorize?client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URL + "&response_type=code";
		return KaUrl; // 이러면 여기 코드가 왔겠지
	}
	
	@RequestMapping("kakaoLogin") // 우선 전부 여기에 작성 후 나중에 서비스레이어로 뺄것.
	public String kakaoLogin(String code, String error) {
		KakaoProfile kProfile = memberService.kakaoLogin(code, error);
		// 여기서 세션에 담고 리턴시켜야됨 
		System.out.println("반환된 카카오로그인 코드 : " + code);
		System.out.println("반환된 카카오로그인 에러코드 : " + error);
		return "/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		e.getMessage();
		return "redirect:/";
	}
}
