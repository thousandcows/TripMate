package kh.spring.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ReactionsDTO {
	private int seq;
	private int mem_seq;
	private int loginSeq;
	private String title;
	private String nick;
	private int board_num;
	private String reaction;
	private String reactioner;
	private Date time;
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
	public int getLoginSeq() {
		return loginSeq;
	}
	public void setLoginSeq(int loginSeq) {
		this.loginSeq = loginSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getReaction() {
		return reaction;
	}
	public void setReaction(String reaction) {
		this.reaction = reaction;
	}
	public String getReactioner() {
		return reactioner;
	}
	public void setReactioner(String reactioner) {
		this.reactioner = reactioner;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public ReactionsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReactionsDTO(int seq, int mem_seq, int loginSeq, String title, String nick, int board_num, String reaction,
			String reactioner, Date time) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.loginSeq = loginSeq;
		this.title = title;
		this.nick = nick;
		this.board_num = board_num;
		this.reaction = reaction;
		this.reactioner = reactioner;
		this.time = time;
	}
	
	public String getFormedDate() { // 날짜값 내가 정해서 꺼내는것
		SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
		return sdf.format(this.time);
	}
	
	public String getTime() {
		long current_time = System.currentTimeMillis(); // 현재의 TimeStamp
		long write_time = this.time.getTime();	// 글이 작성된 시점의 TimeStamp
		
		long time_gap = current_time - write_time; // 작성된 시점과 현재시간의 갭
		
		if(time_gap < 60000) {
			return "방금";
		} else if (time_gap < 120000) {
			return "2분전";
		} else if (time_gap < 180000) {
			return "3분전";
		} else if (time_gap < 240000) {
			return "4분전";
		} else if (time_gap < 300000) {
			return "5분전";
		} else if (time_gap < 600000) {
			return "10분전";
		} else if (time_gap < 3600000) {
			return "1시간전";
		} else if (time_gap < 86400000) {
			return "오늘";
		} else {
			return getFormedDate();
		}
		
	}
	
	
}
