package egovframework.smebridge.user.member.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.user.member.model.UserMemberVo;

@Mapper("userMemberMapper")
public interface UserMemberMapper {

	public int getUserLoginAllConfirm(UserMemberVo userMemberVo);

	public int getUserLoginIdConfirm(UserMemberVo userMemberVo);

	public UserMemberVo getUserOneAllInfo(UserMemberVo userMemberVo);

	public UserMemberVo getUserMemberData(UserMemberVo userMemberVo);

	public void setMemberDataInsert(UserMemberVo userMemberVo);

	public void setMemberDataDelete(UserMemberVo userMemberVo);

	public void setMemberDataUpdate(UserMemberVo userMemberVo);

	public int getIdCheck(UserMemberVo userMemberVo);


}
