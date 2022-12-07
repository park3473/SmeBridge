<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--삭제금지-->

<c:if test="${ssion_langage == 'kr'}">한글</c:if>
<c:if test="${ssion_langage != 'kr'}">영어</c:if>

<!--공통 헤더 시작-->
<%@ include file="./include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<!--공통 헤더 끝-->

<form action="${pageContex.requestContextPath }/view/register.do" name="RegisterForm" id="UserRegisterForm">
	<input type="text" name="member_id" id="member_id"><button type="button" name="id_check_btn" id="id_check_btn" onclick="IdCheck()">중복 검색</button>
	<input type="password" name="password" id="password">
	<input type="text" name="name" id="id">
	<input type="text" name="email" id="email">@<select name="email_address"><option value="naver.com">naver.com</option><option value="gmail.com">gmail.com</option><option value="daum.net">daum.net</option><option value="hanmail.com">hanmail.com</option></select>
	<input type="text" name="phone1" id="phone1" maxlength="3" value="010"><input type="text" name="phone2" id="phone2" maxlength="4"><input type="text" name="phone3" id="phone3" maxlength="4">
	<input type="hidden" name="zonecode"><input type="text" name="address"><button type="button" name="address_search_btn" onclick="ZipCode()">주소 검색</button>
	<input type="text" name="address_detail">
</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function IdCheck(){
		
		var member_id = $('[name=member_id]').val();
		
		$.ajax({
			type : 'POST',
			url : '/view/IdCheck.do',
			data : ({
				member_id : member_id	
			}),
			success : function(data , status , xhr){
				
				console.log(data);
				
			},
			error : function(error , status , xhr){
				
				console.log('error');
				
			}
			
		})
		
	}
	
	function ZipCode()
	{
		new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	$('[name="zonecode"]').val(data.zonecode);
	        	$('[name="address"]').val(data.roadAddress);
	        }
	    }).open();	
	}

</script>
<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<script type="text/javascript">