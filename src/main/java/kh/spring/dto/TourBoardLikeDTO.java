package kh.spring.dto;

public class TourBoardLikeDTO {
	private int seq;
	private int par_seq;
	private int mem_seq;
	
	public TourBoardLikeDTO() {}
	public TourBoardLikeDTO(int seq, int par_seq, int mem_seq) {
		super();
		this.seq = seq;
		this.par_seq = par_seq;
		this.mem_seq = mem_seq;
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
	
}
