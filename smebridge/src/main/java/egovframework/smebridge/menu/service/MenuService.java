package egovframework.smebridge.menu.service;

import java.util.List;

import egovframework.smebridge.menu.model.MenuVo;

public interface MenuService {

	public List<?> getMenuList();

	public void setMenuData(MenuVo menuVo, String type);

}
