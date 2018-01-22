package bean;

public class RqaBean {
	private int rqa_num; //rqa 번호
	private String rqa_content; // 응답내용
	private String user_id; //사용자 아이디
	private int qa_num; //게시글 번호
	
	
	public int getRqa_num() {
		return rqa_num;
	}
	public void setRqa_num(int rqa_num) {
		this.rqa_num = rqa_num;
	}
	public String getRqa_content() {
		return rqa_content;
	}
	public void setRqa_content(String rqa_content) {
		this.rqa_content = rqa_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getQa_num() {
		return qa_num;
	}
	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}
}
