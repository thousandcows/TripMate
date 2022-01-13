package kh.spring.dto;

import java.sql.Date;

public class TourBoardDTO {
	private int seq;
	private int mem_seq;
	private String title;
	private String contents;
	private String category;
	private Date writen_time;
	private int view_count;
	private int rec_count;
	private int rep_count;
	
	public TourBoardDTO() {}
	public TourBoardDTO(int seq, int mem_seq, String title, String contents, String category, Date writen_time,
			int view_count, int rec_count, int rep_count) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.title = title;
		this.contents = contents;
		this.category = category;
		this.writen_time = writen_time;
		this.view_count = view_count;
		this.rec_count = rec_count;
		this.rep_count = rep_count;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getWriten_time() {
		return writen_time;
	}
	public void setWriten_time(Date writen_time) {
		this.writen_time = writen_time;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getRec_count() {
		return rec_count;
	}
	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
	}
	public int getRep_count() {
		return rep_count;
	}
	public void setRep_count(int rep_count) {
		this.rep_count = rep_count;
	}
	
	
}
