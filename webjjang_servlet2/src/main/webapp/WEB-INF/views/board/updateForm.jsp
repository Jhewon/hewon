<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글 수정</title>
<script type="text/javascript" src="/js/BoardInputUtil.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	$(function() {
		console.log("jqurey loading");
		
		$("#writeForm").submit(function() {
			//alert("submit");
			// 데이터 유효성 검사
			// 필수 항목 체크
			if(isEmpty("#title","제목",true)) return false;
			if(isEmpty("#content","내용",true)) return false;
			if(isEmpty("#writer","작성자",true)) return false;
			if(isEmpty("#pw","비밀번호",false)) return false;
			// 길이 체크
			if(lengthCheck("#title","제목",3,100,true)) return false;
			if(lengthCheck("#content","내용",3,1000,true)) return false;
			if(lengthCheck("#writer","작성자",2,10,true)) return false;
			if(lengthCheck("#pw","비밀번호",4,20,false)) return false;
			
			//비밀번호와 비밀번호 확인	
			let pw=$("#pw").val();
			if(pw != ${vo.pw }) {
				alert("비밀번호와 비밀번호 확인 같지 않습니다. 다시 입력해주세요."); // 경고
				// 비밀번호 비밀번호 확인의 데이터를 지운다.
				$("#pw).val("");
				$("#pw").focus(); // 커서 위치
				return false; // 페이지 이동을 막는다.
			}
			
		});
	});
</script>
<style type="text/css">
h1{
	text-align: center;
	margin-top: 10px;
}
</style>
</head>
<body>
<div class="container">
<form action="/board/update.do" method="post" id="writeForm">
<input type="hidden" name="page" value="${param.page }">
<input type="hidden" name="perPageNum" value="${param.perPageNum }">
<input type="hidden" name="key" value="${param.key }">
<input type="hidden" name="word" value="${param.word }">
	<div>
	<h1><i class="fa fa-eraser"></i>일반 게시판 글 수정</h1>
		<div class="form-group">
			<label for="no">글번호</label>
				<input type="text" class="form-control" readonly id="no" name="no" value="${vo.no }">
		</div>
		<div class="form-group">
			<label for="title">제목</label>
				<input type="text" class="form-control" placeholder="제목 입력" value="${vo.title }" id="title" name="title">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
				<textarea class="form-control" rows="8" cols="125" id="content" placeholder="내용 입력" name="content">${vo.content }</textarea>
		</div>
		<div class="form-group">
			<label for="writer">작성자</label> 
				<input type="text" class="form-control" placeholder="작성자 입력" value="${vo.writer }" id="writer" name="writer">
		</div>
		<div class="form-group">
			<label for="pw">비밀번호</label>
				<input type="password" class="form-control" placeholder="비밀번호 입력" id="pw" name="pw">
		</div>
		
		<button type="submit" class="btn btn-dark">수정</button>
		<button type="reset" class="btn btn-light">리셋</button>
		<button type="button" class="btn btn-secondary cancelBtn">취소</button>	
		</div>	
</form>
</div>
</body>
</html>