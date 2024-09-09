<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>

<style type="text/css">
#smallImageDiv img {
	width: 80px;
	height: 80px;
	margin: 3px;
}
#smallImageDiv img:hover {
	opacity :70%;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function(){
	
	// 이벤트 처리
	// 글수정 버튼
	$("#updateBtn").click(function(){
		location = "updateForm.do?no=${vo.goods_no}";
	});
	
	// 글삭제 버튼
	$("#deleteBtn").click(function(){
		$("#pw").val("");
	});
	
	// 리스트 버튼
	$("#listBtn").click(function(){
		location = "list.do?page=${param.page}&perPageNum=${param.perPageNum}";
	});
	
	
	// 이미지 보기 작 클릭 -> 큰 보이기
	$("#smallImageDiv img").click(function(){
		$("#bigImageDiv img").attr("src",$(this).attr("src"));
	});
});
</script>

</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header"><h2>상품 상세보기</h2></div>
	  <div class="card-body">
	  	<div class="row">
	  		<div class="col-md-6">
		  		<div id="smallImageDiv">
	  				<img src="${vo.image_name }" class="img-thumbnail">
	  				<c:if test="${!empty imageList }">
	  					<c:forEach items="${imageList }" var="imageVO">
			  				<img src="${imageVO.image_name }" class="img-thumbnail">
	  					</c:forEach>
	  				</c:if>
		  		</div>
		  		<div id="bigImageDiv" class="img-thumbnail">
	  				<img src="${vo.image_name }" style="width: 50%;">
		  		</div>
	  		</div>
	  		<div class="col-md-6">
	  		</div>
	  	</div>	
  		<div class="row">
	  		<div class="col-md-12">
	  		
	  		</div>
  		</div>
	  	
	  </div>
	  <div class="card-footer">
	  	<button class="btn btn-primary" id="updateBtn">수정</button>
		<!-- 모달창은 열어서 비밀번호를 입력 받고 삭제하여 가는 처리 -->
	  	<button class="btn btn-danger" id="deleteBtn"
	  	  data-toggle="modal" data-target="#deleteModal">삭제</button>
	  	<button class="btn btn-warning" id="listBtn" >리스트</button>
	  </div>
	</div>
	<!-- 글보기 card 끝 -->
</div>

  <!-- The Modal -->
  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 입력 모달 창</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <form action="delete.do" method="post">
        	<input type="hidden" name="no" value="${vo.goods_no }">
	        <!-- Modal body -->
	        <div class="modal-body">
	        	<div class="form-group">
	          		<input class="form-control" name="pw" type="password" 
	          		 id="pw">
	          	</div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button class="btn btn-danger" >삭제</button>
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        </div>
        
        </form>
        
      </div>
    </div>
  </div>


</body>
</html>