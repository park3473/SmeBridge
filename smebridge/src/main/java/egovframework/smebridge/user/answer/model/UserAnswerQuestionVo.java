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
	
	List<AdminAnswerQuestionVo> list = new ArrayList();

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

	public List<AdminAnswerQuestionVo> getList() {
		return list;
	}

	public void setList(List<AdminAnswerQuestionVo> list) {
		this.list = list;
	}
	
	
	
}
