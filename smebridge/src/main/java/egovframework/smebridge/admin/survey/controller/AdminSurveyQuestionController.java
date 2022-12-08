package egovframework.smebridge.admin.survey.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.smebridge.admin.survey.model.AdminSurveyQuestionVo;
import egovframework.smebridge.admin.survey.service.AdminSurveyQuestionService;

@Controller
public class AdminSurveyQuestionController {

	@Autowired
	AdminSurveyQuestionService adminSurveyQuestionService;
	
	@RequestMapping(value="/admin/api/survey/question/list.do")
	@ResponseBody
	public ModelMap AdminSurveyQuestionList(@ModelAttribute("AdminSurveyQuestionVo")AdminSurveyQuestionVo AdminSurveyQuestionVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminSurveyQuestionService.getSurveyQuestionList(AdminSurveyQuestionVo);
		
		return model;
		
	}
	
	@RequestMapping(value="/admin/survey/question/insert.do" , method = RequestMethod.POST)
	public void AdminSurveyQuestionInsert(@ModelAttribute("AdminSurveyQuestionVo")AdminSurveyQuestionVo AdminSurveyQuestionVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminSurveyQuestionService.setSurveyQuestionData(AdminSurveyQuestionVo , "insert");
		
	}
	
}
