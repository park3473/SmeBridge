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


<!-- 탭 -->
<%@ include file="../include/tab.jsp" %>
<!-- 탭 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
	<c:if test="${model.view.board_idx == '7'}">
    	<div class="font_noto tit_01 f_wet_01"><span class="f_wet_05">공지사항</span></div>
    </c:if>
    <c:if test="${model.view.board_idx == '8'}">
    	<div class="font_noto tit_01 f_wet_01"><span class="f_wet_05">정보안내</span></div>
    </c:if>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="board_wiew">
			<p class="tit font_noto">${model.view.title }</p>
			<p class="info"><strong>작성자 : </strong>${model.view.name } <span class="gab">ㅣ</span><strong>작성일 : </strong>${fn:substring(model.view.create_tm , 0 , 11 ) }<span class="gab">ㅣ</span><strong>조회수 : </strong>${model.view.rdcnt }</p>
			<p class="cont">${model.view.content } </p>
			<c:if test="${model.list.size() > 0 }">
			<c:forEach varStatus="status" items="${model.list }" var="item">
			<p class="file"><strong>첨부파일목록 : </strong>대전컨벤션센터_2023년 전시장 지정등록업체(정시)_목록.xlsx</p>
			</c:forEach>
			</c:if>
			<c:if test="${model.filelist.size() == 0 }">
			<p class="file"><strong> </strong></p>
			</c:if>
			<p class="btn_list"><span onclick="javascript:location.href='/user/board_data/list.do?board_idx=${model.view.board_idx}'" class="btn_01">목록</span><span class="btn_02 l_mar_5">답글작성</span></p>
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