package egovframework.smebridge.admin.professor.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.professor.model.AdminProfessorVo;

public interface AdminProfessorService {

	public ModelMap getProfessorAllList(AdminProfessorVo adminProfessorVo);

	public ModelMap getProfessorView(AdminProfessorVo adminProfessorVo);

}
