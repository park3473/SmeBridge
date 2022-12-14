package egovframework.smebridge.user.board.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.user.board.model.UserBoardDataVo;
import egovframework.smebridge.user.board.model.UserBoardReplyVo;

@Mapper("userBoardDataMapper")
public interface UserBoardDataMapper {

	public List<?> getAllList(UserBoardDataVo userBoardDataVo);

	public int getAllListCnt(UserBoardDataVo userBoardDataVo);

	public void setBoardDataInsert(UserBoardDataVo userBoardDataVo);

	public void setBoardDataUpdate(UserBoardDataVo userBoardDataVo);

	public UserBoardDataVo getBoardData(UserBoardDataVo userBoardDataVo);

	public void DelBoardData(UserBoardDataVo userBoardDataVo);

	public List<?> getReplyAllList(UserBoardReplyVo userBoardReplyVo);

	public void DelBoardReplyDataList(UserBoardReplyVo replyVo);

	public void DelBoardReplyDataOne(UserBoardReplyVo replyVo);

	public void setBoardReplyUpdate(UserBoardReplyVo userBoardReplyVo);

	public void setBoardReplyInsert(UserBoardReplyVo userBoardReplyVo);


}
