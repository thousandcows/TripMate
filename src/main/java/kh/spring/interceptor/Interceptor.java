package kh.spring.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.ReactionsDTO;
import kh.spring.service.MemberService;

public class Interceptor implements HandlerInterceptor{
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberService memberService;
	
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
		
		if(session.getAttribute("loginNick") != null) {
			String nick = (String) session.getAttribute("loginNick");
			System.out.println("인터셉터 닉네임 : " + nick);
			List<ReactionsDTO> reactions = memberService.selectReactions(nick);
			if(reactions.size() != 0 && modelAndView != null) {
				modelAndView.getModel().put("reactions", reactions);
			}
		}
		// 1번시도
//		if(modelAndView != null) {
//			modelAndView.getModel().put("testPost", dto); // null에 점찍으면 에러남
//		}
		// 2번시도
//		modelAndView.getModelMap().addAttribute("testPost", dto);
		// 3번시도
//		modelAndView.addObject("testPost", dto);
//		modelAndView.setViewName(modelAndView.getViewName());
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}
