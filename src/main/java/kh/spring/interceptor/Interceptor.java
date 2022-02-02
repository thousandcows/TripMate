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

public class Interceptor implements HandlerInterceptor {

	@Autowired
	private HttpSession session;

	@Autowired
	private MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 로그인 체크
		String loginID = (String) session.getAttribute("loginEmailID");
		System.out.println("요청 URI : " + request.getRequestURI());
		if(loginID == null) {
			System.out.println("널");
			response.sendRedirect("/");
			return false;
		}

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		System.out.println(request.getRequestURI()); 들어오는 URL
		if (session.getAttribute("loginNick") != null) {
			int loginSeq = (int) session.getAttribute("loginSeq");
			List<ReactionsDTO> reactions = memberService.selectReactions(loginSeq);
			if (reactions.size() != 0 && modelAndView != null) {
				modelAndView.getModel().put("reactions", reactions);
			}
		}
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

}
