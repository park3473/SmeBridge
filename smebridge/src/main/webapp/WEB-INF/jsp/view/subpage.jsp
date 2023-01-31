<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--공통 헤더 시작-->
<%@ include file="./include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

${model.view.content }

<!-- content end -->


<input type="hidden" name="SubPageName" value="${model.view.name }">
<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<script type="text/javascript">
	
$(document).ready(function() {
	
	var name = $('input[name=SubPageName]').val();
	
	$.ajax({
		url : '/view/subpage/view.do',
		type : 'POST',
		data : ({
			name : name
		}),
		success : function(data , status , xhr){
			
			console.log(data);
			
			console.log(data.BoardList);
			console.log(data.ProfessorList);
			
		},
		error : function(status , xhr){
			
			console.log('error-404');
			
		}
	})
	
})

</script>