package kh.spring.dto;

public class SavedDTO {
	private int seq;
	private int mem_seq;
	private int area_seq;
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
	public SavedDTO(int seq, int mem_seq, int area_seq) {
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.area_seq = area_seq;
	}
	public SavedDTO() {
	}
}
