<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글등록</title>
</head>
<body>
<div class="container">
	<h2>일반 게시판 글등록</h2>
	<form action="write.do" method="post">
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" name="title" id="title" required>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content"
				rows="7" required></textarea>
		</div>
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" name="writer" id="writer" required>
		</div>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<input class="form-control" name="pw" id="pw" required
			 type="password">
		</div>
		<div class="form-group">
			<label for="pw">비밀번호 확인</label>
			<input class="form-control" id="pw2" required
			 type="password">
		</div>
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="reset" class="btn btn-warning">새로입력</button>
		<button type="button" class="cancelBtn btn btn-success">취소</button>
	</form>
</div>
</body>
</html>