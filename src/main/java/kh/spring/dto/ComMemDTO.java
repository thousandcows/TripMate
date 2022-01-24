package kh.spring.dto;

public class ComMemDTO {

	private int par_seq;
	private int mem_seq;
	
	public ComMemDTO() {}

	public ComMemDTO(int par_seq, int mem_seq) {
		this.par_seq = par_seq;
		this.mem_seq = mem_seq;
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
