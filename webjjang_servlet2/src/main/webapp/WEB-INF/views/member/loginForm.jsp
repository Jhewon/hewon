<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인</title>
<style type="text/css">
h3{
 text-align: center;
 margin-top: 10px;
}
</style>
</head>
<body>
<div class="container">
	<form action="login.do" method="post">
	<h3>로그인</h3>
	  <div class="form-group">
	    <label for="id">ID :</label>
	    <input type="text" class="form-control" placeholder="Enter id" id="id" name="id" autocomplete="none">
	  </div>
	  <div class="form-group">
	    <label for="pw">Password :</label>
	    <input type="password" class="form-control" placeholder="Enter password" id="pw" name="pw" autocomplete="none">
	  </div>
	  
	  <button type="submit" class="btn btn-primary">Login</button>
</form>
	
	
</div>
</body>
</html>