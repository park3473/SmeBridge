package egovframework.smebridge.user.subpage.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.subpage.model.UserSubPageVo;

public interface UserSubpageService {

	public ModelMap getSubPageData(UserSubPageVo userSubPageVo);

	public ModelMap getSubPageContent(UserSubPageVo userSubPageVo);

	

}
