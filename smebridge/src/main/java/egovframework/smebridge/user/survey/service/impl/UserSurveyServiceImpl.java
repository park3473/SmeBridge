package egovframework.smebridge.user.survey.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.smebridge.user.survey.service.UserSurveyService;


@Service("userSurveyService")
@Transactional
public class UserSurveyServiceImpl implements UserSurveyService {

	@Resource(name="userSurveyMapper")
	UserSurveyMapper userSurveyMapper;
	
}
