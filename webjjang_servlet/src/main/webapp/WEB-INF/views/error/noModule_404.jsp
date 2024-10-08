<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
    // DispatcherServlet 을 걸치지 않고 들어온 경우
    // uri 가 
	if(session.getAttribute("uri") == null){
		session.setAttribute("uri",request.getRequestURI());
	}

%>
    <!-- sitemesh 미적용 페이지 - 웹 브라우저 라이브러리 없음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>module_404 Error</title>

 <!-- Bootstrap 4 + jquery 라이브러리 등록 - CDN 방식 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- icon 라이브러리 등록 - Font Awesome 4 / google -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style type="text/css">
#errorDiv>.row{
	padding: 10px;
	border-bottom: 1px dotted #aaa;  
}
#errorDiv{
	padding: 30px;
}
</style>
</head>
<body>
<div class="container">
		  <div class="card-header"><h3>요청 자원 오류(404)</h3></div>
	<div class="card">
		  <div class="card-body" id="errorDiv">
		  <div class="text-center">
		  	<i class="material-icons" style="font-size:85px;color:red">error</i>
		  </div>
			<div class="row">
			  <div class="col-md-3">요청 URI</div>
			  <div class="col-md-9">${uri }</div>
			</div>
			<div class="row">
			  <div class="col-md-3">오류 매세지</div>
			  <div class="col-md-9">요청 하신 페이지의 주소는 존재하지 않거나 지원 하지 않습니다.
			  </div>
			</div>
			<div class="row">
			  <div class="col-md-3">조치 사항</div>
			  <div class="col-md-9">
			  <p> 다시 확인 하시고 접속해 주세요..</p>
			  </div>
			</div>
		  </div>
		  <div class="card-footer">
			<a href="/board/list.do" class="btn btn-danger">돌아가기</a>
		  </div>
	</div>
</div>
</body>
</html>