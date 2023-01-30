package egovframework.smebridge.user.answer.controller;

import java.util.List;

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

import egovframework.smebridge.user.answer.model.UserAnswerQuestionVo;
import egovframework.smebridge.user.answer.model.UserAnswerVo;
import egovframework.smebridge.user.answer.service.UserAnswerService;
import egovframework.smebridge.user.survey.model.UserSurveyVo;

@Controller
public class UserAnswerController {

	@Autowired
	UserAnswerService userAnswerService;
	
	@RequestMapping(value="/user/survey/answer/insert.do" , method = RequestMethod.GET)
	public ModelAndView UserSurveyAnswerInsert(@ModelAttribute("UserSurveyVo")UserSurveyVo UserSurveyVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userAnswerService.getUserSurveyAnswerAll(UserSurveyVo);
		
		return new ModelAndView("user/survey/answer" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/survey/answer/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String UserSurveyAnswerInsertData(@ModelAttribute("UserAnswerVo")UserAnswerVo UserAnswerVo , HttpServletRequest request , HttpServletResponse response) {
		
		String answer_idx = userAnswerService.setSurveyAnswerData(UserAnswerVo);
		
		return answer_idx;
		
	}
	
	@RequestMapping(value="/user/survey/question/answer/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public void SurveyQuestionAnswerInsert(@RequestBody List<UserAnswerQuestionVo> list , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("size : " + list.size());
		
		userAnswerService.setSurveyQuestionAnswerList(list);
		
	}
	
}
