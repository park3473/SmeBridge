package egovframework.smebridge.admin.answer.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.smebridge.admin.answer.model.AdminAnswerQuestionVo;
import egovframework.smebridge.admin.answer.model.AdminAnswerVo;
import egovframework.smebridge.admin.answer.service.AdminAnswerService;
import egovframework.smebridge.admin.survey.model.AdminSurveyVo;
import egovframework.smebridge.admin.survey.service.AdminSurveyQuestionService;
import egovframework.smebridge.admin.survey.service.AdminSurveyService;

@Controller
public class AdminAnswerController {

	@Autowired
	AdminAnswerService adminAnswerService;
	
	@Autowired
	AdminSurveyService adminSurveyService;
	
	@Autowired
	AdminSurveyQuestionService adminSurveyQuestionService;
	
	@RequestMapping(value="/admin/survey/answer/list.do" , method = RequestMethod.GET)
	public ModelAndView SurveyAnswerAllList(@ModelAttribute("AdminAnswerVo")AdminAnswerVo AdminAnswerVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminAnswerVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminAnswerVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminAnswerVo.setPAGE(Integer.parseInt(PAGE));
		AdminAnswerVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminAnswerVo.getPAGE() * AdminAnswerVo.getITEM_COUNT();
		
		AdminAnswerVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminAnswerVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminAnswerService.getAnswerAllList(AdminAnswerVo);
		
		return new ModelAndView("admin/answer/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/survey/answer/insert.do" , method = RequestMethod.GET)
	public ModelAndView SurveyAnswerInsertView(@ModelAttribute("AdminAnswerVo")AdminAnswerVo AdminAnswerVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		
		AdminSurveyVo surveyVo = new AdminSurveyVo();
		  
		surveyVo.setIdx(AdminAnswerVo.getSurvey_idx());
		  
		model = adminSurveyService.getSurveyData(surveyVo);
		 
		return new ModelAndView("admin/answer/insert" , "model" , model);
	}
	
	@RequestMapping(value="/admin/survey/answer/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String SurveyAnswerInsertData(@ModelAttribute("AdminAnswerVo")AdminAnswerVo AdminAnswerVo ,HttpServletRequest request , HttpServletResponse response) {
		
		//설문자 등록
		String answer_idx = adminAnswerService.setSurveyAnswerData(AdminAnswerVo);
		
		return answer_idx;
		
	}
	
	@RequestMapping(value="/admin/survey/question/answer/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public void SurveyAnswerQuestionInsertData(@RequestBody List<AdminAnswerQuestionVo> list ,HttpServletRequest request , HttpServletResponse response) {

		//설문지 등록
		System.out.println(list.size());
		
		for(int i = 0; i < list.size(); i ++) {
			
			System.out.println("index : " + i);
			System.out.println("survey_idx : " + list.get(i).getSurvey_idx());
			System.out.println("answer_idx : " + list.get(i).getAnswer_idx());
			System.out.println("question_idx : " + list.get(i).getQuestion_idx());
			
			
		}
		
		adminAnswerService.setSurveyQuestionAnswerDataList(list);
		
		
	}
	
	@RequestMapping(value="/admin/survey/answer/view.do" , method = RequestMethod.GET)
	public ModelAndView SurveyAnswerQuestionViewData(@ModelAttribute("AdminAnswerVo")AdminAnswerVo AdminAnswerVo ,HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminAnswerService.getAnswerDataView(AdminAnswerVo);
		
		return new ModelAndView("admin/answer/view" , "model" , model);
	}
	
	@RequestMapping(value="/admin/survey/answer/delete.do" , method = RequestMethod.POST)
	public void SurveyAnswerQuestionDeleteData(@ModelAttribute("AdminAnswerVo")AdminAnswerVo AdminAnswerVo ,HttpServletRequest request , HttpServletResponse response) {
		
		//전체 삭제
		adminAnswerService.setAllAnswerDeleteData(AdminAnswerVo);
		
	}
	
}
