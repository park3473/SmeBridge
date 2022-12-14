package egovframework.smebridge.user.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import egovframework.smebridge.user.board.model.UserBoardDataVo;
import egovframework.smebridge.user.board.model.UserBoardReplyVo;

public interface UserBoardDataService {

	public ModelMap getAllList(UserBoardDataVo userBoardDataVo);

	public void setBoardData(UserBoardDataVo userBoardDataVo, String SetType);

	public ModelMap getBoardData(UserBoardDataVo userBoardDataVo);

	public void DelBoardData(UserBoardDataVo userBoardDataVo);

	public ModelMap getReplyAllList(UserBoardReplyVo userBoardReplyVo);

	public void DelBoardReplyData(UserBoardReplyVo replyVo , String type);

	public void setBoardReplyDataUpdate(UserBoardReplyVo userBoardReplyVo);

	public void setBoardReplyDataInsert(UserBoardReplyVo userBoardReplyVo);


}
