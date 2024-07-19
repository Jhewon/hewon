<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 리스트</title>
<style type="text/css">
.dataRow:hover {
	background: #ededed;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	// 이벤트 처리
	$(".dataRow").click(function(){
		
		let no = $(this).find(".no").text();
		let accept = $(this).data("accept");
		location="view.do?no="+ no +"&mode=${pageObject.acceptMode}&${pageObject.pageQuery}&accept="+accept;
	});
});

</script>
</head>
<body>
	<div class="container">
	<h3>${(pageObject.acceptMode == 1)?"받은":(pageObject.acceptMode == 2)?"보낸":"모든" }메세지 리스트</h3>
		<div>
		<span class="float-right">
			<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#sendModal">
			  보내기
			</button>
			
			
		</span>
			<a href="list.do?mode=1&${pageObject.pageQuery }" class="btn btn-dark">받은 메세지</a>
			<a href="list.do?mode=2&${pageObject.pageQuery }" class="btn btn-secondary">보낸 메세지</a>
			<a href="list.do?mode=3&${pageObject.pageQuery }" class="btn btn-outline-secondary">모든 메세지</a>
		</div>
		
		<div style="margin-top: 10px;">
			<c:if test="${ empty list }">
				 <li class="list-group-item" style="margin-top: 10px;">메세지가 존재 하지 않습니다.</li>
			</c:if>
			
			<c:if test="${ !empty list }">
					<c:forEach items="${list }" var="vo">
					<div class="media border p-3 dataRow" data-accept="${(vo.senderId == login.id)?0:1 }">
						<c:if test="${vo.senderId == login.id }">
						<!-- 내가 보낸 사람이다 . 받는 사람의 정보만 출력한다. -->
						  <div class="media-body text-right ${(empty vo.acceptDate)?'font-weight-bold': ''}" style="margin-top: 10px;">
						    ${vo.accepterName } <small><i>(${vo.accepterId})</i></small>
						    <p>번호 :<span class="no">${vo.no }</span>  	
						    / 보낸 날짜 : ${vo.sendDate }
						    / 읽은 날짜 : ${(empty vo.acceptDate)?"읽지 않음":vo.acceptDate }
						    </p>
						  </div>
						  <img src="${vo.accepterPhoto }" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px; margin-left: 10px; ">
						</c:if>
						
						<c:if test="${vo.accepterId == login.id }">
						<!-- 내가 보낸 사람이다 . 보낸 사람의 정보만 출력한다. -->
						  <img src="${vo.senderPhoto }" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px; ">
						  <div class="media-body ${(empty vo.acceptDate)?'font-weight-bold': ''}">
						    ${vo.senderName } <small><i>(${vo.senderId})</i></small>
						    <p>번호 : <span class ="no">${vo.no }</span>  	
						    / 보낸 날짜 : ${vo.sendDate }
						    / 읽은 날짜 : ${(empty vo.acceptDate)?"읽지 않음":vo.acceptDate }
						    </p>
						  </div>
						</c:if>
					</div>
					</c:forEach>
			</c:if>
			
		</div>
	</div>
	
		<!-- The Modal -->
	<div class="modal" id="sendModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Heading</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
			<form action="write.do" method="post">
			<input type="hidden" name="perPageNum" value="${vo.perPageNum }">
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<div class="form-group">
		      		<label>받는 사람 아이디</label>
		      		<input name="accepterId" required="required" class="form-control">
		      	</div>
		      	<div class="form-group">
		      		<label>보낼 메시지</label>
		      		<textarea rows="3" name="content" required="required" class="form-control"></textarea>
		      	</div>
		      </div>
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      <button class="btn btn-dark">보내기</button>
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
			</form>
	    </div>
	  </div>
	</div>
	
</body>
</html>