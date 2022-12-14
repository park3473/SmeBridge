package egovframework.smebridge.admin.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.smebridge.admin.board.model.AdminBoardDataVo;
import egovframework.smebridge.admin.board.model.AdminBoardReplyVo;
import egovframework.smebridge.admin.board.model.AdminBoardVo;
import egovframework.smebridge.admin.board.service.AdminBoardDataService;
import egovframework.smebridge.admin.board.service.AdminBoardService;
import egovframework.smebridge.file.model.FileVo;
import egovframework.smebridge.file.service.FileService;

@Controller
public class AdminBoardDataContorller {

	@Autowired
	AdminBoardDataService adminBoardDataService;
	
	@Autowired
	AdminBoardService adminBoardService;
	
	@Autowired
	FileService fileService;
	
	@RequestMapping(value="/admin/board_data/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminBoardDataList(@ModelAttribute("AdminBoardDataVo")AdminBoardDataVo AdminBoardDataVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		System.out.println("PAGE : " + AdminBoardDataVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminBoardDataVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminBoardDataVo.setPAGE(Integer.parseInt(PAGE));
		AdminBoardDataVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminBoardDataVo.getPAGE() * AdminBoardDataVo.getITEM_COUNT();
		
		AdminBoardDataVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminBoardDataVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminBoardDataService.getAllList(AdminBoardDataVo);
		
		return new ModelAndView("admin/board_data/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/board_data/insert.do" , method = RequestMethod.GET)
	public ModelAndView AdminBoardDataInsertView(@ModelAttribute("AdminBoardDataVo")AdminBoardDataVo AdminBoardDataVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		AdminBoardVo BoardConfig = new AdminBoardVo();
		
		BoardConfig.setIdx(AdminBoardDataVo.getBoard_idx());
		
		BoardConfig = adminBoardService.getBoardConfig(BoardConfig);
		
		model.put("BoardConfig", BoardConfig);
		
		return new ModelAndView("admin/board_data/insert" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/board_data/insert.do" , method = RequestMethod.POST)
	public void AdminBoardDataInsert(@ModelAttribute("AdminBoardDataVo")AdminBoardDataVo AdminBoardDataVo , MultipartHttpServletRequest request , HttpServletResponse response) throws IOException {
		
		System.out.println("Board_data_idx : " + AdminBoardDataVo.getIdx());
		System.out.println("Board_idx : " + AdminBoardDataVo.getBoard_idx());
		
		String Board_data_idx = AdminBoardDataVo.getIdx();
		String Board_idx = AdminBoardDataVo.getBoard_idx();
		
		FileVo filevo = new FileVo();
		
		//?????? ??????
		String drv = request.getRealPath("");
		drv = drv.substring(0 , drv.length()) + "./resources/" + ((HttpServletRequest) request).getContextPath() + "/upload/file/";
		
		String filename = SUtil.setFileUpload(request, drv);
		
		String files[] = filename.split(",");
		
		for(int i = 0; i < files.length; i ++) {
			
			String saveFile = files[i];
			
			filevo.setType("insert");
			filevo.setFilename(saveFile);
			filevo.setUrl(request.getRequestURI());
			filevo.setBoard_idx(Board_idx);
			filevo.setBoard_data_idx(Board_data_idx);
			
			fileService.setFileData(filevo);
			
		}
		
		AdminBoardDataVo.setFile(filename);
		
		adminBoardDataService.setBoardData(AdminBoardDataVo , "insert");
		
		SUtil.AlertAndPageMove(response, "???????????? ?????????????????????." , "/admin/board_data/list.do?Board_idx=" + Board_idx);
		
	}
	
	@RequestMapping(value="/admin/board_data/view.do" , method = RequestMethod.GET)
	public ModelAndView AdminBoardDataView(@ModelAttribute("AdminBoardDataVo")AdminBoardDataVo AdminBoardDataVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		AdminBoardVo BoardConfig = new AdminBoardVo();
		
		BoardConfig.setIdx(AdminBoardDataVo.getBoard_idx());
		
		model = adminBoardDataService.getBoardData(AdminBoardDataVo);
		
		BoardConfig = adminBoardService.getBoardConfig(BoardConfig);
		
		model.put("BoardConfig", BoardConfig);
		
		//board_data_file ????????????
		FileVo filevo = new FileVo();
		filevo.setBoard_data_idx(AdminBoardDataVo.getIdx());
		filevo.setBoard_idx(AdminBoardDataVo.getBoard_idx());
		List<?> filelist = fileService.getFileList(filevo);
		
		model.put("filelist", filelist);
		
		return new ModelAndView("admin/board_data/view" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/board_data/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminBoardDataUpdateView(@ModelAttribute("AdminBoardDataVo")AdminBoardDataVo AdminBoardDataVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		AdminBoardVo BoardConfig = new AdminBoardVo();
		
		BoardConfig.setIdx(AdminBoardDataVo.getBoard_idx());
		
		model = adminBoardDataService.getBoardData(AdminBoardDataVo);
				
		BoardConfig = adminBoardService.getBoardConfig(BoardConfig);
		
		model.put("BoardConfig", BoardConfig);
		
		//board_data_file ????????????
		FileVo filevo = new FileVo();
		filevo.setBoard_data_idx(AdminBoardDataVo.getIdx());
		filevo.setBoard_idx(AdminBoardDataVo.getBoard_idx());
		List<?> filelist = fileService.getFileList(filevo);
				
		model.put("filelist", filelist);
		
		
		return new ModelAndView("admin/board_data/update" , "model" , model);
	}
	
	@RequestMapping(value="/admin/board_data/update.do" , method = RequestMethod.POST)
	public void AdminBoardDataUpdate(@ModelAttribute("AdminBoardDataVo")AdminBoardDataVo AdminBoardDataVo , MultipartHttpServletRequest request , HttpServletResponse response) throws IOException {
		
		
		System.out.println("Board_data_idx : " + AdminBoardDataVo.getIdx());
		System.out.println("Board_idx : " + AdminBoardDataVo.getBoard_idx());
		
		String Board_data_idx = AdminBoardDataVo.getIdx();
		String Board_idx = AdminBoardDataVo.getBoard_idx();
		
		FileVo filevo = new FileVo();
		
		//?????? ??????
		String drv = request.getRealPath("");
		drv = drv.substring(0 , drv.length()) + "./resources/" + ((HttpServletRequest) request).getContextPath() + "/upload/file/";
		
		String filename = SUtil.setFileUpload(request, drv);
		
		String files[] = filename.split(",");
		
		for(int i = 0; i < files.length; i ++) {
			
			String saveFile = files[i];
			
			filevo.setType("insert");
			filevo.setFilename(saveFile);
			filevo.setUrl(request.getRequestURI());
			filevo.setBoard_idx(Board_idx);
			filevo.setBoard_data_idx(Board_data_idx);
			
			fileService.setFileData(filevo);
			
		}
		
		adminBoardDataService.setBoardData(AdminBoardDataVo , "update");
		
		SUtil.AlertAndPageMove(response, "???????????? ?????????????????????." , "/admin/board_data/list.do?Board_idx=" + Board_idx);
		
	}
	
	@RequestMapping(value="/admin/board_data/delete" , method = RequestMethod.POST)
	public void AdminBoardDataDelete(@ModelAttribute("AdminBoardDataVo")AdminBoardDataVo AdminBoardDataVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		System.out.println("Board_data_idx : " + AdminBoardDataVo.getIdx());
		System.out.println("Board_idx : " + AdminBoardDataVo.getBoard_idx());
		
		String Board_data_idx = AdminBoardDataVo.getIdx();
		String Board_idx = AdminBoardDataVo.getBoard_idx();
		
		adminBoardDataService.setBoardData(AdminBoardDataVo, "delete");
		
		adminBoardDataService.setBoardReplyDataList(AdminBoardDataVo , "delete");
		
		SUtil.AlertAndPageMove(response, "???????????? ?????????????????????." , "/admin/board_data/list.do?Board_idx=" + Board_idx);
		
	}
	
	/*
	 * board_data_reply ??????
	 * */
	
	@RequestMapping(value="/admin/api/board_reply/list.do")
	public @ResponseBody ModelMap apiReplyList(@ModelAttribute("AdminBoardReplyVo")AdminBoardReplyVo AdminBoardReplyVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminBoardDataService.getReplyAllList(AdminBoardReplyVo);
		
		return model;
		
	}
	
	@RequestMapping(value="/admin/board_reply/insert.do" , method = RequestMethod.POST)
	public void BoardReplyInsert(@ModelAttribute("AdminBoardReplyVo")AdminBoardReplyVo AdminBoardReplyVo , HttpServletRequest request , HttpServletResponse response) {
		
		String member_id = SUtil.getUserId(request);
		AdminBoardReplyVo.setMember_id(member_id);
		
		adminBoardDataService.setBoardReplyData(AdminBoardReplyVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/board_reply/update.do" , method = RequestMethod.POST)
	public void BoardReplyUpdate(@ModelAttribute("AdminBoardReplyVo")AdminBoardReplyVo AdminBoardReplyVo , HttpServletRequest request , HttpServletResponse response) {
		
		String member_id = SUtil.getUserId(request);
		AdminBoardReplyVo.setMember_id(member_id);
		
		adminBoardDataService.setBoardReplyData(AdminBoardReplyVo , "update");
		
	}
	
	@RequestMapping(value="/admin/board_reply/delete.do" , method = RequestMethod.POST)
	public void BoardReplyDelete(@ModelAttribute("AdminBoardReplyVo")AdminBoardReplyVo AdminBoardReplyVo , HttpServletRequest request , HttpServletResponse response) {
		
		String member_id = SUtil.getUserId(request);
		AdminBoardReplyVo.setMember_id(member_id);
		
		adminBoardDataService.setBoardReplyData(AdminBoardReplyVo , "delete");
		
	}
}
