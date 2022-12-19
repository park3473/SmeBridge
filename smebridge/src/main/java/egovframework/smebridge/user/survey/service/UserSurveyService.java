package egovframework.smebridge.user.survey.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.survey.model.UserSurveyVo;

public interface UserSurveyService {

	public ModelMap getUserSurveyAllList(UserSurveyVo userSurveyVo);

	public ModelMap getUserSurveyViewData(UserSurveyVo userSurveyVo);

}
