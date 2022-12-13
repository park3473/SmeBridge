package egovframework.smebridge.user.survey.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import egovframework.smebridge.user.survey.service.UserSurveyService;

@Controller
public class UserSurveyController {

	@Autowired
	UserSurveyService userSurveyService;
	
}
