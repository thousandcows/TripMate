package kh.spring.dto;

import java.sql.Date;

public class NoticeDTO {
	private int seq;
	private String title;
	private String contents;
	private String nick;
	private Date writen_date;
	private int view_count;	
	
	public NoticeDTO() {}
	public NoticeDTO(int seq, String title, String contents, String nick, Date writen_date, int view_count) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.nick = nick;
		this.writen_date = writen_date;
		this.view_count = view_count;
	}
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
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
	
}
