package egovframework.smebridge.user.survey.controller;

import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.smebridge.user.answer.model.UserAnswerVo;
import egovframework.smebridge.user.survey.model.UserSurveyVo;
import egovframework.smebridge.user.survey.service.UserSurveyService;

@Controller
public class UserSurveyController {

	@Autowired
	UserSurveyService userSurveyService;
	
	@RequestMapping(value="/user/survey/list.do" , method = RequestMethod.GET)
	public ModelAndView UserSurveyList(@ModelAttribute("UserSurveyVo")UserSurveyVo UserSurveyVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + UserSurveyVo.getPAGE());
		System.out.println("ITEM_COUNT : " + UserSurveyVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		UserSurveyVo.setPAGE(Integer.parseInt(PAGE));
		UserSurveyVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = UserSurveyVo.getPAGE() * UserSurveyVo.getITEM_COUNT();
		
		UserSurveyVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		UserSurveyVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = userSurveyService.getUserSurveyAllList(UserSurveyVo);
		
		return new ModelAndView("user/survey/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/survey/view.do" , method = RequestMethod.GET)
	public ModelAndView UserSurveyView(@ModelAttribute("UserSurveyVo")UserSurveyVo UserSurveyVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userSurveyService.getUserSurveyViewData(UserSurveyVo);
		
		return new ModelAndView("user/survey/view" , "model" , model);
		
	}
	
	
}
