package egovframework.smebridge.admin.professor.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.smebridge.admin.professor.model.AdminProfessorVo;
import egovframework.smebridge.admin.professor.service.AdminProfessorService;

@Controller
public class AdminProfessorController {

	@Autowired
	AdminProfessorService adminProfessrorService;
	
	@RequestMapping(value="/admin/professor/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminProfessorAllList(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminProfessorVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminProfessorVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminProfessorVo.setPAGE(Integer.parseInt(PAGE));
		AdminProfessorVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminProfessorVo.getPAGE() * AdminProfessorVo.getITEM_COUNT();
		
		AdminProfessorVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminProfessorVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminProfessrorService.getProfessorAllList(AdminProfessorVo);
		
		return new ModelAndView("admin/professor/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/professor/insert.do" , method = RequestMethod.GET)
	public String AdminProfessorInsertView(HttpServletRequest request , HttpServletResponse response) {
		
		return "admin/professor/insert";
		
	}
	
	@RequestMapping(value="/admin/professor/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8" )
	@ResponseBody
	public String AdminProfessorInsertData(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) {
		
		String professor_idx = "";
		
		return professor_idx;
		
	}
	
	@RequestMapping(value="/admin/professor/view.do" , method = RequestMethod.GET)
	public ModelAndView AdminProfessorView(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminProfessrorService.getProfessorView(AdminProfessorVo);
		
		return new ModelAndView("admin/professor/view" , "model" , model);
		
	}
	
	
}
