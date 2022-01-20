package kh.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.TourReplyDTO;
import kh.spring.dto.TourReplyReplyDTO;

@Repository
public class TourReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insert(int rseq, String reply) {

		Map<String, String> map = new HashMap<>();
		map.put("rseq", String.valueOf(rseq));
		map.put("reply", reply);

		return mybatis.insert("TourReply.insert", map);
	}

	public List<TourReplyDTO> selectAll(int seq) {

		List<TourReplyDTO> list = mybatis.selectList("TourReply.selectAll");
		List<TourReplyDTO> rp_list = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {

			TourReplyDTO dto = new TourReplyDTO();
			if (seq == list.get(i).getPar_seq()) {
				dto.setSeq(list.get(i).getSeq());
				dto.setPar_seq(list.get(i).getPar_seq());
				dto.setMem_seq(list.get(i).getMem_seq());
				dto.setContents(list.get(i).getContents());
				dto.setWriten_time(list.get(i).getWriten_time());
				rp_list.add(dto);
			}
		}
		return rp_list;
	}

	public int modify(TourReplyDTO rdto) {
		
		return mybatis.update("TourReply.modify", rdto);
	}
	
	public int delete(int seq) {
		System.out.println("매퍼에서 seq : " + seq);
		mybatis.delete("TourReply.deleteReply", seq);		
		return mybatis.delete("TourReply.delete", seq);
	}
	
	public int deleteAll(int seq) {
		
		return mybatis.delete("TourReply.deleteAll", seq);
	}
	
	public int reinsert(int rpseq, String recontent) {

		Map<String, String> map = new HashMap<>();
		map.put("rpseq", String.valueOf(rpseq));
		map.put("recontent", recontent);

		return mybatis.insert("TourReply.reinsert", map);
	}
	
	public List<TourReplyReplyDTO> selectReAll(){
		
		return mybatis.selectList("TourReply.selectReAll");
	}
	
	public int remodify(int idseq, String recontent) {
		
		Map<String, String> map = new HashMap<>();
		map.put("idseq", String.valueOf(idseq));
		map.put("recontent", recontent);

		return mybatis.update("TourReply.remodify", map);
	}
	
	public int redelete(int idseq) {
		
		Map<String, String> map = new HashMap<>();
		map.put("idseq", String.valueOf(idseq));
		System.out.println(idseq);
		return mybatis.delete("TourReply.redelete", map);
	}
}