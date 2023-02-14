package egovframework.smebridge.admin.survey.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.admin.survey.model.AdminSurveyQuestionVo;
import egovframework.smebridge.admin.survey.model.AdminSurveyVo;

@Mapper("adminSurveyQuestionMapper")
public interface AdminSurveyQuestionMapper {

	public List<?> getSurveyQuestionList(AdminSurveyQuestionVo questionVo);

	public void setSurveyQuestionDataInsert(AdminSurveyQuestionVo adminSurveyQuestionVo);

	public void setSurveyQuestionDataUpdate(AdminSurveyQuestionVo adminSurveyQuestionVo);

	public void setSurveyQuestionDataDelete(AdminSurveyQuestionVo adminSurveyQuestionVo);

	public void setSurveyQuestionListDelete(AdminSurveyVo adminSurveyVo);

	public void setSurveyQuestionDataReOrder(AdminSurveyQuestionVo adminSurveyQuestionVo);

}
