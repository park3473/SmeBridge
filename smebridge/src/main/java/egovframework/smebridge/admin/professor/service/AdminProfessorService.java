package egovframework.smebridge.admin.professor.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.professor.model.AdminProfessorResearchVo;
import egovframework.smebridge.admin.professor.model.AdminProfessorVo;

public interface AdminProfessorService {

	public ModelMap getProfessorAllList(AdminProfessorVo adminProfessorVo);

	public ModelMap getProfessorView(AdminProfessorVo adminProfessorVo);

	public void setAdminProfessorData(AdminProfessorVo adminProfessorVo, String string);
	
	public List<?> getProfessorResearchList(AdminProfessorResearchVo researchVo);

	public void setAdminProfessorResearchData(AdminProfessorResearchVo adminProfessorResearchVo, String string);

	public void setAdminProfessorDataList(List<AdminProfessorResearchVo> list);

}
