package kh.spring.dto;

public class MemberDTO {
	private int seq;
	private String emailID;
	private String pw;
	private String nick;
	private String gender;
	private int age;
	private String phone;
	private String ph_Open;
	private String preference;
	private String text;
	private String photo;
	private int violation;
	private int sns_division;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(int seq, String emailID, String pw, String nick, String gender, int age, String phone,
			String ph_Open, String preference, String text, String photo, int violation, int sns_division) {
		super();
		this.seq = seq;
		this.emailID = emailID;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.ph_Open = ph_Open;
		this.preference = preference;
		this.text = text;
		this.photo = photo;
		this.violation = violation;
		this.sns_division = sns_division;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPh_Open() {
		return ph_Open;
	}
	public void setPh_Open(String ph_Open) {
		this.ph_Open = ph_Open;
	}
	public String getPreference() {
		return preference;
	}
	public void setPreference(String preference) {
		this.preference = preference;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getViolation() {
		return violation;
	}
	public void setViolation(int violation) {
		this.violation = violation;
	}
	public int getSns_division() {
		return sns_division;
	}
	public void setSns_division(int sns_division) {
		this.sns_division = sns_division;
	}
}
