package egovframework.smebridge.admin.survey.model;

import com.system.util.SearchVo;

public class AdminSurveyVo extends SearchVo {

	String idx = "";		//설문 폼 번호
	String type = "";		//설문 여부
	String title = "";		//설문 제목
	String name = "";		//작성자 이름
	String member_id = "";	//작성자 아이디
	String create_tm = "";	//생성 일시
	String update_tm = "";	//수정 일시
	
	//추가 부분
	String answer_cnt = "";	//신청서 갯수
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCreate_tm() {
		return create_tm;
	}
	public void setCreate_tm(String create_tm) {
		this.create_tm = create_tm;
	}
	public String getUpdate_tm() {
		return update_tm;
	}
	public void setUpdate_tm(String update_tm) {
		this.update_tm = update_tm;
	}
	public String getAnswer_cnt() {
		return answer_cnt;
	}
	public void setAnswer_cnt(String answer_cnt) {
		this.answer_cnt = answer_cnt;
	}
	
	
	
}
