package kh.spring.dto;

public class AreaReplyDTO {
	private int seq;
	private int mem_seq;
	private int area_seq;
	private String mem_nick;
	private String photo;
	private String text;
	private int rate;
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
	public int getArea_seq() {
		return area_seq;
	}
	public void setArea_seq(int area_seq) {
		this.area_seq = area_seq;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public AreaReplyDTO(int seq, int mem_seq, int area_seq, String mem_nick, String photo, String text, int rate) {
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.area_seq = area_seq;
		this.mem_nick = mem_nick;
		this.photo = photo;
		this.text = text;
		this.rate = rate;
	}
	public AreaReplyDTO() {
	}
	
	
}
