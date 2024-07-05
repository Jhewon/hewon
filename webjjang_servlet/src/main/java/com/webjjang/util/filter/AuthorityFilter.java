package com.webjjang.util.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webjjang.member.vo.LoginVO;

/**
 * Servlet Filter implementation class AuthorityFilter
 */
//@WebFilter("/AuthorityFilter")
public class AuthorityFilter extends HttpFilter implements Filter {     
	
	private static final long serialVersionUID = 1L;
	
	//URI 에 따른 권한 저장 Map
	private static Map<String, Integer> authMap = new HashMap<>();
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		System.out.println("권한 처리 필터 동작");
		
		//request HttpServletRequest타입으로 변환
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		// 권한 처리를 위해서 로그인 정보가 session 에 있다.
		HttpSession session = req.getSession();
		
		//권한 처리
		String uri = req.getRequestURI();
		System.out.println("Authority.doFilter().uri = " + uri);

		// 페이지의 권한을  int 로 가져온다. - uri 에 따른 데이터가 없으면 null 나온다.
		Integer pageGrade = authMap.get(uri);
		LoginVO loginVO = null;
		// 로그인이 필요한 권한 처리
			if(pageGrade != null) {
				loginVO = (LoginVO) session.getAttribute("login");
				// 로그인을 하지 않은 경우 처리 - 로그인 페이지로 이동 시킨다.
				if(loginVO == null) {
					// 권한 메세지 모달 창 표시
					session.setAttribute("msg", "로그인이 필요한 페이지 입니다. 로그인 해주세요~!");
					// 로그인 페이지 이동
					res.sendRedirect("/member/loginForm.do");
					return;
				}// 로그인 처리 확인의 끝
					// 권한 처리 시작 
				Integer userGradeNo =  loginVO.getGradeNo();
				// 로그인 처리가 된경우 관리자 권한 체크 처리
				if(pageGrade > 1) {
					if(pageGrade > userGradeNo) {
						req.getRequestDispatcher("/WEB-INF/views/error/authority.jsp").forward(req, res);
						return;
					}
				}
				// 권한 처리 끝 
			}
			
		
		// pass the request along the filter chain - 실제 적으로 실행되는 곳으로 이동
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		// 서버가 시작될때 딱 한번 실행되는 매소드 
		
		authMap.put("/image/writeForm.do", 1);
		authMap.put("/image/write.do", 1);
		authMap.put("/image/updateForm.do", 1);
		authMap.put("/image/update.do", 1);
		authMap.put("/image/delete.do", 1);
		authMap.put("/member/list.do", 9);
		
		
		System.out.println("AuthorityFilter.Init()");
		// 권한 세팅 - URI 따른 
	}

}
