package egovframework.smebridge.admin.professor.model;

import com.system.util.SearchVo;

public class AdminProfessorVo extends SearchVo {

	String idx = "";		//교수번호
	String field = "";		//팀 분류
	String type = "";		//교수 타입 ( 0 = 센터장 , 1 = 책임 교수 , 2 = 일반 교수 )
	String team = "";		//소속 팀
	String name = "";		//교수 명
	String content = "";	//소개 문
	
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
	
	
}
