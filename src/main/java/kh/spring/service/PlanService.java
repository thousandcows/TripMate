package kh.spring.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.PlanDAO;
import kh.spring.dto.PlanDTO;

@Service
public class PlanService {

	@Autowired
	public PlanDAO dao;

	public PlanDTO callPlan(int seq) {
		System.out.println(seq);
		return dao.callPlan(seq);
	}
	

	public int chooseTheme(PlanDTO dto) {
		int result = dao.createTheme(dto);
		return result;
	}
	
	public void changeTheme(PlanDTO dto) {
		dao.changeTheme(dto);
	}
	
	public void saveList(int[] check,int seq) {
		for(int i =0;i<check.length;i++) {
			dao.saveList(check[i],seq);
		}
	}
}
