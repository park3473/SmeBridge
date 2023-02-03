package egovframework.smebridge.user.Interceptor;

import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.system.util.SUtil;

import egovframework.smebridge.manager.accept_log.service.UserAcceptLogService;

public class UserLoginInterceptor extends HandlerInterceptorAdapter {

	
	@Value("#{DB['currentPrjName']}")
	public String currentPrjName;

	protected Log log = LogFactory.getLog(UserLoginInterceptor.class);


	@Autowired
	SessionLocaleResolver localeResolver;
	
	@Autowired
	UserAcceptLogService AcceptLogService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		String Login = session.getAttribute("Login") + "";
		if(Login.equals("OkOk"))
		{
			return true;
		}else 
		{
			
			SUtil.AlertAndPageMove(response, "해당 서비스는 로그인 이후 가능합니다.", "/view/login.do");
			
			return false;
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================           END          ======================================\n");
			
		}
	}
	
	

}
