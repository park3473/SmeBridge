package egovframework.smebridge.admin.member.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.member.model.AdminMemberVo;

public interface AdminMemberService {

	public ModelMap getAllList(AdminMemberVo adminMemberVo);

	public void setMemberData(AdminMemberVo adminMemberVo, String string);

	public ModelMap getMemberData(AdminMemberVo adminMemberVo);

	public String getIdCheck(AdminMemberVo adminMemberVo);

}
