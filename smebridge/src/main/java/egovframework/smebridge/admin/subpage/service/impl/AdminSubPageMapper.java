package egovframework.smebridge.admin.subpage.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.admin.subpage.model.AdminSubPageVo;

@Mapper("adminSubPageMapper")
public interface AdminSubPageMapper {

	public List<?> getAllList(AdminSubPageVo adminSubpageVo);

	public AdminSubPageVo getViewData(AdminSubPageVo adminSubpageVo);

	public void setAdminSubPageUpdateData(AdminSubPageVo adminSubpageVo);

	public void setAdminSubPageInsertData(AdminSubPageVo adminSubpageVo);

	public void setAdminSubPageDeleteData(AdminSubPageVo adminSubpageVo);

	
	
}
