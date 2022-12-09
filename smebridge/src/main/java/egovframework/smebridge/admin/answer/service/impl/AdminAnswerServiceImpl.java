package egovframework.smebridge.admin.answer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.smebridge.admin.answer.model.AdminAnswerQuestionVo;
import egovframework.smebridge.admin.answer.model.AdminAnswerVo;
import egovframework.smebridge.admin.answer.service.AdminAnswerService;
import egovframework.smebridge.admin.survey.model.AdminSurveyQuestionVo;
import egovframework.smebridge.admin.survey.model.AdminSurveyVo;
import egovframework.smebridge.admin.survey.service.impl.AdminSurveyMapper;
import egovframework.smebridge.admin.survey.service.impl.AdminSurveyQuestionMapper;

@Service("adminAnswerService")
public class AdminAnswerServiceImpl implements AdminAnswerService {

	@Resource(name="adminAnswerMapper")
	AdminAnswerMapper adminAnswerMapper;
	
	@Resource(name="adminSurveyMapper")
	AdminSurveyMapper adminSurveyMapper;

	@Resource(name="adminSurveyQuestionMapper")
	AdminSurveyQuestionMapper adminSurveyQuestionMapper;

	@Override
	public ModelMap getAnswerAllList(AdminAnswerVo adminAnswerVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = adminAnswerMapper.getAnswerAllList(adminAnswerVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = adminAnswerMapper.getAllListCount(adminAnswerVo);
		int itemcount = adminAnswerVo.getITEM_COUNT();
		int itempage = adminAnswerVo.getITEM_PAGE();
		
		PageVO pageVo = new PageVO(itemcount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		model.put("page" , pageVo.getItempage());
		model.put("itemcount" , pageVo.getItempage());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public String setSurveyAnswerData(AdminAnswerVo adminAnswerVo) {
		
		adminAnswerMapper.setSurveyAnswerData(adminAnswerVo);
		
		System.out.println("Answer_idx : " + adminAnswerVo.getIdx());
		
		String answer_idx = adminAnswerVo.getIdx();
		
		return answer_idx;
	}

	@Override
	public void setSurveyQuestionAnswerDataList(List<AdminAnswerQuestionVo> list) {
		
		System.out.println(list.size());
		
		AdminAnswerQuestionVo answerVo = new AdminAnswerQuestionVo();
		
		for(int i = 0; i < list.size(); i ++) {
			
			//초기화
			answerVo.setAnswer(null);
			answerVo.setAnswer_idx(null);
			answerVo.setQuestion_idx(null);
			answerVo.setSurvey_idx(null);
			
			//생성
			answerVo.setAnswer(list.get(i).getAnswer());
			answerVo.setAnswer_idx(list.get(i).getAnswer_idx());
			answerVo.setQuestion_idx(list.get(i).getQuestion_idx());
			answerVo.setSurvey_idx(list.get(i).getSurvey_idx());
			
			adminAnswerMapper.setSurveyAnswerQuestionData(answerVo);
			
		}
		
	}

	@Override
	public ModelMap getAnswerDataView(AdminAnswerVo adminAnswerVo) {
		
		ModelMap model = new ModelMap();
		
		//설문폼
		AdminSurveyVo surveyVo1 = new AdminSurveyVo();
		AdminSurveyVo surveyVo2 = new AdminSurveyVo();
		
		surveyVo1.setIdx(adminAnswerVo.getSurvey_idx());
		
		surveyVo2 = adminSurveyMapper.getSurveyData(surveyVo1);
		
		//설문 목록
		AdminSurveyQuestionVo questionVo = new AdminSurveyQuestionVo();
		
		questionVo.setSurvey_idx(adminAnswerVo.getSurvey_idx());
		
		List<?> questionlist = adminSurveyQuestionMapper.getSurveyQuestionList(questionVo);
		
		//작성자
		AdminAnswerVo answerVo = new AdminAnswerVo();
		
		answerVo = adminAnswerMapper.getAnswerDataView(adminAnswerVo);
		
		//작성자 답변 리스트
		List<?> answerlist = adminAnswerMapper.getAllSurveyQuestionAnswerList(adminAnswerVo);
		
		
		model.put("SurveyView", surveyVo2);
		
		model.put("QuestionList", questionlist);
		
		model.put("AnswerView", answerVo);
		
		model.put("AnswerList", answerlist);
		
		return model;
	}

	@Override
	public void setAllAnswerDeleteData(AdminAnswerVo adminAnswerVo) {
		
		adminAnswerMapper.setSurveyAnswerDataDelete(adminAnswerVo);
		
		adminAnswerMapper.setSurveyQuestionAnswerDataDelete(adminAnswerVo);
		
	}
	
	
	
}
