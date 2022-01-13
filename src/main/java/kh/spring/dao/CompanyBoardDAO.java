package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CompanyBoardDTO;

@Repository
public class CompanyBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(CompanyBoardDTO dto) {
		int result = mybatis.insert("CompanyBoard.insert",dto);
		return dto.getSeq();
	}
	
	public List<CompanyBoardDTO> selectAll(){
		return mybatis.selectList("CompanyBoard.selectAll");
	}

}
