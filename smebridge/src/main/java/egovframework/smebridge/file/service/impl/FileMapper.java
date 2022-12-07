package egovframework.smebridge.file.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.smebridge.file.model.FileVo;

@Mapper("FileMapper")
public interface FileMapper {

	public void setFileData(FileVo filevo);

	public List<?> getFileList(FileVo filevo);

	public void setFileUpdate(FileVo fileVo);

	
}
