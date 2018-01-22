package bean;

import java.util.Date;

public class MemberBean2 {
	private String user_id; // 회원 아이디
	private String user_pw; // 회원 비밀번호
	private String user_name; // 회원 이름
	private String user_addr; // 회원 주소
	private String user_phnum; // 회원 전화번호
	private String user_email; // 회원 email
	private int user_grade; // 회원 등급
	private int user_points; // 회원 포인트
	private Date user_regdate; // 가입일

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	private boolean login_check;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_phnum() {
		return user_phnum;
	}

	public void setUser_phnum(String user_phnum) {
		this.user_phnum = user_phnum;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}

	public int getUser_points() {
		return user_points;
	}

	public void setUser_points(int user_points) {
		this.user_points = user_points;
	}

}
