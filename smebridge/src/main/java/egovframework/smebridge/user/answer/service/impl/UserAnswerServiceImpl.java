package egovframework.smebridge.user.answer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.answer.model.UserAnswerQuestionVo;
import egovframework.smebridge.user.answer.model.UserAnswerVo;
import egovframework.smebridge.user.answer.service.UserAnswerService;
import egovframework.smebridge.user.survey.model.UserSurveyVo;
import egovframework.smebridge.user.survey.service.impl.UserSurveyMapper;


@Service("userAnswerService")
public class UserAnswerServiceImpl implements UserAnswerService {

	@Resource(name="userAnswerMapper")
	UserAnswerMapper userAnswerMapper;
	
	@Resource(name="userSurveyMapper")
	UserSurveyMapper userSurveyMapper;

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

	@Override
	public void setUserAnswerListUpdate(List<UserAnswerQuestionVo> list) {
		
		UserAnswerQuestionVo answerVo = new UserAnswerQuestionVo();
		
		for(int i = 0; i < list.size(); i++) {
			
			System.out.println(i + "/" + list.size() + "번째");
			
			//초기화
			answerVo.setAnswer(null);
			answerVo.setAnswer_idx(null);
			answerVo.setIdx(null);
			answerVo.setQuestion_idx(null);
			answerVo.setSurvey_idx(null);
			
			//가져오기
			answerVo.setAnswer(list.get(i).getAnswer());
			answerVo.setAnswer_idx(list.get(i).getAnswer_idx());
			answerVo.setIdx(list.get(i).getIdx());
			answerVo.setQuestion_idx(list.get(i).getQuestion_idx());
			answerVo.setSurvey_idx(list.get(i).getSurvey_idx());
			
			//업데이트
			userAnswerMapper.setUserAnswerUpdate(answerVo);
			
		}
		
	}

	@Override
	public ModelMap getUserSurveyAnswerAll(UserSurveyVo userSurveyVo) {
		
		ModelMap model = new ModelMap();
		
		UserSurveyVo surveyVo = new UserSurveyVo();
		
		surveyVo = userSurveyMapper.getUserSurveyData(userSurveyVo);
		
		model.put("view", surveyVo);
		
		List<?> list = userSurveyMapper.getUserSurveyQuestionList(userSurveyVo);
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public String setSurveyAnswerData(UserAnswerVo userAnswerVo) {
		
		userAnswerMapper.setSurveyAnswerData(userAnswerVo);
		
		System.out.println("Answer_idx : " + userAnswerVo);
		
		String answer_idx = userAnswerVo.getIdx();
		
		return answer_idx;
	}

	@Override
	public void setSurveyQuestionAnswerList(List<UserAnswerQuestionVo> list) {
		
		
		UserAnswerQuestionVo answerVo = new UserAnswerQuestionVo();
		
		for(int i = 0; i < list.size(); i++) {
			
			System.out.println(i + "/" + list.size() + "번째");
			
			//초기화
			answerVo.setAnswer(null);
			answerVo.setAnswer_idx(null);
			answerVo.setQuestion_idx(null);
			answerVo.setSurvey_idx(null);
			
			//가져오기
			answerVo.setAnswer(list.get(i).getAnswer());
			answerVo.setAnswer_idx(list.get(i).getAnswer_idx());
			answerVo.setQuestion_idx(list.get(i).getQuestion_idx());
			answerVo.setSurvey_idx(list.get(i).getSurvey_idx());
			
			//업데이트
			userAnswerMapper.setUserAnswerInsert(answerVo);
			
		}
		
	}
}
