<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
<style type="text/css">
.dataRow>.card-header{
	background: #e0e0e0
}
.dataRow:hover{
	border-color: orange;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function(){
	
	// 이벤트 처리
	// 글보기 이동 처리
	$(".dataRow").click(function(){
		let no = $(this).data("no");
		// alert(no);
		location = "view.do?no=" + no + "&inc=1";
	});
});
</script>

</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header"><h2>공지사항 리스트</h2></div>
	  <div class="card-body">
	  	<c:forEach items="${list }" var="vo">
			<div class="card dataRow" data-no="${vo.no }">
			  <div class="card-header">
			  	<span class="float-right">종료일 :
			  		<span class="float-right">
				  		<fmt:formatDate value="${vo.endDate }"
				  		 pattern="yyyy-MM-dd"/>
			  		</span>
			  	</span>
			  	<span> 시작일 : 
				  	<fmt:formatDate value="${vo.startDate }"
				  	pattern="yyyy-MM-dd"/>
			  	</span>
			  </div>
			  <div class="card-body">
			  	<pre>${vo.title }</pre>
			  </div>
			  <div class="card-footer">
			  </div>
			</div>
	  	</c:forEach>
	  </div>
	  <div class="card-footer">
	  	<div>
	  		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
	  	</div>
		<a href="writeForm.do" class="btn btn-primary">글등록</a>
	  </div>
	</div>
</div>
</body>
</html>