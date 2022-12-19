package egovframework.smebridge.user.answer.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.user.answer.model.UserAnswerQuestionVo;
import egovframework.smebridge.user.answer.model.UserAnswerVo;

@Mapper("userAnswerMapper")
public interface UserAnswerMapper {

	public List<?> getMyAnswerList(UserAnswerVo userAnswerVo);

	public UserAnswerVo getMyAnswerData(UserAnswerVo userAnswerVo);

	public List<?> getMyQuestionList(UserAnswerVo userAnswerVo);

	public List<?> getMyQuestionAnswerList(UserAnswerVo userAnswerVo);

	public void setUserAnswerUpdate(UserAnswerQuestionVo answerVo);

	public void setSurveyAnswerData(UserAnswerVo userAnswerVo);

	public void setUserAnswerInsert(UserAnswerQuestionVo answerVo);

}
