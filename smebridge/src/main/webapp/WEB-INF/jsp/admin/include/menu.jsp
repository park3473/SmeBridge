<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/view/menu.do',
		cache : false,
		success : function(result , status , xhr){
			console.log(result);
		}
	})
</script>

<div id="menu">
	<!-- 메뉴 생성 -->
	<ul>
		<li>
			<a href="/admin/board/list.do">게시판 관리</a>
			<ul>
				<li>게시글 관리</li>
			</ul>
		</li>
		<li>
			<a href="/admin/member/list.do">회원 관리</a>
		</li>
		<li>
			<a href="/admin/survery/list.do">신청 폼 관리</a>
		</li>
		<li>
			<a href="/admin/professor/list.do" >교수진 관리</a>
		</li>
	</ul>
</div>

<!-- 에시 -->
<!-- <div>
	<ul>
		<li>메뉴 1</li>
	</ul>
</div>
 -->