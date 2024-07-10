<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<script type="text/javascript">
$(function(){
	// 이미지 사이즈 조정 5:4
	let imgwidth = $(".imgDiv:first").width();
	let imgheight = $(".imgDiv:first").height();
	// 높이 계산 - 너비는 동일하다. : 이미지와 이미지를 감싸고 있는 div의 높이로 사용
	let height = imgheight/5 * 4;
	// 전체 imgDiv의 높이를 조정한다.
	$(".imgDiv").height(height);
	// imageDiv 배경을 검정으로 변경
	$(".imgDiv").css("background","black");
	// 이미지 배열로 처리하면 안된다. foreach 사용 - jquery each() 
	$(".imgDiv>img").each(function(idx,image){
		// 이미지가 계산된 높이보다 크면 줄인다.
		if($(image).height() > height){
			let image_width = $(image).width();
			let image_height = $(image).height();
			let width = height / image_height * image_width;
			console.log(width);
			// 이미지 높이 줄이기
			$(image).height(height);
			// 이미지 너비 줄이기
			$(image).width(width);
		}
	});
	
});
</script>

	<h4>이미지 게시판 리스트</h4>
	  <c:if test="${empty imageList }">
	  	<div class="jumbotron">
	 	 <h4>데이터가 존재 하지 않습니다.</h4>
		</div>
	  </c:if>
	  
  <c:if test="${!empty imageList }">
  <div class="row">
  <!-- 이미지의 데이터가 있는 만큼 반복 해서 표시하는 처리 시작 -->
  <c:forEach  items="${imageList }" var="vo" varStatus="vs">
  	<!-- 줄 바꿈 처리 - 인덱스 번호가 가 3의 배수이면  줄바꿈을 한다. -->
  	<c:if test="${(vs.index != 0) && (vs.index % 3 == 0) }">
  		${"</div>" }
  		${"<div class='row'>" }
  	</c:if>
  		<!-- 데이터 표시 시작 -->
  	<div class="col-sm-4 dataRow image imageLink">
  		<div class="card" style="width:100%">
  		<div class="imgDiv text-center align-content-center ">
		  <img class="card-img-top" src=${vo.fileName } alt="image">
  		</div>
		 <div class="card-body">
		    <strong class="card-title">
		    <span class="float-right">${vo.writeDate }</span>
		    ${vo.name }(${vo.id })
		    </strong>
		    <p class="card-text text-truncate title"><span class="no">${vo.no}</span>. ${vo.title }</p>
		 </div>
		</div>
  	</div>
  		<!-- 데이터 표시 끝 -->
  </c:forEach>
  <!-- 이미지의 데이터가 있는 만큼 반복 해서 표시하는 처리 끝 -->
  </div> <!-- div row -->
 </c:if>