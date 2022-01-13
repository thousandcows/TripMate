package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;
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
	public MemberDTO normalLoginSelectAll(String emailID, String pw){
		String encryptPw = EncryptUtils.getSHA512(pw);
		return memberDao.normalLoginSelectAll(emailID, encryptPw);
	}
	
	///// 카카오 로그인 /////
	// 카카오 사용자 가입여부 확인
	public int kakaoLoginLookup(String kakaoLoginEmail) {
		return memberDao.kakaoLoginLookup(kakaoLoginEmail);
	}
	
	// 카카오 사용자 정보 빼오기
	public MemberDTO kakaoLoginSelectAll(String kakaoLoginEmail) { // 오버로딩해도 될거같은데 헷갈릴듯
		return memberDao.kakaoLoginSelectAll(kakaoLoginEmail);
	}
	
	// 카카오 로그인사용자 회원가입 시키기
	public int kakaoSignup(String kakaoLoginEmail, String kakaoLoginNick) {
		return memberDao.kakaoSignup(kakaoLoginEmail, kakaoLoginNick);
	}
	
	
	
	
	
}
