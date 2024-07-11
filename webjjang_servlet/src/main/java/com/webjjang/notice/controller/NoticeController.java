package com.webjjang.notice.controller;


import javax.servlet.http.HttpServletRequest;

import com.webjjang.main.controller.Init;
import com.webjjang.notice.service.NoticeDeleteService;
import com.webjjang.notice.vo.NoticeVO;
import com.webjjang.util.exe.Execute;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.io.In;

// Notice Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class NoticeController {

	public String execute(HttpServletRequest request) {
		// 게시판 기능 무한 반복
			String jsp = null;
			
			String uri = request.getRequestURI();
			// 메뉴 입력
			
			Object result = null;
			
			// 입력 받는 데이터 선언
			Long no = 0L;
			
			try { // 정상 처리
			
				// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
				switch (uri) {
				case "/notice/list.do":
					// [NoticeController] - (Execute) - NoticeListService - NoticeDAO.list()
					System.out.println("1.공지사항 리스트");
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<NoticeVO>
					PageObject pageObject = PageObject.getInstance(request);
					result = Execute.execute(Init.get(uri), pageObject);
					// 가져온 데이터 출력하기
					request.setAttribute("list", result);
					request.setAttribute("pageObject", pageObject);
					
					jsp = "notice/list";
					break;
					
				case "/notice/view.do":
					System.out.println("2.공지사항 글보기");
					// 1. 조회수 1증가(글보기), 2. 공지사항 글보기 데이터 가져오기 : 글보기, 글수정
					// 사용자가 보고 싶은 글번호를 입력한다.
					no = Long.parseLong(request.getParameter("no"));
					// 전달 데이터 - 글번호, 조회수 증가 여부(1:증가, 0:증가 안함) : 배열 또는 Map
					result = Execute.execute(Init.get(uri), no);
					// 게시판 글보기 출력 : NoticePrint
					request.setAttribute("vo", result);
					
					jsp = "notice/view";
					break;
					
				case "/notice/writeForm.do":
					System.out.println("3-1. 공지사항 등록 폼");
					jsp="notice/writeForm";
					break;
				case "/notice/write.do":
					System.out.println("4.공지사항 글수정");
					
					// 데이터 수집(사용자->서버 : form - input - name)
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String startDate = request.getParameter("startDate");
					String endDate = request.getParameter("endDate");
					// 변수 - vo 저장하고 Service
					NoticeVO vo = new NoticeVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					// [BoardController] - BoardWriteService - BoardDAO.write(vo)
					Execute.execute(Init.get(uri), vo);
					
					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
					// 아니면 jsp로 forward로 시킨다.
					jsp = "redirect:list.do?perPageNum=" 
							+ request.getParameter("perPageNum");
					
					break;
					
				case "/notice/updateForm.do":
					System.out.println("3-1. 공지사항 등록 폼");
					no = Long.parseLong(request.getParameter("no"));
					result = Execute.execute(Init.get("/notice/view.do"), no);
					request.setAttribute("vo", result);
					jsp="notice/updateForm";
					break;
					
				case "/notice/update.do":
					System.out.println("4.공지사항 글수정");
					
					// 데이터 수집(사용자->서버 : form - input - name)
					no = Long.parseLong(request.getParameter("no"));
					 title = request.getParameter("title");
					 content = request.getParameter("content");
					 startDate = request.getParameter("startDate");
					 endDate = request.getParameter("endDate");
					// 변수 - vo 저장하고 Service
					 vo = new NoticeVO();
					 vo.setNo(no);
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					// [BoardController] - BoardWriteService - BoardDAO.write(vo)
					Execute.execute(Init.get(uri), vo);
					pageObject = PageObject.getInstance(request);
					// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
					// 아니면 jsp로 forward로 시킨다.
					jsp = "redirect:view.do?no=" + no + "&inc=0"
							+ "&" + pageObject.getPageQuery();
					
					break;
					
				case "/notice/delete.do":
					System.out.println("3-1. 공지사항 등록 폼");
					no = Long.parseLong(request.getParameter("no"));
					Execute.execute(Init.get(uri), no);
					jsp="redirect:list.do";
					break;
					
				default:
					System.out.println("####################################");;
					System.out.println("## 잘못된 메뉴를 선택하셨습니다.          ##");;
					System.out.println("## [0~5, 0] 중에서 입력하셔야 합니다.    ##");;
					System.out.println("####################################");;
					break;
				} // end of switch
			} catch (Exception e) {
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
	} // end of main()
	
} // end of class
