package kh.spring.dto;

public class PlanDTO {
	private int seq;
	private int mem_seq;
	private String title;
	private String startDate;
	private String endDate;
	private String theme;
	private int account;
	private String memo;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public PlanDTO(int seq, int mem_seq, String title, String startDate, String endDate, String theme, int account,
			String memo) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.theme = theme;
		this.account = account;
		this.memo = memo;
	}
	public PlanDTO() {
	}
	
	
}
