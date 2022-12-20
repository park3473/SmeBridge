package egovframework.smebridge.user.professor.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.professor.model.UserProfessorVo;
import egovframework.smebridge.user.professor.service.UserProfessorService;

@Service("userProfessorService")
public class UserProfessorServiceImpl implements UserProfessorService {

	@Resource(name="userProfessorMapper")
	UserProfessorMapper userProfessorMapper;

	@Override
	public ModelMap getUserProfessorFieldList(UserProfessorVo userProfessorVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = userProfessorMapper.getUserProfessorFieldList(userProfessorVo);
		
		model.put("list", list);
		
		
		return model;
	}

	@Override
	public ModelMap getUserProfessorViewData(UserProfessorVo userProfessorVo) {
		
		ModelMap model = new ModelMap();
		
		UserProfessorVo professorVo = new UserProfessorVo();
		
		professorVo = userProfessorMapper.getUserProfessorViewData(userProfessorVo);
		
		List<?> list = userProfessorMapper.getUserProfessorResearchList(userProfessorVo);
		
		model.put("view", professorVo);
		
		model.put("list", list);
		
		return model;
	}
	
}
