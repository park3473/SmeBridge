<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/survey.css">

<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!-- 탭 -->
<%@ include file="../include/tab.jsp" %>
<!-- 탭 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01"><span class="f_wet_05">${model.view.title }</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="join">
            <input type="hidden" name="survey_idx" value="${model.view.idx }">
            <p><input type="text" placeholder="신청제목" value="제목 : ${model.view.title}" disabled="disabled"></p>
			<p><input type="text" placeholder="신청자"  value="신청자 이름 : ${sessionScope.UserName }" disabled="disabled"></p>
            <p><input type="text" placeholder="이메일"  value="신청자 이메일 : ${sessionScope.UserEmail }@${sessionScope.UserEmailAddress}" disabled="disabled" ></p>
			<c:forEach var="item" items="${model.QuestionList}" varStatus="status">
				<input type="hidden" name="question_idx" value="${item.idx }">
				<input type="hidden" name="idx" value="${item.idx }">
	            <p class="field_name">${item.field_name }</p>
	            <p class="coment">${item.coment }</p>
	            <p class="answer"><input type="text" name="answer" placeholder="답변작성" value="${model.QuestionAnswerList[status.index].answer }"></p>
			</c:forEach>
			<div class=""><input type="button" value="수정하기" class="btn_02" onclick="SurveyAnswerUpdate()"></div>
			</div>
        </div>
    </div>
</div>
<!-- 콘텐츠끝 -->


</div>
<!-- 서브끝 -->

<!-- content end -->

<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">

	function SurveyAnswerUpdate(){
		
		var answerCnt = $('input[name=answer]').length;
		
		console.log(answerCnt);
		
		for(i = 0; i < answerCnt; i++){
			
			if($('input[name=answer]').eq(i).val() == ''){
				alert('답변을 모두 작성하여 주세요.');
				
				return;
			}
			
		}
		
		console.log('end');
		
		var survey_idx = '${model.view.survey_idx}';
		var title = '${model.view.title}';
		var member_id = '${sessionScope.UserId}';
		var name = '${sessionScope.UserName}';
		var email = '${sessionScope.UserEmail}';
		var email_address = '${sessionScope.UserEmailAddress}';
		
		var answer_idx = '${model.view.idx}';
		
		var list = new Array();
		for(i = 0; i < answerCnt; i++){
			
			var aJson = new Object();
			aJson.idx = $('input[name=idx]').eq(i).val();
			aJson.survey_idx = survey_idx;
			aJson.answer_idx = answer_idx;
			aJson.question_idx = $('input[name=question_idx]').eq(i).val();
			aJson.answer = $('input[name=answer]').eq(i).val();
			list.push(aJson);
		}
		
		console.log(list);
		
		$.ajax({
		
			url : '/user/mypage/answer/update.do',
			type : 'POST',
			contentType: 'application/json',
			data : JSON.stringify(list),
			success : function(status , xhr){
				
				console.log('설문 답변 수정 완료.');
				alert('설문 답변이 수정되었습니다.');
				
				location.href='/index.do';
				
				
			},
			error : function(error , xhr){
				
			}
			
		})
		
		/*
		var list = new Array();
	    for (i = 0; i < answerCnt ; i++){

	      var aJson = new Object();
	      aJson.survey_idx = $('input[name=answer]').eq(i).val();
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
		*/
		
	}

</script>