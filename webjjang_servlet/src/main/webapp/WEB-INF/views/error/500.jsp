<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 Error</title>
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
	<div class="card">
	  <div class="card-header"><h3>처리 프로세스 오류(500)</h3></div>
	  <div class="card-body" id="errorDiv">
	  <div class="text-center">
	  <i class="material-icons" style="font-size:85px;color:red">error</i>
	  </div>
		<div class="row">
		  <div class="col-md-3">오류 객체</div>
		  <div class="col-md-9">${e.getClass().simpleName }</div>
		</div>
		<div class="row">
		  <div class="col-md-3">오류 매세지</div>
		  <div class="col-md-9">${e.message }</div>
		</div>
		<div class="row">
		  <div class="col-md-3">조치 사항</div>
		  <div class="col-md-9">오류가 발생하여 다시 시작 해주세요.<br>
		  <p> 오류가 계속 발생하면 문의해 주세요.</p>
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