package egovframework.smebridge.user.answer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.answer.model.UserAnswerVo;
import egovframework.smebridge.user.answer.service.UserAnswerService;


@Service("userAnswerService")
public class UserAnswerServiceImpl implements UserAnswerService {

	@Resource(name="userAnswerMapper")
	UserAnswerMapper userAnswerMapper;

	@Override
	public ModelMap getMyAnswerList(UserAnswerVo userAnswerVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = userAnswerMapper.getMyAnswerList(userAnswerVo);
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public ModelMap getMyAnswerData(UserAnswerVo userAnswerVo) {
		
		ModelMap model = new ModelMap();
		
		UserAnswerVo answerVo = new UserAnswerVo();
		
		answerVo = userAnswerMapper.getMyAnswerData(userAnswerVo);
		
		List<?> QuestionList = userAnswerMapper.getMyQuestionList(userAnswerVo);
		
		List<?> QuestionAnswerList = userAnswerMapper.getMyQuestionAnswerList(userAnswerVo);
		
		model.put("view", answerVo);
		
		model.put("QuestionList", QuestionList);
		
		model.put("QuestionAnswerList", QuestionAnswerList);
		
		return model;
	}
	
}
