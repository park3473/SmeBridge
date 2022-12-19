package egovframework.smebridge.admin.answer.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.admin.answer.model.AdminAnswerQuestionVo;
import egovframework.smebridge.admin.answer.model.AdminAnswerVo;

@Mapper("adminAnswerMapper")
public interface AdminAnswerMapper {

	public List<?> getAnswerAllList(AdminAnswerVo adminAnswerVo);

	public int getAllListCount(AdminAnswerVo adminAnswerVo);

	public void setSurveyAnswerData(AdminAnswerVo adminAnswerVo);

	public AdminAnswerVo getAnswerDataView(AdminAnswerVo adminAnswerVo);

	public List<?> getAllSurveyQuestionAnswerList(AdminAnswerVo adminAnswerVo);

	public void setSurveyAnswerDataDelete(AdminAnswerVo adminAnswerVo);

	public void setSurveyQuestionAnswerDataDelete(AdminAnswerVo adminAnswerVo);

	public void setAdminAnswerInsert(AdminAnswerQuestionVo answerVo);

}
