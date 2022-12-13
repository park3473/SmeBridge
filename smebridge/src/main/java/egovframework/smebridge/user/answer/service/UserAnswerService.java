package egovframework.smebridge.user.answer.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.answer.model.UserAnswerVo;

public interface UserAnswerService {

	public ModelMap getMyAnswerList(UserAnswerVo userAnswerVo);

	public ModelMap getMyAnswerData(UserAnswerVo userAnswerVo);

}
