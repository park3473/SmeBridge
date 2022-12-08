package egovframework.smebridge.admin.survey.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.survey.model.AdminSurveyVo;

public interface AdminSurveyService {

	public ModelMap getListAll(AdminSurveyVo adminSurveyVo);

	public void setSurveyData(AdminSurveyVo adminSurveyVo, String string);

	public ModelMap getSurveyData(AdminSurveyVo adminSurveyVo);

}
