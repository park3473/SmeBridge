package egovframework.smebridge.admin.banner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.smebridge.admin.banner.model.AdminBannerVo;
import egovframework.smebridge.admin.banner.service.AdminBannerService;

@Controller
public class AdminBannerController {
	
	@Autowired
	AdminBannerService adminBannerService;
	
	@RequestMapping(value="/admin/banner/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminBannerList(@ModelAttribute("AdminBannerVo")AdminBannerVo AdminBannerVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminBannerVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminBannerVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminBannerVo.setPAGE(Integer.parseInt(PAGE));
		AdminBannerVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminBannerVo.getPAGE() * AdminBannerVo.getITEM_COUNT();
		
		AdminBannerVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminBannerVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminBannerService.getAllList(AdminBannerVo);
		
		model.put("beforeDomain", AdminBannerVo);
		
		
		return new ModelAndView("admin/banner/list","model" , model);
	}
	
	@RequestMapping(value="/admin/banner/insert.do" , method = RequestMethod.GET)
	public String AdminBannerInsert(HttpServletRequest request , HttpServletResponse response) {
		
		return "admin/banner/insert";
		
	}
	
	@RequestMapping(value="/admin/banner/view.do" , method = RequestMethod.GET)
	public String AdminBannerUpdate(HttpServletRequest request , HttpServletResponse response) {
		
		return "admin/banner/view";
		
	}
	
	@RequestMapping(value="/admin/banner/insert.do" , method = RequestMethod.POST)
	public void AdminBannerInsertData(@ModelAttribute("AdminBannerVo")AdminBannerVo AdminBannerVo , MultipartHttpServletRequest request , HttpServletResponse response) {
		
		adminBannerService.setBannerData(AdminBannerVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/banner/update.do" , method = RequestMethod.POST)
	public void AdminBannerUpdateData(@ModelAttribute("AdminBannerVo")AdminBannerVo AdminBannerVo , MultipartHttpServletRequest request , HttpServletResponse response) {
		
		adminBannerService.setBannerData(AdminBannerVo , "insert");
		
	}
	

}
