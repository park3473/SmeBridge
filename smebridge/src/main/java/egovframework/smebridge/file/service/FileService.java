package egovframework.smebridge.file.service;

import java.util.List;

import egovframework.smebridge.file.model.FileVo;

public interface FileService {

	public void setFileData(FileVo filevo);

	public List<?> getFileList(FileVo filevo);

	public void setFileUpdate(FileVo fileVo);

	

}
