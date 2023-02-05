package egovframework.smebridge.user.answer.model;

import java.util.ArrayList;
import java.util.List;

import egovframework.smebridge.admin.answer.model.AdminAnswerQuestionVo;

public class UserAnswerQuestionVo {

	String idx = "";
	String survey_idx = "";
	String question_idx = "";
	String answer_idx = "";
	String answer = "";
	String field_name = "";
	
	List<UserAnswerQuestionVo> list = new ArrayList();

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getSurvey_idx() {
		return survey_idx;
	}

	public void setSurvey_idx(String survey_idx) {
		this.survey_idx = survey_idx;
	}

	public String getQuestion_idx() {
		return question_idx;
	}

	public void setQuestion_idx(String question_idx) {
		this.question_idx = question_idx;
	}

	public String getAnswer_idx() {
		return answer_idx;
	}

	public void setAnswer_idx(String answer_idx) {
		this.answer_idx = answer_idx;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public List<UserAnswerQuestionVo> getList() {
		return list;
	}

	public void setList(List<UserAnswerQuestionVo> list) {
		this.list = list;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	
	
	
}
