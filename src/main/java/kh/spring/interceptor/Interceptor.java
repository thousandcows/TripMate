package kh.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.SavedDTO;

public class Interceptor implements HandlerInterceptor{
	
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 로그인 체크
//		String loginID = (String) session.getAttribute("loginEmailID");
//		if(loginID == null) {
//			response.sendRedirect("/");
//			return false;
//		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("add 이전 : " + modelAndView);
		
		// 테스트 객체
		SavedDTO dto = new SavedDTO(1, 2, 3);
		
		// 1번시도
		modelAndView.getModel().put("testPost", dto);
		// 2번시도
//		modelAndView.getModelMap().addAttribute("testPost", dto);
		// 3번시도
//		modelAndView.addObject("testPost", dto);
//		modelAndView.setViewName(modelAndView.getViewName());
		
		System.out.println("add 이후 : " + modelAndView);
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}
