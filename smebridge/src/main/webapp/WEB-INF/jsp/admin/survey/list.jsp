<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--삭제금지-->
<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->


<div>
	<form action="/admin/survey/list.do" name="search_form">
		<select name="search_type">
			<option value="title">제목</option>
		</select>
		<input type="text" name="search_text" placeholder="설문 제목을 입력해주세요.">
		<button type="submit">검색</button>
	</form>
	<table list_cnt="${fn:length(model.list)}">
		<thead>
			<tr>
				<td>번호</td>
				<td>설문 제목</td>
				<td>설정 여부</td>
				<td>신청서</td>
				<td>생성 일시</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(model.list) <= 0 }">
			<tr>
				<td colspan="5">
					검색된 리스트가 없습니다.
				</td>
			</tr>
			</c:if>
			<c:if test="${fn:length(model.list) > 0 }">
			<c:forEach items="${model.list }" varStatus="status" >
			<tr>
				<td>${item.idx }</td>
				<td>${item.title }</td>
				<td>${item.type }</td>
				<td>${item.name }</td>
				<td>${item.create_tm }</td>
			</tr>
			</c:forEach>
			</c:if>
		</tbody>
	</table>
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/survey/insert.do'">신청 폼 작성</button>
</div>



<script type="text/javascript">


</script>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">