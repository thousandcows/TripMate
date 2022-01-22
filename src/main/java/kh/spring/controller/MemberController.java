package kh.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.dto.AreaDTO;
import kh.spring.dto.KakaoProfile;
import kh.spring.dto.KakaoToken;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.MyPostDTO;
import kh.spring.service.AreaService;
import kh.spring.service.MemberService;
import kh.spring.statics.Statics;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	public MemberService memberService;

	@Autowired
	public AreaService areaService;

	@Autowired
	private HttpSession session;

	// 이메일 체크
	@ResponseBody
	@RequestMapping(value = "emailCheck", produces = "application/text;charset=utf-8")
	public String emailChek(String email) {
		return String.valueOf(memberService.emailCheck(email));
	}

	// 닉네임 체크
	@ResponseBody
	@RequestMapping(value = "nickNameCheck", produces = "application/text;charset=utf-8")
	public String nickNameCheck(String nickName) {
		return String.valueOf(memberService.nickNameCheck(nickName));
	}

	// 휴대폰 체크
	@ResponseBody
	@RequestMapping(value = "phoneCheck", produces = "application/text;charset=utf-8")
	public String phoneCheck(String phone) {
		return String.valueOf(memberService.phoneCheck(phone));
	}

	// 일반 회원가입&즉시 로그인
	@RequestMapping("normalSignup")
	public String normalSignup(String emailID, String nick, String phone, String pw, String gender) {
		memberService.normalSignup(emailID, nick, phone, pw, gender);
		MemberDTO dto = memberService.normalLoginSelectAll(emailID, pw);
		session.setAttribute("loginSeq", dto.getSeq());
		session.setAttribute("loginEmailID", dto.getEmailID());
		session.setAttribute("loginNick", dto.getNick());
		session.setAttribute("loginGender", dto.getGender());
		return "redirect:/";
	}

	// 일반 로그인
	@ResponseBody
	@RequestMapping(value = "normalLogin", produces = "application/text;charset=utf-8")
	public String normalLogin(String emailID, String pw) {
		int result = memberService.normalLoginCheck(emailID, pw);
		if (result == 0) {
			return "0";
		} else {
			MemberDTO dto = memberService.normalLoginSelectAll(emailID, pw);
			session.setAttribute("loginSeq", dto.getSeq());
			session.setAttribute("loginEmailID", dto.getEmailID());
			session.setAttribute("loginNick", dto.getNick());
			session.setAttribute("loginGender", dto.getGender());
			return "1";
		}
	}

	// PW 찾기
	String findPwTargetEmail = ""; // 찾을 email을 기억

	@ResponseBody
	@RequestMapping(value = "findPw", produces = "application/text;charset=utf-8")
	public String pwFindPopup(String emailID) throws AddressException, MessagingException {
		int result = memberService.emailCheck(emailID);
		if (result == 0) {
			return "0";
		}
		// 이메일 발송 시작
		findPwTargetEmail = emailID; // 받는사람의 이메일

		// SMTP 서버정보랑 사용자등록해서 Session 인스턴스 생성
		Session mailSession = Session.getDefaultInstance(memberService.smtpSetting(), new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Statics.FIND_PW_CALLER_EMAIL, Statics.FIND_PW_CALLER_PW);
			}
		});

		// Message 클래스로 수신자랑 내용 제목의 메세지 전달
		MimeMessage message = new MimeMessage(mailSession);
		message.setFrom(new InternetAddress(Statics.FIND_PW_CALLER_EMAIL));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(findPwTargetEmail));
		message.setSubject("TripMate PW찾기 인증번호입니다.");
		int verificationCode = (int) (Math.random() * (9999 - 1000)) + 1000; // 얘때문에 애매하네
		message.setText("TripMate PW찾기 인증번호는 : " + verificationCode + " 입니다.");

		Transport.send(message);
		return String.valueOf(verificationCode);
	}

	// PW찾기 후 비밀번호 변경
	@RequestMapping("findPwChange")
	public String findPwChange(String pw) {
		memberService.findPwChange(findPwTargetEmail, pw);
		return "redirect:/";
	}

	// 카카오 코드생성
	@ResponseBody
	@RequestMapping("getKakaoAuthUrl")
	public String getKakaoAuthUrl() { // 로그인 ajax동작시 오는곳(카카오 자체 서버에서 코드를 받아와야하기때문)
		String KaUrl = "https://kauth.kakao.com/oauth/authorize?client_id=" + Statics.KAKAO_CLIENT_ID + "&redirect_uri="
				+ Statics.KAKAO_REDIRECT_URL + "&response_type=code";
		return KaUrl;
	}

	// 카카오 로그인
	@RequestMapping("kakaoLogin") // 서비스레이어로 뺄까 고민했지만 Http통신이 있어 컨트롤러에 있는게 맞을듯
	public String kakaoLogin(String code, String error) {
		if (error != null) { // 에러코드가 있다면 사용자가 무언가 취소를 한것.(null이 아닐때 전부 메인으로 보내버리면될수도)
			return "redirect:/";
//			if(error.equals("")) {
//				// 에러코드마다 다른 대비책을 세워야 한다면 필요
//			}
		}

		Gson gson = new Gson();
		// POST방식으로 key=value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate(); // 곧 지원중지될 API라 WebClient이걸 공부해야될듯

		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // 내가 보낼 데이터 타입이 key=value값이다

		// HttpBody 오브젝트 생성( POST방식은 Body에 담아 보내야 하니까 )
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", Statics.KAKAO_CLIENT_ID);
		params.add("redirect_uri", Statics.KAKAO_REDIRECT_URL);
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 - POST방식 - 그리고 response 변수응답받음.
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// json객체를 자바객체로 변환
		KakaoToken data = gson.fromJson(response.getBody(), KakaoToken.class);

		// 액세스토큰을 이용해 유저정보 받기
		RestTemplate rt2 = new RestTemplate();

		// HttpHeader2 오브젝트 생성
		HttpHeaders header2 = new HttpHeaders();
		header2.add("Authorization", "Bearer " + data.getAccess_token()); // 한칸 띄어야댐
		header2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest2 = new HttpEntity<>(header2);

		// Http 요청 POST방식
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoTokenRequest2, String.class);
		// 유저 정보 빼오기
		// jsonpojo로 바꾸면 카멜케이스때문에 에러나는데 일일히 바꿔줬음. 근데 한번에 바꾸는거 있을듯.
		// 카카오 프로필정보 빼오는 코드(사용자가 동의 안해도 다빼옴;)
		KakaoProfile kProfile = gson.fromJson(response2.getBody(), KakaoProfile.class);
		// 이제 세션에 담아야됨 해당 이메일로 디비 조회 해보고, 등록된 사용자가 있다면 그걸 꺼내서 세션에 담고, 없다면
		// 회원가입처리시켜버리면되겠다.
		String kakaoLoginEmail = kProfile.kakao_account.email + "/kakao";
		String kakaoLoginNick = kProfile.properties.nickname;
		// 이메일 동의 거부했을 경우 id로 구분해야한다
		int kakaoLoginId = kProfile.id;

		int kakaoResult = memberService.kakaoLoginLookup(kakaoLoginId);
		if (kakaoResult == 1) { // 가입내역이 있다면 정보를 빼서 세션에 담고
			MemberDTO kakaoDto = memberService.kakaoLoginSelectAll(kakaoLoginId);
			session.setAttribute("loginSeq", kakaoDto.getSeq());
			session.setAttribute("loginEmailID", kakaoDto.getEmailID());
			session.setAttribute("loginNick", kakaoDto.getNick());
			session.setAttribute("loginKakaoID", kakaoDto.getSns_division());
		} else { // 가입내역이 없다면 회원가입을 시키고 이메일이랑 닉네임만 세션에 바로 담아버리면 될듯했는데 seq때문에 또 빼와야하네
			memberService.kakaoSignup(kakaoLoginEmail, kakaoLoginNick, kakaoLoginId);
			MemberDTO kakaoDto = memberService.kakaoLoginSelectAll(kakaoLoginId);
			session.setAttribute("loginSeq", kakaoDto.getSeq());
			session.setAttribute("loginEmailID", kakaoDto.getEmailID());
			session.setAttribute("loginNick", kakaoDto.getNick());
			session.setAttribute("loginKakaoID", kakaoDto.getSns_division());
		}
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping("normalLogout")
	public String normalLogout() {
		session.invalidate(); // 이게 맞을듯
		return "redirect:/";
		// 나중에 현재페이지 로그인&로그아웃으로 변경할것
	}

	// 마이페이지 이동시 정보 빼오기
	@RequestMapping("mypageGo")
	public String mypageGo(Model model) {
		int loginSeq = (int) session.getAttribute("loginSeq");
		MemberDTO dto = memberService.myInfoSelectAll(loginSeq);
		String filePath = "\\images" + "\\" + dto.getPhoto(); // \image를 안붙여주면 경로가 c에서부터 찾음
		dto.setPhoto(filePath);
		model.addAttribute("loginInfo", dto);
		return "mypage/myInfo";
	}

	// 일반회원 정보수정Ok
	@RequestMapping("myInfoChangeOk")
	public String myInfoChangeOk(MemberDTO dto, MultipartFile file) throws IllegalStateException, IOException {
		dto.setSeq((int) session.getAttribute("loginSeq"));
		String realPath = session.getServletContext().getRealPath("") + "\\resources\\images";
		System.out.println("리얼패스 : " + realPath);
		memberService.myInfoChangeOk(dto, file, realPath);
		session.setAttribute("loginNick", dto.getNick());
		session.setAttribute("loginGender", dto.getGender());
		return "redirect:/member/mypageGo";
	}

	// 비밀번호 수정
	@RequestMapping("myInfoPwChange")
	public String myInfoPwChange(String pw) {
		memberService.myInfoPwChange(pw);
		return "redirect:/member/mypageGo";
	}

	// 회원탈퇴
	@RequestMapping("deleteAccount")
	public String deleteAccount(int seq) {
		memberService.deleteAccount(seq);
		session.invalidate();
		return "redirect:/";
	}

	// 카카오 로그아웃
	@ResponseBody
	@RequestMapping("kakaoLogOut")
	public String kakaoLogOut(int seq) {
		session.invalidate();
		// 여기도 추후 AWS IP로 변경
		return "https://kauth.kakao.com/oauth/logout?client_id=b7b0a7f6722957ddef971b2ff4061bd7&logout_redirect_uri=http://localhost";
	}

	// 상대방 프로필 조회
	@ResponseBody
	@RequestMapping("showMember")
	public String showMember(int mem_seq) {
		return memberService.showMember(mem_seq);
	}

	// 찜목록 처음불러오기
	@RequestMapping("saveList")
	public String saveList(Model model) throws Exception {
		int loginSeq = (int) session.getAttribute("loginSeq");
		MemberDTO dto = memberService.myInfoSelectAll(loginSeq);
		String filePath = "\\images" + "\\" + dto.getPhoto();
		dto.setPhoto(filePath); // 프로필 사진 설정
		// 찜목록 조회 갯수
		List<AreaDTO> adto = new ArrayList<>();
		List<Integer> mySaveListSeq = memberService.mySaveListSeq(loginSeq, Statics.SAVE_LIST_START,
				Statics.SAVE_LIST_END);
		List<Integer> isMySaveListMore = memberService.mySaveListSeq(loginSeq, Statics.IS_MY_SAVE_LIST_MORE,
				Statics.IS_MY_SAVE_LIST_MORE);
		List<String> savedListRate = new ArrayList<>();
		for (int saveSeq : mySaveListSeq) {
			adto.add(areaService.detailBuild(saveSeq));
			String rate = memberService.savedAreaGrade(saveSeq);
			savedListRate.add(rate);
		}
		model.addAttribute("isMySaveListMore", isMySaveListMore);
		model.addAttribute("savedListRate", savedListRate);
		model.addAttribute("mySaveListSeq", mySaveListSeq);
		model.addAttribute("saveList", adto);
		model.addAttribute("loginInfo", dto);
		return "mypage/saveList";
	}

	// 찜목록 더보기
	@ResponseBody
	@RequestMapping(value = "moreSaving", produces = "application/text;charset=utf-8")
	public String moreSaving(int btn) throws Exception {
		int loginSeq = (int) session.getAttribute("loginSeq");
		return memberService.moreSaving(loginSeq, btn);
	}

	// 게시글 관리
	@RequestMapping("writenList")
	public String writenList(Model model, Integer currentPage) {
		int loginSeq = (int) session.getAttribute("loginSeq");
		MemberDTO dto = memberService.myInfoSelectAll(loginSeq);
		String filePath = "\\images" + "\\" + dto.getPhoto();
		dto.setPhoto(filePath); // 프로필 사진 설정
		int cpage = memberService.myPostPageDefender(loginSeq, currentPage);

		int start = cpage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
		int end = cpage * Statics.RECORD_COUNT_PER_PAGE;

		List<MyPostDTO> list = memberService.getMyPostList(loginSeq, start, end);
		String navi = memberService.getMyPostNavi(loginSeq, cpage);
		
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		model.addAttribute("loginInfo", dto);
		return "mypage/writenList";
	}

	// 에러는 여기로
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		e.getMessage();
		return "redirect:/";
	}
}
