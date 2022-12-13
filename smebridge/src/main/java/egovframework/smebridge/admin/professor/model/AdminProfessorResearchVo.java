package egovframework.smebridge.admin.professor.model;

import java.util.ArrayList;
import java.util.List;

public class AdminProfessorResearchVo {

	String idx = "";
	String pro_idx = "";
	String seq = "";
	String content = "";
	
	List<AdminProfessorResearchVo> list= new ArrayList();
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(String pro_idx) {
		this.pro_idx = pro_idx;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<AdminProfessorResearchVo> getList() {
		return list;
	}
	public void setList(List<AdminProfessorResearchVo> list) {
		this.list = list;
	}
	
	
	
}
