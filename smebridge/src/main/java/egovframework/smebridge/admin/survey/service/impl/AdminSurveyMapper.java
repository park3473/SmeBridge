package egovframework.smebridge.admin.survey.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.admin.survey.model.AdminSurveyVo;

@Mapper("adminSurveyMapper")
public interface AdminSurveyMapper {

	public List<?> getAllList(AdminSurveyVo adminSurveyVo);

	public int getAllListCount(AdminSurveyVo adminSurveyVo);
	
}
