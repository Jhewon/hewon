<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글 보기</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="container">
	<div>
	<h2><i class="fa fa-book"></i>일반 게시판 글보기</h2>
	<table class="table">
		
		<tr>
			<th>글번호</th>
			<td>${vo.no }</td>
			<th>제목</th>
			<td colspan="3">${vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.writer }</td>
			<th>작성일</th>
			<td>${vo.writeDate }</td>
			<th>조회수</th>
			<td>${vo.hit }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="6">
				<pre>${vo.content }</pre>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
				class="btn btn-dark">목록</a>
				<a href="updateForm.do?no=${vo.no}&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
				 class="btn btn-light">수정</a>
				<!--<button class="btn btn-secondary" id="deleteBtn" data-target="#myModal">삭제</button>-->
				<button type="button" id="deleteBtn" class="btn btn-secondary" data-toggle="modal" data-target="#deleteModal">
    			삭제
  				</button>
				
			</td>			
		</tr>
	</table>
	</div>
<!-- 댓글 시작 -->
<jsp:include page="reply.jsp"></jsp:include>
<!-- 댓글 끝 -->
</div><!-- 컨테이너 끝 -->


	<!-- The Modal -->
  	<div class="modal fade" id="deleteModal">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
	        	<!-- Modal Header -->
	       		<div class="modal-header">
	         		<h4 class="modal-title"><i class="material-icons">delete</i>삭제를 위한 비밀번호 입력</h4>
	          		<button type="button" class="close delCelBtn" data-dismiss="modal">&times;</button>
	        	</div>
	        
	        	<!-- Modal body -->
	        	<div class="modal-body">
	        		<form action="delete.do" method="post" id="deleteForm" class="form-inline">
	        		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
	        			<input id="no" name="no" type="hidden" value="${param.no }">
						<input id="pw" name="pw" type="password" placeholder="비밀번호 입력" style="padding: 5px">
						<button class="btn btn-secondary">삭제</button>
					</form>
	        	</div>
	        	
	        	<!-- Modal footer -->
	        	<div class="modal-footer">	        		
	          		<button type="button" class="btn btn-dark delCelBtn" data-dismiss="modal">Close</button>
	        	</div>
      		</div>
    	</div>
  	</div>
</body>
</html>