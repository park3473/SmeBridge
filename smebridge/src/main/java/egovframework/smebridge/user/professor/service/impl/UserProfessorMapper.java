package egovframework.smebridge.user.professor.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.user.professor.model.UserProfessorVo;

@Mapper("userProfessorMapper")
public interface UserProfessorMapper {

	public List<?> getUserProfessorFieldList(UserProfessorVo userProfessorVo);

	public UserProfessorVo getUserProfessorViewData(UserProfessorVo userProfessorVo);

	public List<?> getUserProfessorResearchList(UserProfessorVo userProfessorVo);

}
