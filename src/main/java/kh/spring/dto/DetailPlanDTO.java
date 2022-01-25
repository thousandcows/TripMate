package kh.spring.dto;

public class DetailPlanDTO {
	int par_seq;
	int area_seq;
	String plan_date;
	int seq;
	public DetailPlanDTO(int par_seq, int area_seq, String plan_date, int seq) {
		this.par_seq = par_seq;
		this.area_seq = area_seq;
		this.plan_date = plan_date;
		this.seq = seq;
	}
	public DetailPlanDTO() {
	}
	public int getPar_seq() {
		return par_seq;
	}
	public void setPar_seq(int par_seq) {
		this.par_seq = par_seq;
	}
	public int getArea_seq() {
		return area_seq;
	}
	public void setArea_seq(int area_seq) {
		this.area_seq = area_seq;
	}
	public String getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(String plan_date) {
		this.plan_date = plan_date;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
}
