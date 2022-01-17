package kh.spring.dto;

public class AreaRcmdDTO {
	private String title;
	private String photo;
	private String seq;
	public AreaRcmdDTO(String title, String photo, String seq) {
		this.title = title;
		this.photo = photo;
		this.seq = seq;
	}
	public AreaRcmdDTO() {
		super();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	
	
}
