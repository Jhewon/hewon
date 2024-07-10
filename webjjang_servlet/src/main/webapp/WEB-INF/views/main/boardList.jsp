<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h4><i class="fa fa-bookmark"></i>일반 게시판 리스트</h4	>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${boardList }" var="vo">
			<tr class="dataRow board boardLink">
				<!-- td : table data - 테이블 데이터 텍스트 -->
				<td class="no">${vo.no}</td>
				<td>${vo.title}</td>
				<td>${vo.writer }</td>
				<td>${vo.writeDate}</td>
			</tr>
		</c:forEach>
	</table>