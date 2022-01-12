package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;

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
}
