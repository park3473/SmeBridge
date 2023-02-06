<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">

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
    <div class="font_noto tit_01 f_wet_01">공정<span class="f_wet_05">장비</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <!-- 리스트 -->
            <table class="table">
            <thead>
            <tr>
                <th>번호</th>
                <th>신청 폼 제목</th>
                <th>신청 상태</th>
                <th>신청 날짜</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach varStatus="status" var="item" items="${model.list }">
            <tr>
                <td class="center">${status.index + 1 }</td>
                <td class="center" onclick="location.href='/user/mypage/answer/update.do?member_id=${item.member_id}&idx=${item.idx }&survey_idx=${item.survey_idx }'">${item.title }</td>
                <td class="center">O</td>
                <td class="center">${item.create_tm }</td>
            </tr>
            </c:forEach>
            </tbody>
            </table>
            <!-- 리스트 -->
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