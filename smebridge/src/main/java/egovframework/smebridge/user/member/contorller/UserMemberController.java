package egovframework.smebridge.user.member.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.smebridge.admin.answer.model.AdminAnswerQuestionVo;
import egovframework.smebridge.user.answer.model.UserAnswerQuestionVo;
import egovframework.smebridge.user.answer.model.UserAnswerVo;
import egovframework.smebridge.user.answer.service.UserAnswerService;
import egovframework.smebridge.user.member.model.UserMemberVo;
import egovframework.smebridge.user.member.service.UserMemberService;

@Controller
public class UserMemberController {

	@Autowired
	UserMemberService userMemberService;
	
	@Autowired
	UserAnswerService userAnswerService;
	
	@RequestMapping(value="/user/api/member/idCheck.do")
	public @ResponseBody ModelMap UserMemberIdCehck(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		String Boolean = userMemberService.getIdCheck(UserMemberVo); 
		
		model.put("IdCheck", Boolean);
		
		return model;
		
	}
	
	@RequestMapping(value="/user/mypage/view.do" , method = RequestMethod.GET)
	public ModelAndView UserMemberView(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response ) {
		
		ModelMap model = new ModelMap();
		
		String UserId = SUtil.getUserId(request);
		
		UserMemberVo.setMember_id(UserId);
		
		model = userMemberService.getMemberData(UserMemberVo);
		
		return new ModelAndView("user/mypage/view" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/mypage/update.do" , method = RequestMethod.POST)
	public void UserMemberUpdate(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String UserId = SUtil.getUserId(request);
		
		UserMemberVo.setMember_id(UserId);
		
		userMemberService.setMemberData(UserMemberVo , "update");
		
		SUtil.AlertAndPageMove(response, "회원 정보가 변경되었습니다.", "/user/mypage/view.do");
		
	}
	
	@RequestMapping(value="/user/mypage/delete.do" , method = RequestMethod.POST)
	public void UserMemberDelete(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String UserId = SUtil.getUserId(request);
		
		UserMemberVo.setMember_id(UserId);
		
		userMemberService.setMemberData(UserMemberVo , "delete");
		
		SUtil.AlertAndPageMove(response, "회원 정보가 삭제되었습니다.", "/index.do");
		
	}
	
	@RequestMapping(value="/user/mypage/answer/list.do" , method = RequestMethod.GET)
	public ModelAndView UserMyPageAnswerList(@ModelAttribute("UserAnswerVo")UserAnswerVo UserAnswerVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		HttpSession session = request.getSession();
		
		String member_id = (String) session.getAttribute("UserId");
		
		UserAnswerVo.setMember_id(member_id);
		
		model = userAnswerService.getMyAnswerList(UserAnswerVo);
		
		return new ModelAndView("user/mypage/answer/list.do" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/mypage/answer/view.do" , method = RequestMethod.GET)
	public ModelAndView UserMyPageAnswerView(@ModelAttribute("UserAnswerVo")UserAnswerVo UserAnswerVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userAnswerService.getMyAnswerData(UserAnswerVo);
		
		return new ModelAndView("user/mypage/answer/view" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/mypage/answer/update.do" , method = RequestMethod.GET)
	public ModelAndView UserMyPageAnswerUpdateView(@ModelAttribute("UserAnswerVo")UserAnswerVo UserAnswerVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userAnswerService.getMyAnswerData(UserAnswerVo);
		
		return new ModelAndView("user/mypage/answer/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/mypage/answer/update.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public void UserMyPageAnswerUpdateData(@RequestBody List<UserAnswerQuestionVo> list , HttpServletRequest request , HttpServletResponse response ) {
		
		System.out.println("size : " + list.size());
		
		userAnswerService.setUserAnswerListUpdate(list);
		
	}
	
	
	
}
