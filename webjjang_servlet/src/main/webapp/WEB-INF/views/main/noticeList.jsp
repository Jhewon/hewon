<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h4><i class="fa fa-bookmark"></i>공지사항</h4>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<td>게시일</td>
		</tr>
		<c:forEach items="${noticeList }" var="vo">
			<tr class="dataRow notice noticeLink">
				<!-- td : table data - 테이블 데이터 텍스트 -->
				<td class="no">${vo.no}</td>
				<td>${vo.title}</td>
				<td>${vo.startDate}</td>
			</tr>
		</c:forEach>
	</table>