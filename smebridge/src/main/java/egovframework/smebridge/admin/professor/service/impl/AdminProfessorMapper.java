package egovframework.smebridge.admin.professor.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.admin.professor.model.AdminProfessorResearchVo;
import egovframework.smebridge.admin.professor.model.AdminProfessorVo;

@Mapper("adminProfessorMapper")
public interface AdminProfessorMapper {

	public List<?> getAllList(AdminProfessorVo adminProfessorVo);

	public int getAllListCount(AdminProfessorVo adminProfessorVo);

	public AdminProfessorVo getProfessorDataView(AdminProfessorVo adminProfessorVo);

	public void setAdminProfessorDataInsert(AdminProfessorVo adminProfessorVo);

	public void setAdminProfessorDataUpdate(AdminProfessorVo adminProfessorVo);

	public void setAdminProfessorDataDelete(AdminProfessorVo adminProfessorVo);

	public List<?> getProfessorResearchDataList(AdminProfessorResearchVo researchVo);

	public void setAdminProfessorResearchDataInsert(AdminProfessorResearchVo adminProfessorResearchVo);

	public void setAdminProfessorResearchDataDelete(AdminProfessorResearchVo adminProfessorResearchVo);

	public void setAdminProfessorResearchDataUpdate(AdminProfessorResearchVo researchVo);

	public void setResearchReOrder(AdminProfessorResearchVo adminProfessorResearchVo);

	
	
}
