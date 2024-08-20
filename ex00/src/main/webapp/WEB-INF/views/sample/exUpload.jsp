<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<h1>파일 업로드</h1>
<form action="exUploadPost" method="post" enctype="multipart/form-data">
	첨부 파일1 : <input type="file" name="files"><br>
	첨부 파일2 : <input type="file" name="files"><br>
	첨부 파일3 : <input type="file" name="files"><br>
	첨부 파일4 : <input type="file" name="files"><br>
	첨부 파일5 : <input type="file" name="files"><br>
	<button>전송</button>
</form>
</body>
</html>