package egovframework.smebridge.admin.survey.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.survey.model.AdminSurveyQuestionVo;
import egovframework.smebridge.admin.survey.service.AdminSurveyQuestionService;


@Service("adminSurveyQuestionService")
@Transactional
public class AdminSurveyQuestionServiceImpl implements AdminSurveyQuestionService {

	@Resource(name="adminSurveyQuestionMapper")
	AdminSurveyQuestionMapper adminSurveyQuestionMapper;

	@Override
	public ModelMap getSurveyQuestionList(AdminSurveyQuestionVo adminSurveyQuestionVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = adminSurveyQuestionMapper.getSurveyQuestionList(adminSurveyQuestionVo);
		
		return model;
	}

	@Override
	public void setSurveyQuestionData(AdminSurveyQuestionVo adminSurveyQuestionVo, String type) {
		
		switch (type) {
		case "insert":
			adminSurveyQuestionMapper.setSurveyQuestionDataInsert(adminSurveyQuestionVo);
			break;
		case "update":
			adminSurveyQuestionMapper.setSurveyQuestionDataUpdate(adminSurveyQuestionVo);
			break;
		case "delete":
			adminSurveyQuestionMapper.setSurveyQuestionDataDelete(adminSurveyQuestionVo);
			
			//순서 재정렬
			System.out.println("====순서 재정렬====");
			adminSurveyQuestionMapper.setSurveyQuestionDataReOrder(adminSurveyQuestionVo);
			break;
		default:
			System.out.println("type 오류");
			break;
		}
		
		
	}
}
