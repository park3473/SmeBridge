package egovframework.smebridge.admin.answer.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.answer.model.AdminAnswerQuestionVo;
import egovframework.smebridge.admin.answer.model.AdminAnswerVo;

public interface AdminAnswerService {

	public ModelMap getAnswerAllList(AdminAnswerVo adminAnswerVo);

	public String setSurveyAnswerData(AdminAnswerVo adminAnswerVo);

	public void setSurveyQuestionAnswerDataList(List<AdminAnswerQuestionVo> list);

	public ModelMap getAnswerDataView(AdminAnswerVo adminAnswerVo);

	public void setAllAnswerDeleteData(AdminAnswerVo adminAnswerVo);

}
