package egovframework.smebridge.user.subpage.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.subpage.model.UserSubPageVo;
import egovframework.smebridge.user.subpage.service.UserSubpageService;


@Service("userSubPageService")
@Transactional
public class UserSubPageServiceImpl implements UserSubpageService {

	@Resource(name="userSubPageMapper")
	UserSubPageMapper userSubPageMapper;

	@Override
	public ModelMap getSubPageData(UserSubPageVo userSubPageVo) {
		
		ModelMap model = new ModelMap();
		
		UserSubPageVo vo = new UserSubPageVo();
		
		vo = userSubPageMapper.getSubPageData(userSubPageVo);
		
		model.put("view", vo);
		
		return model;
	}
	
}