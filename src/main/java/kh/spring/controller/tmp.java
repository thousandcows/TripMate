package kh.spring.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.MemberDTO;

@Controller
@RequestMapping("/tmp/")
public class tmp {

	@Autowired
<<<<<<< HEAD
	private SqlSessionTemplate mybatis;


=======
	private SqlSessionTemplate mybatis;	
	
>>>>>>> branch 'main' of https://github.com/Carroth23/KHFinalProject.git
	@ResponseBody
	@RequestMapping("showMember")
	public String showMember(int mem_seq) {
		System.out.println("tmp에 값 들어옴? : " + mem_seq);
		//DAO
		MemberDTO dto = mybatis.selectOne("Member.myInfoSelectAll",mem_seq);
<<<<<<< HEAD
=======
		System.out.println(dto.getPh_Open());
		System.out.println("나이 : " + dto.getAge() + " 닉네임 : " + dto.getNick());
>>>>>>> branch 'main' of https://github.com/Carroth23/KHFinalProject.git
		//Service
		Gson gson = new Gson();
		dto.setPw("");
		if(!dto.getPh_Open().equals("on")) {
			dto.setPhone("비공개 연락처입니다.");
		}			

		String result = gson.toJson(dto);
		return result;
	}
}
