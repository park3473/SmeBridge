package egovframework.smebridge.admin.survey.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.smebridge.admin.survey.model.AdminSurveyVo;
import egovframework.smebridge.admin.survey.service.AdminSurveyService;

@Controller
public class AdminSurveyController {

	@Autowired
	AdminSurveyService adminSurveyService;
	
	
	@RequestMapping(value="/admin/survey/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminSurveyList(@ModelAttribute("AdminSurveyVo")AdminSurveyVo AdminSurveyVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminSurveyVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminSurveyVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminSurveyVo.setPAGE(Integer.parseInt(PAGE));
		AdminSurveyVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminSurveyVo.getPAGE() * AdminSurveyVo.getITEM_COUNT();
		
		AdminSurveyVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminSurveyVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminSurveyService.getListAll(AdminSurveyVo);
		
		return new ModelAndView("admin/survey/list" , "model" , model);
		
	}
	
	
}
