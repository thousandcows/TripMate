package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
