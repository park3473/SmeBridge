package egovframework.smebridge.menu.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.menu.model.MenuVo;

@Mapper("MenuMapper")
public interface MenuMapper {

	public List<?> getMenuList();

	public void setMenuInsertData(MenuVo menuVo);

	public void setMenuUpdateData(MenuVo menuVo);

	public void setMenuDeleteData(MenuVo menuVo);

	public void setMenuDeleteList(MenuVo menuVo);

	public void setMenuTitleReOrder(MenuVo menuVo);

	public void setMenuSeqReOrder(MenuVo menuVo);

}
