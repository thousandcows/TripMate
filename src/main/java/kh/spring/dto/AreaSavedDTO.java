package kh.spring.dto;

public class AreaSavedDTO extends AreaDTO{
	private int seq;
	private String savedListRate;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSavedListRate() {
		return savedListRate;
	}
	public void setSavedListRate(String savedListRate) {
		this.savedListRate = savedListRate;
	}
	public AreaSavedDTO(int seq, String savedListRate) {
		super();
		this.seq = seq;
		this.savedListRate = savedListRate;
	}
	public AreaSavedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AreaSavedDTO(String name, String category, String cat2, String cat3, String location, String lo_detail,
			String phone, String detail, String homepage, String photo) {
		super(name, category, cat2, cat3, location, lo_detail, phone, detail, homepage, photo);
		// TODO Auto-generated constructor stub
	}

	
	
}
