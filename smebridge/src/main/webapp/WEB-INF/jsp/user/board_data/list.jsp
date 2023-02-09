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
	<c:if test="${model.BoardDataList[0].board_idx == '7'}">
    	<div class="font_noto tit_01 f_wet_01"><span class="f_wet_05">공지사항</span></div>
    </c:if>
    <c:if test="${model.BoardDataList[0].board_idx == '8'}">
    	<div class="font_noto tit_01 f_wet_01"><span class="f_wet_05">정보안내</span></div>
    </c:if>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container txt_just">
    <div class="row">
        <div class="col-sm-12">
            <div class="tabs_02">
                <!-- 탭01 -->
                <div id="tab01" class="tab-contents_02">
                    <!-- 주요기술분야 및 특허이전 -->
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- 리스트 -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${model.BoardDataList }" var="item" varStatus="status">
                                    <tr>
                                        <td class="center">${model.itemtotalcount - (status.index + model.page *  model.itemcount)}</td>
                                        <td class="center pointer" onclick="location.href='/user/board_data/view.do?idx=${item.idx}&board_idx=${item.board_idx }'" >${item.title }</td>
                                        <td class="center">${item.name }</td>
                                        <td class="center">${fn:substring(item.create_tm,0,11)}</td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- 
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="pagination">
                                        <a href="#">&laquo;</a>
                                        <a class="active" href="#">1</a>
                                        <a href="#">2</a>
                                        <a href="#">3</a>
                                        <a href="#">4</a>
                                        <a href="#">&raquo;</a>
                                    </div>
                                </div>
                            </div>
                            -->
                            <!-- 리스트 -->
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
</script>