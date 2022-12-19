package egovframework.smebridge.user.survey.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.smebridge.user.survey.model.UserSurveyVo;
import egovframework.smebridge.user.survey.service.UserSurveyService;


@Service("userSurveyService")
@Transactional
public class UserSurveyServiceImpl implements UserSurveyService {

	@Resource(name="userSurveyMapper")
	UserSurveyMapper userSurveyMapper;

	@Override
	public ModelMap getUserSurveyAllList(UserSurveyVo userSurveyVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = userSurveyMapper.getUserSurveyAllList(userSurveyVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = userSurveyMapper.getAllListCount(userSurveyVo);
		int itemcount = userSurveyVo.getITEM_COUNT();
		int itempage = userSurveyVo.getITEM_PAGE();
		
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
	public ModelMap getUserSurveyViewData(UserSurveyVo userSurveyVo) {
		
		ModelMap model = new ModelMap();
		
		UserSurveyVo surveyVo = new UserSurveyVo();
		
		surveyVo = userSurveyMapper.getUserSurveyData(userSurveyVo);
		
		model.put("view", surveyVo);
		
		return model;
	}
	
}
