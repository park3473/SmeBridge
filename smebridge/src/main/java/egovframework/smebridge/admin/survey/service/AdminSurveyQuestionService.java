package egovframework.smebridge.admin.survey.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.survey.model.AdminSurveyQuestionVo;

public interface AdminSurveyQuestionService {

	public ModelMap getSurveyQuestionList(AdminSurveyQuestionVo adminSurveyQuestionVo);

	public void setSurveyQuestionData(AdminSurveyQuestionVo adminSurveyQuestionVo, String string);

}
