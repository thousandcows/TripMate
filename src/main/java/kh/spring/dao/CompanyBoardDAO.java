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
		return mybatis.insert("CompanyBoard.insert",dto);
	}
	
	public List<CompanyBoardDTO> selectAll(){
		return mybatis.selectList("CompanyBoard.selectAll");
	}
	
	public CompanyBoardDTO selectBySeq(int seq) {
		return mybatis.selectOne("CompanyBoard.selectBySeq",seq);
	}

	public int delete(int seq) {
		return mybatis.delete("CompanyBoard.delete", seq);
	}
	
	public int modify(CompanyBoardDTO dto) {
		return mybatis.update("CompanyBoard.modify", dto);
	}
	
	public int addViewCount(int seq) {
		return mybatis.update("CompanyBoard.addViewCount", seq);
	}
	
	public int getRecordCount() throws Exception{
		return mybatis.selectOne("CompanyBoard.getRecordCount");
	}

	
	
}
