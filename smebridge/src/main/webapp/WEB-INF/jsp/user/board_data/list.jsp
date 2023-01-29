<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board_data.css">

<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!-- 상단탭 -->
<div class="sub_all_tit" style="background:url('/resources/img/main_bg_02.jpg') no-repeat center center">

<style>
.in_sub_sort{position:absolute;bottom:0}
.in_sub_sort .nav li {border-left:1px #72777a solid;background:rgba(0, 0, 0, 0.5);line-height:35px;text-align:center}
.in_sub_sort .nav li:first-child {border-left: none}
.in_sub_sort .nav a {color: #fff}
.in_sub_sort .active{background:rgba(255, 255, 255, 0.7);color:#000 !important;font-weight:bold}
.in_sub_sort .gab_01 li {width:calc(100% / 1)}
.in_sub_sort .gab_02 li {width:calc(100% / 2)}
.in_sub_sort .gab_03 li {width:calc(99.9999% / 3)}
.in_sub_sort .gab_04 li {width:calc(100% / 4)}
.in_sub_sort .gab_05 li {width:calc(100% / 5)}
.in_sub_sort .gab_06 li {width:calc(100% / 6)}

@media only screen and (max-width:992px) {        

.in_sub_sort {display:none}  

}
</style>

<div class="container">
<div class="row">
<div class="container in_sub_sort">
<div class="row">
<div class="col">

<ul class="nav gab_06">
<li><a class="nav-link" href="/view/subpage/view.do?idx=7">첨단소재부품</a></li>
<li><a class="nav-link active" href="/view/subpage/view.do?idx=8">공정장비</a></li>
<li><a class="nav-link" href="/view/subpage/view.do?idx=9">바이오 및 헬스케어</a></li>
<li><a class="nav-link" href="/view/subpage/view.do?idx=10">ICT/SW</a></li>
<li><a class="nav-link" href="/view/subpage/view.do?idx=11">기계항공</a></li>
<li><a class="nav-link" href="/view/subpage/view.do?idx=12">제조자동화 및 지능화</a></li>
</ul>

</div>
</div>
</div>
</div>
</div>


<div class="tit_01 font_noto f_wet_01">기술 혁신을 위한 <span class="f_wet_04">최고의 파트너</span></div> 
</div>
<!-- 상단탭끝 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01">공정<span class="f_wet_05">장비</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container txt_just">
    <div class="row">
        <div class="col-sm-12">
            <div class="tabs_02">
                <div class="tab-button-outer_02">
                    <ul id="tab-button_02" class="font_noto">
                        <li><a href="#tab01">핵심보유기술</a></li>
                        <li><a href="#tab02">기술전략로드맵</a></li>
                        <li><a href="#tab03">참여교수진</a></li>
                    </ul>
                </div>
                <div class="tab-select-outer_02">
                    <select id="tab-select_02">
                    <option value="#tab01">핵심보유기술</option>
                    <option value="#tab02">기술전략로드맵</option>
                    <option value="#tab03">참여교수진</option>
                    </select>
                </div>
                <!-- 탭01 -->
                <div id="tab01" class="tab-contents_02">
                    <!-- 주요기술분야 및 특허이전 -->
                    <div class="row">
                        <div class="col-sm-6 cont_tit">
                            <div class="tit_04 font_noto"><span class="cont_blit_01"></span>기술전략 로드맵</div>
                            <div class="sul_area">
                                <ul class="b_line">
                                	<c:forEach var="item" varStatus="status" items="${model.list }">
                                    	<li><a onclick="alert('게시판 보기링크')">게시판 링크</a><span style="float:right">2023-01-25</span></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="bnk_gab_20"></div>
                        </div>
                    </div>
                    
                </div>
                <!-- 탭01 끝 -->
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