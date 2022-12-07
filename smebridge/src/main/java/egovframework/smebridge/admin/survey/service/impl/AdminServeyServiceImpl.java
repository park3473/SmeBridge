package egovframework.smebridge.admin.survey.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.smebridge.admin.survey.model.AdminSurveyVo;
import egovframework.smebridge.admin.survey.service.AdminSurveyService;


@Service("adminSurveyService")
@Transactional
public class AdminServeyServiceImpl implements AdminSurveyService {

	@Resource(name="adminSurveyMapper")
	AdminSurveyMapper adminSurveyMapper;

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
		model.put("itemcount" , pageVo.getItempage());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		model.put("list", list);
		
		return model;
	}
	
}
