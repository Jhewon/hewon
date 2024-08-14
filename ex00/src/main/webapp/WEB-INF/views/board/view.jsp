<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 상세보기</title>
<jsp:include page="../jsp/weblib.jsp"></jsp:include>
<script type="text/javascript">
$(function(){

	// 글삭제 버튼
	$(".deleteBtn").click(function(){
		$("#pw").val("");
	});
	
});
	

</script>
</head>
<body>
<div class="container">
	<h1>일반게시판 상세보기</h1>
	
	<div class="card">
	  	<div class="card-header">
			글번호 : ${vo.no } &nbsp;&nbsp;&nbsp; 제목 : ${vo.title }  <span class="float-right">조회수 : ${vo.hit }</span>
		</div>
	  	<div class="card-body">
			내용 : ${vo.content } 
		</div>
	  	<div class="card-footer">
	     작성자 : ${vo.writer }	<span class="float-right">작성일 : <fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></span>
			
		</div>
	</div>
	<a href="updateForm.do?no=${vo.no }" class="btn btn-dark">글 수정</a>
	<a href="list.do" class="btn btn-dark">글 목록</a>
	<a href="list.do" class="btn btn-dark">취소</a>
	<button class="btn btn-dark float-right deleteBtn" data-toggle="modal" data-target="#deleteModal" >삭제</button>		
</div>

<!-- The Modal -->
  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form action="delete.do" method="post">
        <input name="no" value="${vo.no }" type="hidden">
        <!-- Modal body -->
        <div class="modal-body">
        <div class="form-group">
	         <input type="password" name="pw" id="pw" class="form-control">
        </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
        <button class="btn btn-dark ">삭제</button>
          <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div>


</body>
</html>