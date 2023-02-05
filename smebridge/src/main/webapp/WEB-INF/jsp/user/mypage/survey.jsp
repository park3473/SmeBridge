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
                <th>상태</th>
                <th>등록날짜</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="center">01</td>
                <td>끊임없는 연구개발을 통해 새로운 혁신을 중소기업과 함께 이루겠습니다.</td>
                <td class="center">상태처리</td>
                <td class="center">2023-01-30</td>
            </tr>
            <tr>
                <td class="center">01</td>
                <td>끊임없는 연구개발을 통해 새로운 혁신을 중소기업과 함께 이루겠습니다.</td>
                <td class="center">상태처리</td>
                <td class="center">2023-01-30</td>
            </tr>
            <tr>
                <td class="center">01</td>
                <td>끊임없는 연구개발을 통해 새로운 혁신을 중소기업과 함께 이루겠습니다.</td>
                <td class="center">상태처리</td>
                <td class="center">2023-01-30</td>
            </tr>
            </tbody>
            </table>
            <div class="row">
                <div class="col-sm-8">
                    <div class="pagination">
                        <a href="#">&laquo;</a>
                        <a href="#">1</a>
                        <a class="active" href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">&raquo;</a>
                    </div>
                </div>
                <div class="col-sm-4 align_r">
                    <div class="btn_01">글쓰기</div>
                </div>
            </div>
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