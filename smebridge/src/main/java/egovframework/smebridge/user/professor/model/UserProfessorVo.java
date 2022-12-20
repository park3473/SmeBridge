package egovframework.smebridge.user.professor.model;

public class UserProfessorVo extends UserProfessorResearchVo {

	String idx = "";			//교수번호
	String field = "";			//필드 분류
	String type = "";			//교수 타입 ( 0 = 센터장 , 1 = 책임 교수 , 2 = 일반 교수 )
	String team = "";			//소속 팀
	String name = "";			//교수 명
	String content = "";		//소개 문
	String matching_idx = "";	//연결 회원 번호
	String email = "";			//이메일 
	String email_address = "";	//이메일 주소
	String image = "";			//교수 이미지
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMatching_idx() {
		return matching_idx;
	}
	public void setMatching_idx(String matching_idx) {
		this.matching_idx = matching_idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
