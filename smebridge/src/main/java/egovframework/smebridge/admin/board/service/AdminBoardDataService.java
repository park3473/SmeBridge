package egovframework.smebridge.admin.board.service;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.admin.board.model.AdminBoardDataVo;
import egovframework.smebridge.admin.board.model.AdminBoardReplyVo;

public interface AdminBoardDataService {

	public ModelMap getAllList(AdminBoardDataVo adminBoardDataVo);

	public void setBoardData(AdminBoardDataVo adminBoardDataVo, String string);

	public ModelMap getBoardData(AdminBoardDataVo adminBoardDataVo);

	public ModelMap getReplyAllList(AdminBoardReplyVo adminBoardReplyVo);

	public void setBoardReplyData(AdminBoardReplyVo adminBoardReplyVo, String string);

	public void setBoardReplyDataList(AdminBoardDataVo adminBoardDataVo, String string);

}
