package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 이메일 체크
	public int emailCheck(String email) {
		return mybatis.selectOne("Member.emailCheck", email);
	}
	
	// 닉네임 체크
	public int nickNameCheck(String nickName) {
		return mybatis.selectOne("Member.nickNameCheck", nickName);
	}
	
	// 휴대폰 체크
	public int phoneCheck(String phone) {
		return mybatis.selectOne("Member.phoneCheck", phone);
	}
	
	// 일반 회원가입
	public int normalSignup(String emailID, String nick, String phone, String encryptPw, String gender) {
		Map<String, String> map = new HashMap<>();
		map.put("emailID", emailID);
		map.put("nick", nick);
		map.put("phone", phone);
		map.put("encryptPw", encryptPw);
		map.put("gender", gender);
		return mybatis.insert("Member.normalSignup", map);
	}
	
	// 일반 로그인체크
	public int normalLoginCheck(String emailID, String encryptPw) {
		Map<String, String> map = new HashMap<>();
		map.put("emailID", emailID);
		map.put("encryptPw", encryptPw);
		return mybatis.selectOne("Member.normalLoginCheck", map);
	}
	
	// 일반 로그인 사용자 정보 빼오기
	public MemberDTO normalLoginSelectAll(String emailID, String encryptPw) {
		Map<String, String> map = new HashMap<>();
		map.put("emailID", emailID);
		map.put("encryptPw", encryptPw);
		return mybatis.selectOne("Member.normalLoginSelectAll", map);
	}
	
	// PW찾기 비밀번호 변경
	public int findPwChange(String findPwTargetEmail, String encryptPw) {
		Map<String, String> map = new HashMap<>();
		map.put("findPwTargetEmail", findPwTargetEmail);
		map.put("encryptPw", encryptPw);
		return mybatis.update("Member.findPwChange", map);
	}
	
	// 카카오 회원가입여부 확인
	public int kakaoLoginLookup(int kakaoLoginId) {
		return mybatis.selectOne("Member.kakaoLoginLookup", kakaoLoginId);
	}
	
	// 카카오 로그인 정보 빼오기
	public MemberDTO kakaoLoginSelectAll(int kakaoLoginId) {
		return mybatis.selectOne("Member.kakaoLoginSelectAll", kakaoLoginId);
	}
	
	// 카카오 사용자 회원가입 시키기
	public int kakaoSignup(String kakaoLoginEmail, String kakaoLoginNick, int kakaoLoginId) {
		Map<String, String> map = new HashMap<>();
		map.put("kakaoEmail", kakaoLoginEmail);
		map.put("kakaoNick", kakaoLoginNick);
		map.put("kakaoId", String.valueOf(kakaoLoginId));
		return mybatis.insert("Member.kakaoSignup", map);
	}
	
	// 마이페이지 정보빼오기
	public MemberDTO myInfoSelectAll(int loginSeq) {
		return mybatis.selectOne("Member.myInfoSelectAll", loginSeq);
	}
	
	// 마이페이지 정보 수정
	public int myInfoChangeOk(MemberDTO dto) {
		return mybatis.insert("Member.myInfoChangeOk", dto);
	}
	
	// 일반 비밀번호 변경
	public int myInfoPwChange(String encryptPw) {
		return mybatis.update("Member.myInfoPwChange", encryptPw);
	}
	
	// 회원탈퇴
	public int deleteAccount(int seq) {
		return mybatis.delete("Member.deleteAccount", seq);
	}
	
}
