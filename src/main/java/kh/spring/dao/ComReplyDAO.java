package kh.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ComReplyDTO;
import kh.spring.dto.ComReplyReplyDTO;

@Repository
public class ComReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insert(int rseq, String reply, String nick, int mem_seq) {
		
		System.out.println("dao nick : " + nick + "mem_seq : " + mem_seq);

		Map<String, String> map = new HashMap<>();
		map.put("rseq", String.valueOf(rseq));
		map.put("reply", reply);
		map.put("nick", nick);
		map.put("mem_seq", String.valueOf(mem_seq));
		
		
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
				dto.setNick(list.get(i).getNick());
				rp_list.add(dto);
			}
			
//			System.out.println("띄어쓰기 테스트 : " +  list.get(i).getContents());
		}
		return rp_list;
	}

	public int modify(ComReplyDTO rdto) {
		
		return mybatis.update("ComReply.modify", rdto);
	}
	
	public int delete(int seq) {
		
		mybatis.delete("ComReply.deleteReply", seq);
		return mybatis.delete("ComReply.delete", seq);
	}
	
	public int deleteAll(int seq) {
		
		return mybatis.delete("ComReply.deleteAll", seq);
	}
	
	public int deleteAllRe(int seq) {
		
		return mybatis.delete("ComReply.deleteAllRe", seq);
	}
	
	public int reinsert(int rpseq, String recontent, String nick, int mem_seq) {

		Map<String, String> map = new HashMap<>();
		map.put("rpseq", String.valueOf(rpseq));
		map.put("recontent", recontent);
		map.put("nick", nick);
		map.put("mem_seq", String.valueOf(mem_seq));
		
		return mybatis.insert("ComReply.reinsert", map);
	}
	
	public List<ComReplyReplyDTO> selectReAll(){
		
		return mybatis.selectList("ComReply.selectReAll");
	}
	
	public int remodify(int idseq, String recontent) {
		
		Map<String, String> map = new HashMap<>();
		map.put("idseq", String.valueOf(idseq));
		map.put("recontent", recontent);

		return mybatis.update("ComReply.remodify", map);
	}
	
	public int redelete(int idseq) {
		
		Map<String, String> map = new HashMap<>();
		map.put("idseq", String.valueOf(idseq));
		System.out.println(idseq);
		return mybatis.delete("ComReply.redelete", map);
	}
	
}
