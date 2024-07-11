<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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

			//내용 필수 항목 체크
			if(isEmpty("#pw","비밀번호",false)) return false;
			

			//내용 필수 항목 체크
			if(isEmpty("#pw2","비밀번호 확인",false)) return false;
			
			//길이 제한 체크
			//길이 체크
			if(lengthCheck("#title","제목",3,100,true)) return false;
			if(lengthCheck("#content","내용",3,1000,true)) return false;
			if(lengthCheck("#writer","작성자",2,10,true)) return false;
			if(lengthCheck("#pw","비밀번호",4,20,false)) return false;
			if(lengthCheck("#pw2","비밀번호 확인",4,20,false)) return false;
			
			//비밀번호와 비밀번호 확인	
			let pw=$("#pw").val();
			let pw2=$("#pw2").val();
			if(pw!=pw2) {
				alert("비밀번호와 비밀번호 확인 같지 않습니다. 다시 입력해주세요."); // 경고
				// 비밀번호 비밀번호 확인의 데이터를 지운다.
				$("#pw,#pw2").val("");
				$("#pw").focus(); // 커서 위치
				return false; // 페이지 이동을 막는다.
			}
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
</head>
<body>

	<div class="container">
	<h3><i class="fa fa-pencil-square-o"></i>공지사항 등록</h3>
	<form action="/notice/write.do" method="post" id="writeForm">
	<input name="perPageNum" value="${param.perPageNum }" type="hidden">
		<table class="table">
			<!-- tr : table row - 테이블 한줄 -->
			<!-- 게시판 데이터의 제목 -->
			<tr>
				<th>제목</th>
				<td>
					<input id="title" name="title" required 
						class="form-control" maxlength="100"
						pattern="^[^ .].{2,99}$"
						title="맨앞에 공백문자 불가. 3~100자 입력"
						placeholder="제목 입력 : 3자 이상 100자 이내"
					>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control" id="content" name="content"  required
					rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다."></textarea>
				</td>
			</tr>
			<tr>
					<td>게시일</td>
						<td>
						<input id="startDate" name="startDate" required autocomplete="off"
						class="form-control datepicker" >
						</td>
			</tr>
			<tr>
					<td>종료일</td>
						<td>
						<input id="endDate" name="endDate" required autocomplete="off"
						class="form-control datepicker" >
						</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
					<button class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-secondary">다시입력</button>
					<button type="button" onclick="history.back();" class="btn btn-warning">취소</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>