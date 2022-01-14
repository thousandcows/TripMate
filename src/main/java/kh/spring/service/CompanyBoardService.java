package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CompanyBoardDAO;
import kh.spring.dto.CompanyBoardDTO;

@Service
public class CompanyBoardService {

	@Autowired
	private CompanyBoardDAO cdao;
	
	public int insert(CompanyBoardDTO dto) {
		return cdao.insert(dto);
	}
	
	public List<CompanyBoardDTO> selectAll(){
		return cdao.selectAll();
	}
}
