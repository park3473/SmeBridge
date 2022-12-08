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

<c:if test="${ssion_langage == 'kr'}">한글</c:if>
<c:if test="${ssion_langage != 'kr'}">영어</c:if>

<!--공통 헤더 시작-->
<%@ include file="./include/header.jsp" %>
</head>
<body>
<%@ include file="./include/menu.jsp" %>
<!--공통 헤더 끝-->

<form action="${pageContext.request.contextPath }/view/login.do" method="POST" name="loginForm">
	<input type="text" name="member_id">
	<input type="text" name="password">
	<button type="button" onclick="login()">전송</button>
</form>


<script type="text/javascript">
	function login(){
		var member_id = $('[name=member_id]').val();
		var password = $('[name=password]').val();
		
		if(member_id == ''){
			alert('아이디를 입력하여주세요.');
			return;
		}else if(password == ''){
			alert('비밀번호를 입력하여주세요.');
			return;
		}else{
			
			$.ajax({
			
				type : 'POST',
				url : '/view/login.do',
				data : ({
					member_id : member_id,
					password : password
				}),
				success : function (data , status , xhr){
					console.log(data);
					
					if(data.indexOf('true') > -1){
						
						console.log(data.indexOf('true'));
						
						alert('로그인 성공');
						location.href='/index.do';
					}else if(data.indexOf('false') > -1){
						
						if(data.indexOf('0') > 0){
						
							console.log(data.indexOf('-1'));
							
							alert('완전불일치');
							
						}else if(data.indexOf('2') > -1){
							
							console.log(data.indexOf('2'));
							
							alert('비밀번호가 틀렸습니다.');
							
						}else if(data.indexOf('3') > -1){
							
							console.log(data.indexOf('3'));
							
							alert('로그인 오류 error - 사이트 관리자에게 문의 부탁드립니다.');
							
						}
						
					}
				},
				error : function (error , status , xhr){
					
				}
				
			})
			
			
		}
	}
</script>
<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<script type="text/javascript">