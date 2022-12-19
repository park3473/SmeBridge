package egovframework.smebridge.user.survey.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.user.survey.model.UserSurveyVo;

@Mapper("userSurveyMapper")
public interface UserSurveyMapper {

	public List<?> getUserSurveyAllList(UserSurveyVo userSurveyVo);

	public int getAllListCount(UserSurveyVo userSurveyVo);

	public UserSurveyVo getUserSurveyData(UserSurveyVo userSurveyVo);

	public List<?> getUserSurveyQuestionList(UserSurveyVo userSurveyVo);

}
