package kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public int normalSignup(String emailID, String nick, String phone, String pw, String gender) {
		String encryptPw = EncryptUtils.getSHA512(pw);
		return memberDao.normalSignup(emailID, nick, phone, encryptPw, gender);
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
	
	// PW찾기 패스워드 변경
	public int findPwChange(String findPwTargetEmail, String pw) {
		String encryptPw = EncryptUtils.getSHA512(pw);
		return memberDao.findPwChange(findPwTargetEmail, encryptPw);
	}
	
	///// 카카오 로그인 /////
	// 카카오 사용자 가입여부 확인
	public int kakaoLoginLookup(int kakaoLoginId) {
		return memberDao.kakaoLoginLookup(kakaoLoginId);
	}
	
	// 카카오 사용자 정보 빼오기
	public MemberDTO kakaoLoginSelectAll(int kakaoLoginId) { // 오버로딩해도 될거같은데 헷갈릴듯
		return memberDao.kakaoLoginSelectAll(kakaoLoginId);
	}
	
	// 카카오 로그인사용자 회원가입 시키기
	public int kakaoSignup(String kakaoLoginEmail, String kakaoLoginNick, int kakaoLoginId) {
		return memberDao.kakaoSignup(kakaoLoginEmail, kakaoLoginNick, kakaoLoginId);
	}
	///// 카카오 로그인 끝 /////
	
	// 마이페이지 정보 빼오기
	public MemberDTO myInfoSelectAll(int loginSeq) {
		return memberDao.myInfoSelectAll(loginSeq);
	}
	
	// 마이페이지 정보수정
	public int myInfoChangeOk(MemberDTO dto, MultipartFile file, String realPath) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			System.out.println("파일 리얼패스 : " + realPath);
			File realPathFile = new File(realPath);
			if(!realPathFile.exists()) {
				realPathFile.mkdir();
			}
			String oriName = file.getOriginalFilename();
			String sysName = UUID.randomUUID() + "_" + oriName;
			file.transferTo(new File(realPath + "/" + sysName));
			dto.setPhoto(sysName);
		}
		dto.setPw(EncryptUtils.getSHA512(dto.getPw()));
		System.out.println("들어오는 회원 seq : " + dto.getSeq());
		System.out.println("들어오는 회원email : " + dto.getEmailID());
		System.out.println("들어오는 회원pw : " + dto.getPw());
		System.out.println("들어오는 회원nick : " + dto.getNick());
		System.out.println("들어오는 회원gender : " + dto.getGender());
		System.out.println("들어오는 회원age : " + dto.getAge());
		System.out.println("들어오는 회원phone : " + dto.getPhone());
		System.out.println("돌아오는 회원phone_Open : " + dto.getPh_Open());
		System.out.println("들어오는 회원preference : " + dto.getPreference());
		System.out.println("들어오는 회원text : " + dto.getText());
		System.out.println("들어오는 회원photo : " + dto.getPhoto());
		return memberDao.myInfoChangeOk(dto);		
	}
	
	
}
