package egovframework.smebridge.user.subpage.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.user.subpage.model.UserSubPageVo;

@Mapper("userSubPageMapper")
public interface UserSubPageMapper {

	public UserSubPageVo getSubPageData(UserSubPageVo userSubPageVo);

}
