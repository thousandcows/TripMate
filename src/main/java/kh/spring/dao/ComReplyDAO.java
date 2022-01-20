package kh.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ComReplyDTO;

@Repository
public class ComReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insert(int rseq, String reply) {

		Map<String, String> map = new HashMap<>();
		map.put("rseq", String.valueOf(rseq));
		map.put("reply", reply);

		return mybatis.insert("ComReply.insert", map);
	}
	
	public List<ComReplyDTO> selectAll(int seq) {

		List<ComReplyDTO> list = mybatis.selectList("ComReply.selectAll");
		List<ComReplyDTO> rp_list = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {

			ComReplyDTO dto = new ComReplyDTO();
			if (seq == list.get(i).getPar_seq()) {
				dto.setSeq(list.get(i).getSeq());
				dto.setPar_seq(list.get(i).getPar_seq());
				dto.setMem_seq(list.get(i).getMem_seq());
				dto.setContents(list.get(i).getContents());
				dto.setWriten_date(list.get(i).getWriten_date());
				rp_list.add(dto);
			}
		}
		return rp_list;
	}

	public int modify(ComReplyDTO rdto) {
		
		return mybatis.update("ComReply.modify", rdto);
	}
	
	public int delete(int seq) {
		
		return mybatis.delete("ComReply.delete", seq);
	}
	
	public int deleteAll(int seq) {
		
		return mybatis.delete("ComReply.deleteAll", seq);
	}
}
