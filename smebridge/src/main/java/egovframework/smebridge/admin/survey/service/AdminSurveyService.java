package egovframework.smebridge.admin.survey.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.survey.model.AdminSurveyVo;

public interface AdminSurveyService {

	ModelMap getListAll(AdminSurveyVo adminSurveyVo);

}
