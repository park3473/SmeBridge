package egovframework.smebridge.admin.professor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.smebridge.admin.professor.model.AdminProfessorResearchVo;
import egovframework.smebridge.admin.professor.model.AdminProfessorVo;
import egovframework.smebridge.admin.professor.service.AdminProfessorService;

@Controller
public class AdminProfessorController {

	@Autowired
	AdminProfessorService adminProfessrorService;
	
	@RequestMapping(value="/admin/professor/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminProfessorAllList(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminProfessorVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminProfessorVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminProfessorVo.setPAGE(Integer.parseInt(PAGE));
		AdminProfessorVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminProfessorVo.getPAGE() * AdminProfessorVo.getITEM_COUNT();
		
		AdminProfessorVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminProfessorVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminProfessrorService.getProfessorAllList(AdminProfessorVo);
		
		return new ModelAndView("admin/professor/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/professor/insert.do" , method = RequestMethod.GET)
	public String AdminProfessorInsertView(HttpServletRequest request , HttpServletResponse response) {
		
		return "admin/professor/insert";
		
	}
	
	@RequestMapping(value="/admin/professor/insert.do" , method = RequestMethod.POST )
	public void AdminProfessorInsertData(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , MultipartHttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String drv = request.getRealPath("");
		drv = drv.substring(0 , drv.length()) + "./resources/" + ((HttpServletRequest) request).getContextPath() + "/upload/file/";
		
		String filename = SUtil.setFileUpload(request, drv);
		
		AdminProfessorVo.setImage(filename);
		
		adminProfessrorService.setAdminProfessorData(AdminProfessorVo , "insert");
		
		SUtil.AlertAndPageMove(response, "교수 정보가 저장되었습니다.", "/admin/professor/list.do");
		
	}
	
	@RequestMapping(value="/admin/professor/view.do" , method = RequestMethod.GET)
	public ModelAndView AdminProfessorView(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminProfessrorService.getProfessorView(AdminProfessorVo);
		
		AdminProfessorResearchVo researchVo = new AdminProfessorResearchVo();
		
		researchVo.setPro_idx(AdminProfessorVo.getIdx());
		
		List<?> list = adminProfessrorService.getProfessorResearchList(researchVo);
		
		return new ModelAndView("admin/professor/view" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/professor/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminProfessorUpdateView(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminProfessrorService.getProfessorView(AdminProfessorVo);
		
		return new ModelAndView("admin/professor/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/professor/update.do" , method = RequestMethod.POST)
	public void AdminProfessorUpdateData(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminProfessrorService.setAdminProfessorData(AdminProfessorVo, "update");
	
		SUtil.AlertAndPageMove(response, "교수 정보가 수정되었습니다.", "/admin/professor/list.do");
		
	}
	
	@RequestMapping(value="/admin/professor/delete.do" , method = RequestMethod.POST)
	public void AdminProfessorDeleteData(@ModelAttribute("AdminProfessorVo")AdminProfessorVo AdminProfessorVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminProfessrorService.setAdminProfessorData(AdminProfessorVo, "delete");
		
		SUtil.AlertAndPageMove(response, "교수 정보가 삭제되었습니다.", "/admin/professor/list.do");
		
	}
	
	@RequestMapping(value="/admin/professor/research/insert.do" , method = RequestMethod.POST)
	public void AdminProfessorResearchDataInsert(@ModelAttribute("AdminProfessorResearchVo")AdminProfessorResearchVo AdminProfessorResearchVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminProfessrorService.setAdminProfessorResearchData(AdminProfessorResearchVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/professor/research/update.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public void AdminProfessorResearchUpdate(@RequestBody List<AdminProfessorResearchVo> list , HttpServletRequest request , HttpServletResponse response) {
		
		//교수진 연구분야 리스트 업데이트
		System.out.println("size : " + list.size());
		
		for(int i = 0; i < list.size(); i ++) {
			
			System.out.println("index : " + i);
			System.out.println("pro_idx : " + list.get(i).getPro_idx());
			System.out.println("idx : " + list.get(i).getIdx());
			System.out.println("seq : " + list.get(i).getSeq());
			System.out.println("content : " + list.get(i).getContent() );
				
		}
		
		adminProfessrorService.setAdminProfessorDataList(list);
		
	}
	
	@RequestMapping(value="/admin/professor/research/delete.do" , method = RequestMethod.POST)
	public void AdminProfessorResearchDataDelete(@ModelAttribute("AdminProfessorResearchVo")AdminProfessorResearchVo AdminProfessorResearchVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminProfessrorService.setAdminProfessorResearchData(AdminProfessorResearchVo, "delete");
		
	}
	
	
}
