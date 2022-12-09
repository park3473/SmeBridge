<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!--삭제금지-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--삭제금지-->

<c:if test="${ssion_langage == 'kr'}">한글</c:if>
<c:if test="${ssion_langage != 'kr'}">영어</c:if>



<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>
</head>

<body>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->

<div>
	<input type="text" name="title" placeholder="설문 제목을 작성하여 주세요.">
	<input type="textarea" name="content">
</div>


<script type="text/javascript">

function test(){
	
	
	var list = new Array();
    for (i = 0; i < 5;i++){

      var aJson = new Object();
      aJson.survey_idx = i;
      aJson.answer_idx = i+1;
      aJson.question_idx = i+2;
      list.push(aJson);
    }
    console.log(list);
    
    $.ajax({
    	type : 'POST',
    	url : '/admin/survey/answer/question/insert.do',
    	data : JSON.stringify(list),
    	success : function (status , xhr){
    		
    	},
    	error : function(error , xhr){
    		
    	}
    })
    
    
	
}

</script>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">