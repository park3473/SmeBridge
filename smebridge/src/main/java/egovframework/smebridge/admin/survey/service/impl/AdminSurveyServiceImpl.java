package egovframework.smebridge.admin.survey.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.smebridge.admin.survey.model.AdminSurveyQuestionVo;
import egovframework.smebridge.admin.survey.model.AdminSurveyVo;
import egovframework.smebridge.admin.survey.service.AdminSurveyService;


@Service("adminSurveyService")
@Transactional
public class AdminSurveyServiceImpl implements AdminSurveyService {

	@Resource(name="adminSurveyMapper")
	AdminSurveyMapper adminSurveyMapper;

	@Resource(name="adminSurveyQuestionMapper")
	AdminSurveyQuestionMapper adminSurveyQuestionMapper;
	
	@Override
	public ModelMap getListAll(AdminSurveyVo adminSurveyVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = adminSurveyMapper.getAllList(adminSurveyVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = adminSurveyMapper.getAllListCount(adminSurveyVo);
		int itemcount = adminSurveyVo.getITEM_COUNT();
		int itempage = adminSurveyVo.getITEM_PAGE();
		
		PageVO pageVo = new PageVO(itemcount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		model.put("page" , pageVo.getItempage());
		model.put("itemcount" , pageVo.getItemCount());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public void setSurveyData(AdminSurveyVo adminSurveyVo, String type) {
		
		
		switch (type) {
		case "insert":
			adminSurveyMapper.setSurveyInsert(adminSurveyVo);
			break;
		case "update":
			adminSurveyMapper.setSurveyUpdate(adminSurveyVo);
			//해당 관련된 answer 수정
			break;
		case "delete":
			adminSurveyMapper.setSurveyDelete(adminSurveyVo);
			//해당 관련된 question 삭제
			adminSurveyQuestionMapper.setSurveyQuestionListDelete(adminSurveyVo);
			//해당 관련된 answer 삭제 는....삭제 안함
			
			break;
		default:
			System.out.println("type 오류");
			break;
		}

	}

	@Override
	public ModelMap getSurveyData(AdminSurveyVo adminSurveyVo) {
		
		ModelMap model = new ModelMap();
		
		AdminSurveyVo surveyVo = new AdminSurveyVo();
		
		surveyVo = adminSurveyMapper.getSurveyData(adminSurveyVo);
		
		AdminSurveyQuestionVo questionVo = new AdminSurveyQuestionVo();
		
		questionVo.setSurvey_idx(surveyVo.getIdx());
		
		List<?> list = adminSurveyQuestionMapper.getSurveyQuestionList(questionVo);
		
		model.put("question_list", list);
		
		model.put("view", surveyVo);
		
		return model;
	}
	
}
