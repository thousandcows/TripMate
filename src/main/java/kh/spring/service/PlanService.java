package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.PlanDAO;
import kh.spring.dto.PlanDTO;

@Service
public class PlanService {

	@Autowired
	public PlanDAO dao;
	
	public void chooseTheme(PlanDTO dto) {
		System.out.println(dto.getEndDate());
		System.out.println(dto.getStartDate());
		System.out.println(dto.getTheme());
		System.out.println(dto.getTitle());

		dao.chooseTheme(dto);
	}
}
