package kh.spring.dto;

public class MyPostDelListDTO {
	private int board_num;
	private int seq;
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public MyPostDelListDTO(int board_num, int seq) {
		super();
		this.board_num = board_num;
		this.seq = seq;
	}
	public MyPostDelListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
