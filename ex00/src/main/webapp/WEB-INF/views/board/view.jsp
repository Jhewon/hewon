<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>

<style type="text/css">
</style>

<!-- 1. 필요한 전역 변수 : 직접 코딩 -->
<script type="text/javascript">
	// 보고 있는 일반 게시판의 글번호를 전역 변수로 지정해 보자.
	let id = "test"; // 강제 로그인 - 내가 작성한 댓글에 대해서만 수정과 삭제가 가능하도록 만들기 위해서 
	let no = ${vo.no};
	let replyPage = 1;
	console.log("전역 변수 no : " + no);
</script>

<!-- 2. util.jsp 포함 -->
<script type="text/javascript" src="/js/util.js"></script>

<!-- 2. 날짜 처리 함수 선언 -->
<script type="text/javascript" src="/js/dateTime.js"></script>

<!-- 3. 댓글 객체(replyService)를 선언 : Ajax 처리 포함 -->
<script type="text/javascript" src="/js/reply.js"></script>

<!-- 4. reply 호출 처리 함수 선언 + 이벤트 처리 -->
<script type="text/javascript" src="/js/replyProcess.js"></script>

<script type="text/javascript">
$(function(){
	
	// 이벤트 처리
	// 글수정 버튼
	$("#updateBtn").click(function(){
		location = "updateForm.do?no=${vo.no}";
	});
	
	// 글삭제 버튼
	$("#deleteBtn").click(function(){
		$("#pw").val("");
	});
	
	// 리스트 버튼
	$("#listBtn").click(function(){
		location = "list.do?page=${param.page}&perPageNum=${param.perPageNum}"
				+ "&key=${param.key}&word=${param.word}";
	});
	
});
</script>

</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header"><h2>일반 게시판 글보기</h2></div>
	  <div class="card-body">
			<div class="card" data-no="${vo.no }">
			  <div class="card-header">
			  	<span class="float-right">조회수 : ${vo.hit }</span>
			  	${vo.no }. ${vo.title }
			  </div>
			  <div class="card-body">
			  	<pre>${vo.content }</pre>
			  </div>
			  <div class="card-footer">
			  	<span class="float-right">
			  		<fmt:formatDate value="${vo.writeDate }"
			  		 pattern="yyyy-MM-dd"/>
			  	</span>
			  	${vo.writer }
			  </div>
			</div>
	  </div>
	  <div class="card-footer">
	  	<button class="btn btn-primary" id="updateBtn">수정</button>
		<!-- 모달창은 열어서 비밀번호를 입력 받고 삭제하여 가는 처리 -->
	  	<button class="btn btn-danger" id="deleteBtn"
	  	  data-toggle="modal" data-target="#deleteModal">삭제</button>
	  	<button class="btn btn-warning" id="listBtn" >리스트</button>
	  </div>
	</div>
	<!-- 글보기 card 끝 -->
	<div>
		<jsp:include page="boardreply.jsp" />
	</div>
	
</div>

  <!-- The Modal -->
  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 입력 모달 창</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <form action="delete.do" method="post">
        	<input type="hidden" name="no" value="${vo.no }">
	        <!-- Modal body -->
	        <div class="modal-body">
	        	<div class="form-group">
	          		<input class="form-control" name="pw" type="password" 
	          		 id="pw">
	          	</div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button class="btn btn-danger" >삭제</button>
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        </div>
        
        </form>
        
      </div>
    </div>
  </div>


</body>
</html>