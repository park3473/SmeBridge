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

<!-- 상단탭 -->
<div class="sub_all_tit" style="background:url('/resources/img/main_bg_02.jpg') no-repeat center center">

<div class="tit_01 font_noto f_wet_01">기술 혁신을 위한 <span class="f_wet_04">최고의 파트너</span></div> 
</div>
<!-- 상단탭끝 -->

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
            <p><input type="text" placeholder="신청제목" value="제목 : ${model.view.title}" disabled="disabled"></p>
			<p><input type="text" placeholder="신청자"  value="신청자 이름 : ${sessionScope.UserName }" disabled="disabled"></p>
            <p><input type="text" placeholder="이메일"  value="신청자 이메일 : ${sessionScope.UserName }@naver.com" disabled="disabled" ></p>
			<c:forEach var="item" items="${model.list}" varStatus="status">
	            <p class="field_name">${item.field_name }</p>
	            <p class="coment">${item.coment }</p>
	            <p class="answer"><input type="text" name="answer" placeholder="답변작성"></p>
			</c:forEach>
				<div class=""><input type="button" value="저장하기" class="btn_02" onclick="SurveyAnswerInsert()"></div>
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

	function SurveyAnswerInsert(){
		
		alert('설문 저장 테스트');
		
	}

</script>