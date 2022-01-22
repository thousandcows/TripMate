package kh.spring.dto;

import java.sql.Date;

public class TourBoardDTO {
	private int seq;
	private int mem_seq;
	private String title;
	private String contents;
	private String category;
	private Date writen_date;
	private int view_count;
	private int rec_count;
	private int rep_count;
	private String nick;
	private int board_num;
	
	public TourBoardDTO() {}
	public TourBoardDTO(int seq, int mem_seq, String title, String contents, String category, Date writen_date,
			int view_count, int rec_count, int rep_count, String nick, int board_num) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.title = title;
		this.contents = contents;
		this.category = category;
		this.writen_date = writen_date;
		this.view_count = view_count;
		this.rec_count = rec_count;
		this.rep_count = rep_count;
		this.nick = nick;
		this.board_num = board_num;
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
	public Date getWriten_date() {
		return writen_date;
	}
	public void setWriten_date(Date writen_date) {
		this.writen_date = writen_date;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
}
