<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/header.jsp" %>
</head>

<style>
	#bootstrap-data-table tr th{
	
	text-align: center;
	
	}
</style>

<body>
    <!--헤더-->
	<%@ include file="../include/menu.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>교수진 관리</span>
                            </div>
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="number">번호</th>
                                        <th class="field">분야</th>
                                        <th class="type">타입</th>
                                        <th class="team">소속팀</th>
                                        <th class="name">성명</th>
                                        <!-- <th class="">연결 회원 여부</th> -->
                                        <th class="setting">관리</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.idx}"  >
                                        <td><input type="checkbox" value="${item.idx}" name="chk_calc" data-id="${item.idx}"></td>
                                        <td>${item.idx}</td>
                                        <td>${item.field }</td>
                                        <td>${item.type }</td>
                                        <td>${item.team }</td>
                                        <td>${item.name }</td>
                                        <!-- 
                                        <td>
                                        	<c:if test="${matching_idx == '' }">
                                        	 X
                                        	</c:if>
                                        	<c:if test="${matching_idx != '' }">
                                        	 O
                                        	</c:if>
                                        </td>
                                        -->
                                        <td>
                                        	<button type="button" onclick="location.href='/admin/professor/view.do?idx=${item.idx}'">관리하기</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="page_seach">
                                <div>
                                    <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                        <option value="ALL">전체</option>
                                        <option value="MEMBER_NAME" <c:if test="${model.SEARCH_TYPE == 'MEMBER_NAME'}">selected</c:if>>작성자</option>
                                        <option value="TITLE"  <c:if test="${model.SEARCH_TYPE == 'TITLE'}">selected</c:if>>제목</option>
                                        <option value="CONTENT" <c:if test="${model.SEARCH_TYPE == 'CONTENT'}">selected</c:if>>내용</option>
                                    </select>
                                    <input style="width: 191px;" type="text" value="${model.SEARCH_TEXT }" name="SEARCH_TEXT" id="SEARCH_TEXT" >
                                    <button type="button" value="검색" onClick="searchBtnClick()">검색</button>
                                </div>
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
                                    <li class="delete">
                                        <a href="javascript:deleteArrClick()">선택삭제</a>
                                    </li>
                                    <li class="delete">
                                        <a href="./insert.do">교수 등록</a>
                                    </li>
                                </ul>
                                </div>
                            </div>

                            <!--관리자 버튼 end-->


                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <ul class="page">
                                   <%@ include file="../include/pageing.jsp" %>
                                </ul>
                            </nav>
                            <!--페이지 넘버 end-->
                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->

</body>
<script>

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(3).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(3).css({
	    backgroundColor: "#fff"
	});
});

</script>

</html>

