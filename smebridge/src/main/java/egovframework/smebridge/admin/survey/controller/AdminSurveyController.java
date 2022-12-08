package egovframework.smebridge.admin.survey.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.smebridge.admin.survey.model.AdminSurveyVo;
import egovframework.smebridge.admin.survey.service.AdminSurveyQuestionService;
import egovframework.smebridge.admin.survey.service.AdminSurveyService;

@Controller
public class AdminSurveyController {

	@Autowired
	AdminSurveyService adminSurveyService;
	
	@Autowired
	AdminSurveyQuestionService adminSurveyQuestionService;
	
	
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
	
	@RequestMapping(value="/admin/survey/insert.do" , method = RequestMethod.GET)
	public String AdminSurveyInsertView(@ModelAttribute("AdminSurveyVo")AdminSurveyVo AdminSurveyVo , HttpServletRequest request , HttpServletResponse response) {
		
		return "admin/survey/insert";
		
	}
	
	@RequestMapping(value="/admin/survey/insert.do" , method = RequestMethod.POST)
	public void AdminSurveyDataInsert(@ModelAttribute("AdminSurveyVo")AdminSurveyVo AdminSurveyVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminSurveyService.setSurveyData(AdminSurveyVo , "insert");
		
		SUtil.AlertAndPageMove(response, "설문지가 작성되었습니다.", "/admin/survey/list.do");
		
	}
	
	@RequestMapping(value="/admin/survey/view.do" , method = RequestMethod.GET)
	public ModelAndView AdminSurveyDataView(@ModelAttribute("AdminSurveyVo")AdminSurveyVo AdminSurveyVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminSurveyService.getSurveyData(AdminSurveyVo);
		
		return new ModelAndView("admin/survey/view" , "model" , model);
	}
	
	@RequestMapping(value="/admin/survey/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminSurveyUpdateView(@ModelAttribute("AdminSurveyVo")AdminSurveyVo AdminSurveyVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminSurveyService.getSurveyData(AdminSurveyVo);
		
		return new ModelAndView("admin/survey/update" , "model" , model);
	}
	
	
	@RequestMapping(value="/admin/survey/update.do" , method = RequestMethod.POST)
	public void AdminSurveDatayUpdate(@ModelAttribute("AdminSurveyVo")AdminSurveyVo AdminSurveyVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminSurveyService.setSurveyData(AdminSurveyVo , "update");
		
		SUtil.AlertAndPageMove(response, "설문지가 수정되었습니다.", "/admin/survey/list.do");
		
	}
	
	@RequestMapping(value="/admin/survey/delete.do" , method = RequestMethod.POST)
	public void AdminSurveyDataDelete(@ModelAttribute("AdminSurveyVo")AdminSurveyVo AdminSurveyVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminSurveyService.setSurveyData(AdminSurveyVo , "delete");
		
		SUtil.AlertAndPageMove(response, "설문지가 삭제되었습니다.", "/admin/survey/list.do");
		
	}
	
	
}
