package kh.spring.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class CompanyBoardDTO {

	private int seq;
	private int mem_seq;
	private String title;
	private String contents;
	private int recruit;
	private int present;
	private String tour;
	private String gender;
	private Date start_date;
	private Date end_date;
	private String expired;
	private Date writen_date;
	private int view_count;
	private int rec_count;
	private int rep_count;
	
	public CompanyBoardDTO() {}

	public CompanyBoardDTO(int seq, int mem_seq, String title, String contents, int recruit, int present, String tour,
			String gender, Date start_date, Date end_date, String expired, Date writen_date, int view_count,
			int rec_count, int rep_count) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.title = title;
		this.contents = contents;
		this.recruit = recruit;
		this.present = present;
		this.tour = tour;
		this.gender = gender;
		this.start_date = start_date;
		this.end_date = end_date;
		this.expired = expired;
		this.writen_date = writen_date;
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

	public int getRecruit() {
		return recruit;
	}

	public void setRecruit(int recruit) {
		this.recruit = recruit;
	}

	public int getPresent() {
		return present;
	}

	public void setPresent(int present) {
		this.present = present;
	}

	public String getTour() {
		return tour;
	}

	public void setTour(String tour) {
		this.tour = tour;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getExpired() {
		return expired;
	}

	public void setExpired(String expired) {
		this.expired = expired;
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
	
	// 시간을 꾸며주는 메소드
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return sdf.format(this.writen_date.getTime());
	}

	public String getDetailDate() {
		long current_time = System.currentTimeMillis(); // 현재의 Timestamp
		long write_time = this.writen_date.getTime(); // 글이 작성된 시점의 Timestamp
			
		long time_gap = current_time - write_time;
			
		if(time_gap < 60000) {
			return "1분 이내";
		}else if(time_gap < 300000) {
			return "5분 이내";
		}else if(time_gap < 3600000) {
			return "1시간 이내";
		}else if(time_gap < 86400000) {
			return "오늘";
		}else {
			return getFormedDate();
		}
			
	}
	
	
}
