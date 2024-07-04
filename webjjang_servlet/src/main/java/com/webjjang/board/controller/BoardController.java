package com.webjjang.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webjjang.board.service.BoardDeleteService;
import com.webjjang.board.service.BoardListService;
import com.webjjang.board.service.BoardUpdateService;
import com.webjjang.board.service.BoardViewService;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.controller.Init;
import com.webjjang.util.exe.Execute;
import com.webjjang.util.io.BoardPrint;
import com.webjjang.util.io.In;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;

// Board Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class BoardController {

	
	public String execute(HttpServletRequest request) {
		System.out.println("BoardController.execute()");
		
		// 메뉴 입력
		String uri = request.getRequestURI();
		
		HttpSession session = request.getSession();
		//Object result = null;
		
		String jsp = null;
		
		Object result = null;
		// 입력 받는 데이터 선언
		Long no = 0L;
		
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/board/list.do":
				// [BoardController] - (Execute) - BoardListService - BoardDAO.list()
				System.out.println("1.일반게시판 리스트");
				//페이지 처리를 위한 객체
				//getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
				PageObject pageObject = PageObject.getInstance(request);				
				// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>				
				// 가져온 데이터 request 저장 -> jsp 까지 전달된다.
				// pageObject 데이터 확인
				System.out.println("Boardcontroller.execute().pageObject = " + pageObject);
				request.setAttribute("list", Execute.execute(Init.get(uri), pageObject));	
				// pageObject 담기
				request.setAttribute("pageObject", pageObject);				
				// /WEB-INF/views/  + board/list + .jsp
				jsp = "board/list";
				
				break;
				
			case "/board/view.do":
				System.out.println("2.일반게시판 글보기");
				// 1. 조회수 1증가(글보기), 2. 일반게시판 글보기 데이터 가져오기 : 글보기, 글수정
				// 넘어오는 글 번호 와 조회수 1증가를 수집한다.(request에 들어 있다.)
				String strNo = request.getParameter("no");
				no = Long.parseLong(strNo);
				String strInc = request.getParameter("inc");
				Long inc = Long.parseLong(strInc);
				// 전달 데이터 - 글번호, 조회수 증가 여부(1:증가, 0:증가 안함) : 배열 또는 Map				
				// 가져온 데이터를 보내기 위해서 request 에 담는다.
				result = Execute.execute(Init.get(uri), new Long[]{no, inc});
				request.setAttribute("vo", result);
				
				// 댓글 페이지 객체
				// 데이터 전달 - page/ perPageNum / no / replyPage / replyperPageNum
				ReplyPageObject replyPageObject = ReplyPageObject.getInstance(request);
				// 가져온 댓글 데이터 request 에 담기
				request.setAttribute("replyList", Execute.execute(Init.get("/boardreply/list.do"),replyPageObject));
				// 댓글 페이지 객체 담기
				request.setAttribute("replyPageObject", replyPageObject);
				jsp = "board/view";
				break;
				
			case "/board/writeForm.do":
				System.out.println("3.일반게시판 글등록 폼");
				
				jsp = "board/writeForm";			
				
				break;
			case "/board/write.do":
				System.out.println("3.일반게시판 글등록");
				
				// 데이터 수집
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String writer = request.getParameter("writer");
				String pw = request.getParameter("pw");
				
				//변수 - vo 저장하고 service
				BoardVO vo =new BoardVO();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				
				Execute.execute(Init.get(uri),vo);
				// jsp 정보 앞에 "redirect:"가 붙어있으면 redirect 를 아니면 jsp 로 forward 로 시킨다.
				jsp = "redirect:list.do?perPageNum=" + request.getParameter("perPageNum");
				session.setAttribute("msg", "글 등록이 되었습니다.");
				break;
				
			case "/board/updateForm.do":
				System.out.println("4-1.일반게시판 글수정");
				// 사용자 -> 서버 : 글 번호
				no = Long.parseLong(request.getParameter("no"));
				
				// no 맞는 데이터 DB에거 가져온다. BoardviewService
				result = Execute.execute(Init.get("/board/view.do"),new Long[]{no,0L});
				request.setAttribute("vo", result);
				
				jsp = "board/updateForm";
				
				break;
				
			case "/board/update.do":
				System.out.println("4-2.일반게시판 글수정");
				// 데이터 수집
				no = Long.parseLong(request.getParameter("no"));
				 title = request.getParameter("title");
				 content = request.getParameter("content");
				 writer = request.getParameter("writer");
				 pw = request.getParameter("pw");
				
				//변수 - vo 저장하고 service
				vo =new BoardVO();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				// DB 적용하는 처리문 작성. BoardUpdateservice
				Execute.execute(Init.get(uri), vo);
				// 페이지 정보 받기 & uri 에 붙이기
				 pageObject = PageObject.getInstance(request);
				// 글보기로 자동 이동 -> jsp 정보를 작성해서 넘긴다.
				jsp = "redirect:view.do?no=" + no + "&inc=0" +"&"+ pageObject.getPageQuery();
				
				session.setAttribute("msg", "글 수정이 완료 되었습니다.");
				break;
			case "/board/delete.do":
				System.out.println("5.일반게시판 글삭제");
				// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, 비밀번호 - BoardVO
				
				no = Long.parseLong(request.getParameter("no"));
				pw = request.getParameter("pw");
				
				BoardVO deleteVO = new BoardVO();
				deleteVO.setNo(no);
				deleteVO.setPw(pw);
				
				// DB 처리
				Execute.execute(Init.get(uri), deleteVO);
				System.out.println();
				System.out.println("***************************");
				System.out.println("**  " + deleteVO.getNo()+ "글이 삭제되었습니다.  **");
				System.out.println("***************************");
				
				jsp = "redirect:list.do?perPageNum="+ request.getParameter("perPageNum");
				
				session.setAttribute("msg", "글 삭제 되었습니다.");
				break;
			case "0":
				
				return jsp;

			default:
				System.out.println("####################################");;
				System.out.println("## 잘못된 메뉴를 선택하셨습니다.          ##");;
				System.out.println("## [0~5, 0] 중에서 입력하셔야 합니다.    ##");;
				System.out.println("####################################");;
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			System.out.println();
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
			System.out.println("$%@ << 오류 출력 >>                         $%@");
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
			System.out.println("$%@ 타입 : " + e.getClass().getSimpleName());
			System.out.println("$%@ 내용 : " + e.getMessage());
			System.out.println("$%@ 조치 : 데이터를 확인 후 다시 실행해 보세요.");
			System.out.println("$%@     : 계속 오류가 나면 전산담당자에게 연락하세요.");
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
		} // end of try~catch		
		return jsp;
	} // end of execute()
	
} // end of class
