package egovframework.smebridge.user.answer.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.answer.model.UserAnswerQuestionVo;
import egovframework.smebridge.user.answer.model.UserAnswerVo;
import egovframework.smebridge.user.survey.model.UserSurveyVo;

public interface UserAnswerService {

	public ModelMap getMyAnswerList(UserAnswerVo userAnswerVo);

	public ModelMap getMyAnswerData(UserAnswerVo userAnswerVo);

	public void setUserAnswerListUpdate(List<UserAnswerQuestionVo> list);

	public ModelMap getUserSurveyAnswerAll(UserSurveyVo userSurveyVo);

	public String setSurveyAnswerData(UserAnswerVo userAnswerVo);

	public void setSurveyQuestionAnswerList(List<UserAnswerQuestionVo> list);
}
