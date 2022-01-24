package kh.spring.dto;

import java.sql.Date;

public class MyPostDTO {
	private int seq;
	private String title;
	private int view_count;
	private int rec_count;
	private int rep_count;
	private Date writen_date;
	private int board_num;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getWriten_date() {
		return writen_date;
	}
	public void setWriten_date(Date writen_date) {
		this.writen_date = writen_date;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public MyPostDTO(int seq, String title, int view_count, int rec_count, int rep_count, Date writen_date,
			int board_num) {
		super();
		this.seq = seq;
		this.title = title;
		this.view_count = view_count;
		this.rec_count = rec_count;
		this.rep_count = rep_count;
		this.writen_date = writen_date;
		this.board_num = board_num;
	}
	public MyPostDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
