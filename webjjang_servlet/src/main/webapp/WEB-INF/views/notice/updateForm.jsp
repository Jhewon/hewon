<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script type="text/javascript" src="/js/BoardInputUtil.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() { // == $(document).ready(function(){~});		
		//1. click 이벤트 - writeBtn
		//$("#writeBtn").click(function() {	
		//1. submit 이벤트 - writeForm
		$("#writeForm").submit(function() {			
			//필수 항목
			// 제목 체크 - 제목란의 값을 가져와서 좌우 공백을 제거한다.
			let title = $("#title").val().trim();
			// 공백을 제거한 데이터를 제목 입력란에 다시 넣는다.
			$("#title").val(title);			
			if(title=="") {
				alert("제목은 필수 입력 항목입니다."); // 경고
				$("#title").focus(); // 커서 위치
				return false; // 페이지 이동을 막는다.
			} // 제목 체크의 끝
			
			//내용 필수 항목 체크
			if(isEmpty("#content","내용",true)) return false;

			//내용 필수 항목 체크
			if(isEmpty("#writer","작성자",true)) return false;

			
			//길이 제한 체크
			//길이 체크
			if(lengthCheck("#title","제목",3,100,true)) return false;
			if(lengthCheck("#content","내용",3,1000,true)) return false;
		});
		
		// 날짜 입력 설정 - datepicker : 전체 날짜 입력 형태
		let now = new Date();
	    let startYear = now.getFullYear();
	    let yearRange = startYear  +":" + (startYear + 10) ;
		$(".datepicker").datepicker({
			// 입력란의 데이터 포맷 
			dateFormat: "yy-mm-dd",
			// 월 선택 입력 추가
			changeMonth: true,
			// 년 선택 입력 추가
			changeYear: true,
			// 월 선택할 때의 이름 - 원래는 영어가 기본
			monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			// 달력의 요일 표시
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			// 선택 년도의 범위 - 현재부터 10년 이후까지 연도 검색 가능
			yearRange: yearRange,
		});		
		
		
				$("#startDate").datepicker("option",
				   {
				      "minDate" : now,
				      onClose : function( selectedDate ) {
				    	  if($(this).val() != "")
				      
				         $( "#endDate" ).datepicker( "option", "minDate", selectedDate );
				      }
				   });
				   $("#endDate").datepicker("option", 
				   {
				      "minDate" : now,
				      onClose : function( selectedDate ) {
				    	  if($(this).val() != "")
				         $( "#startDate" ).datepicker( "option", "maxDate", selectedDate );
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
<form action="/notice/update.do" method="post" id="writeForm">
<input type="hidden" name="page" value="${param.page }">
<input type="hidden" name="perPageNum" value="${param.perPageNum }">
<input type="hidden" name="key" value="${param.key }">
<input type="hidden" name="word" value="${param.word }">
	<div>
	<h1><i class="fa fa-eraser"></i>공지사항 수정</h1>
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
			<label for="content">게시일</label>
				<input id="startDate" name="startDate" required autocomplete="off"
						class="form-control datepicker" value="${vo.startDate }">
		</div>
		<div class="form-group">
			<label for="content">종료일</label>
				<input id="endDate" name="endDate" required autocomplete="off"
						class="form-control datepicker" value="${vo.endDate }">
		</div>
		
		<button type="submit" class="btn btn-dark">수정</button>
		<button type="reset" class="btn btn-light">리셋</button>
		<button type="button" class="btn btn-secondary cancelBtn">취소</button>	
		</div>	
</form>
</div>
</body>
</html>