package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.TourReplyDTO;

@Repository
public class TourReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(int rseq, String reply) {

		System.out.println(rseq + reply);
		Map<String, String> map = new HashMap<>();
		map.put("rseq", String.valueOf(rseq));
		map.put("reply", reply);
		
		return mybatis.insert("TourReply.insert", map);
	}
	
	public List<TourReplyDTO> selectAll() {

		
		return mybatis.selectList("TourReply.selectAll");
	}

}
