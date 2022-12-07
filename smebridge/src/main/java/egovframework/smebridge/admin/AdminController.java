package egovframework.smebridge.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value="/admin/index.do")
	public String AdminIndexView(HttpServletRequest request , HttpServletResponse response) {
		return "admin/index";
	}
	
}
