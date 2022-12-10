package egovframework.smebridge.admin.professor.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.admin.professor.model.AdminProfessorVo;

@Mapper("adminProfessorMapper")
public interface AdminProfessorMapper {

	public List<?> getAllList(AdminProfessorVo adminProfessorVo);

	public int getAllListCount(AdminProfessorVo adminProfessorVo);

	public AdminProfessorVo getProfessorDataView(AdminProfessorVo adminProfessorVo);

	
	
}
