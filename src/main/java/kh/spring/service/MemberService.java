package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.KakaoProfile;
import kh.spring.dto.KakaoToken;
import kh.spring.dto.NormalMemberDTO;
import kh.spring.utils.EncryptUtils;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDao;
	
	// 이메일 체크
	public int emailCheck(String email){
		return memberDao.emailCheck(email);
	}
	
	// 닉네임 체크
	public int nickNameCheck(String nickName) {
		return memberDao.nickNameCheck(nickName);
	}
	
	// 휴대폰 체크
	public int phoneCheck(String phone) {
		return memberDao.phoneCheck(phone);
	}
	
	// 일반 회원가입
	public int normalSignup(String emailID, String nick, String phone, String pw) {
		String encryptPw = EncryptUtils.getSHA512(pw);
		return memberDao.normalSignup(emailID, nick, phone, encryptPw);
	}
	
	// 일반 로그인체크
	public int normalLoginCheck(String emailID, String pw) {
		String encryptPw = EncryptUtils.getSHA512(pw);
		return memberDao.normalLoginCheck(emailID, encryptPw);
	}
	
	// 일반 사용자정보 빼오기
	public NormalMemberDTO normalLoginSelectAll(String emailID, String pw){
		String encryptPw = EncryptUtils.getSHA512(pw);
		return memberDao.normalLoginSelectAll(emailID, encryptPw);
	}
	
	
	///////// 카카오 로그인 ////////
	private final String CLIENT_ID = "b7b0a7f6722957ddef971b2ff4061bd7"; // REST ID
	private final String REDIRECT_URL = "http://localhost/member/kakaoLogin"; // 리퀘스트시킬 URL(나중엔 아이피로 변경 카카오 디벨로퍼에서도 변경해줘야함.)
	
	public KakaoProfile kakaoLogin(String code, String error){
		if(error != null) { // 에러코드가 있다면 사용자가 무언가 취소를 한것. 근데 이걸 여기서 거르면 안될듯. 여기선 KakaoProfile 리턴고정했으니.
			if(error.equals("")) {
				// 에러코드마다 다른 대비책을 세워야 할곳.
			}
		}
		
		Gson gson = new Gson();
		// POST방식으로 key=value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate(); // 기본제공되네
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders(); // 웹티어는 아니겠지
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // 내가 보낼 데이터 타입이 key=value값이다?
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", CLIENT_ID);
		params.add("redirect_uri", REDIRECT_URL);
		params.add("code", code);
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		// Http 요청하기 - POST방식 - 그리고 response 변수응답받음. 근데 얘가 서비스레이어에 있어도 되는애인가?
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
		KakaoProfile kProfile = gson.fromJson(response2.getBody(), KakaoProfile.class);
		System.out.println(kProfile.kakao_account.email);
		return kProfile;
	}
	
	
	
	
}
