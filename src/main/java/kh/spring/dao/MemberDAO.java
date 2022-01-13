package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.NormalMemberDTO;

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
	public int normalSignup(String emailID, String nick, String phone, String encryptPw) {
		Map<String, String> map = new HashMap<>();
		map.put("emailID", emailID);
		map.put("nick", nick);
		map.put("phone", phone);
		map.put("encryptPw", encryptPw);
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
	public NormalMemberDTO normalLoginSelectAll(String emailID, String encryptPw) {
		Map<String, String> map = new HashMap<>();
		map.put("emailID", emailID);
		map.put("encryptPw", encryptPw);
		return mybatis.selectOne("Member.normalLoginSelectAll", map);
	}
	
	
	
	
	
	
	
	
	
}
