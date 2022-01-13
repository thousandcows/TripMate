package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import kh.spring.dto.KakaoProfile;
import kh.spring.dto.KakaoToken;
import kh.spring.dto.MemberDTO;
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
			MemberDTO dto = memberService.normalLoginSelectAll(emailID, pw);
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
	
	@RequestMapping("kakaoLogin") // 서비스레이어로 뺄까 고민했지만 Http통신이 있어 컨트롤러에 있는게 맞을듯
	public String kakaoLogin(String code, String error) {
		System.out.println("반환된 카카오로그인 코드 : " + code);
		System.out.println("반환된 카카오로그인 에러코드 : " + error);
		if(error != null) { // 에러코드가 있다면 사용자가 무언가 취소를 한것.(걍 null이 아닐때 전부 메인으로 보내버리면될수도)
			if(error.equals("")) {
				// 에러코드마다 다른 대비책을 세워야 할곳.
			}
		}
		
		Gson gson = new Gson();
		// POST방식으로 key=value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate(); // 기본제공되는 API
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // 내가 보낼 데이터 타입이 key=value값이다
		
		// HttpBody 오브젝트 생성( POST방식은 Body에 담아 보내야 하니까 )
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", CLIENT_ID);
		params.add("redirect_uri", REDIRECT_URL);
		params.add("code", code);
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		// Http 요청하기 - POST방식 - 그리고 response 변수응답받음.
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoTokenRequest, String.class);
		
		// json객체를 자바객체로 변환
		KakaoToken data = gson.fromJson(response.getBody(), KakaoToken.class);
		// 얻은 액세스 토큰
		System.out.println("얻어낸 액세스 토큰" + data.getAccess_token());
		
		/////// 액세스토큰을 이용해 유저정보 받기 //////
		RestTemplate rt2 = new RestTemplate();
		
		// HttpHeader2 오브젝트 생성
		HttpHeaders header2 = new HttpHeaders();
		header2.add("Authorization", "Bearer " + data.getAccess_token()); // 한칸 띄어야댐
		header2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpHeader 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest2 = new HttpEntity<>(header2);
		
		// Http 요청 POST방식
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoTokenRequest2, String.class);
		// 유저 정보 빼오기
		System.out.println("얻어낸 카카오 유저정보 : " + response2.getBody());
		
		// jsonpojo로 바꾸면 카멜케이스때문에 에러나는데 일일히 바꿔줬음. 근데 한번에 바꾸는거 있을듯.
		// 카카오 프로필정보 빼오는 코드(사용자가 동의 안해도 다빼옴;)
		KakaoProfile kProfile = gson.fromJson(response2.getBody(), KakaoProfile.class);
		// 이제 세션에 담아야됨 해당 이메일로 디비 조회 해보고, 등록된 사용자가 있다면 그걸 꺼내서 세션에 담고, 없다면 회원가입처리시켜버리면되겠다.
		String kakaoLoginEmail = kProfile.kakao_account.email + "/kakao";
		String kakaoLoginNick = kProfile.properties.nickname;
		
		int kakaoResult = memberService.kakaoLoginLookup(kakaoLoginEmail);
		if (kakaoResult == 1) { // 가입내역이 있다면 정보를 빼서 세션에 담고
			MemberDTO kakaoDto = memberService.kakaoLoginSelectAll(kakaoLoginEmail);
			session.setAttribute("loginSeq", kakaoDto.getSeq());
			session.setAttribute("loginEmailID", kakaoDto.getEmailID());
			session.setAttribute("loginNick", kakaoDto.getNick());
		} else { // 가입내역이 없다면 회원가입을 시키고 이메일이랑 닉네임만 세션에 바로 담아버리면 될듯했는데 seq때문에 또 빼와야하네
			memberService.kakaoSignup(kakaoLoginEmail, kakaoLoginNick);
			MemberDTO kakaoDto = memberService.kakaoLoginSelectAll(kakaoLoginEmail);
			session.setAttribute("loginSeq", kakaoDto.getSeq());
			session.setAttribute("loginEmailID", kakaoDto.getEmailID());
			session.setAttribute("loginNick", kakaoDto.getNick());
		}
		
		
		System.out.println("로그인한 카카오 이메일 : " + kProfile.kakao_account.email);
		System.out.println("로그인한 카카오 id값 : " + kProfile.id);
		System.out.println("로그인한 카카오 닉네임 : " + kProfile.properties.nickname);
		System.out.println("로그인한 카카오 프로필이미지 : " + kProfile.properties.profile_image);
		System.out.println("로그인한 카카오 성별 : " + kProfile.kakao_account.gender);
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		e.getMessage();
		return "redirect:/";
	}
}
