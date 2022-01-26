package kh.spring.dto;

public class AreaSavedDTO extends AreaDTO{
	private String savedListRate;
	private int isMore;
	public String getSavedListRate() {
		return savedListRate;
	}
	public void setSavedListRate(String savedListRate) {
		this.savedListRate = savedListRate;
	}
	public int getIsMore() {
		return isMore;
	}
	public void setIsMore(int isMore) {
		this.isMore = isMore;
	}
	public AreaSavedDTO(String savedListRate, int isMore) {
		super();
		this.savedListRate = savedListRate;
		this.isMore = isMore;
	}
	public AreaSavedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AreaSavedDTO(int seq, String name, String category, String cat2, String cat3, String location,
			String lo_detail, String phone, String detail, String homepage, String photo) {
		super(seq, name, category, cat2, cat3, location, lo_detail, phone, detail, homepage, photo);
		// TODO Auto-generated constructor stub
	}


	
	
}
