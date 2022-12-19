package egovframework.smebridge.user.professor.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.smebridge.user.professor.model.UserProfessorVo;
import egovframework.smebridge.user.professor.service.UserProfessorService;

@Controller
public class UserProfessorController {

	@Autowired
	UserProfessorService userProfessorservice;
	
	
	@RequestMapping(value="/user/professor/list.do" , method = RequestMethod.POST)
	public ModelAndView UserProfessorFieldList(@ModelAttribute("UserProfessorVo")UserProfessorVo UserProfessorVo , HttpServletRequest request , HttpServletResponse response) {
	
		ModelMap model = new ModelMap();
		
		model = userProfessorservice.getUserProfessorFieldList(UserProfessorVo);
		
		return new ModelAndView("user/professor/list" , "model" , model );
		
	}
}
