package kh.spring.dto;

import java.sql.Date;

public class TourReplyDTO {
	private int seq;
	private int par_seq;
	private int mem_seq;
	private String contents;
	private Date writen_date;
	private String nick;	
	
	public TourReplyDTO() {
		
	}
	public TourReplyDTO(int seq, int par_seq, int mem_seq, String contents, Date writen_date, String nick) {
		super();
		this.seq = seq;
		this.par_seq = par_seq;
		this.mem_seq = mem_seq;
		this.contents = contents;
		this.writen_date = writen_date;
		this.nick = nick;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getPar_seq() {
		return par_seq;
	}
	public void setPar_seq(int par_seq) {
		this.par_seq = par_seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getWriten_date() {
		return writen_date;
	}
	public void setWriten_date(Date writen_date) {
		this.writen_date = writen_date;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
		
	
	
}
