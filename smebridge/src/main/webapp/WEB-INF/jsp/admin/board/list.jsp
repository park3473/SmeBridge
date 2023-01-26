 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/header.jsp" %>
</head>

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
                                <span>${model.NOTICES.pageDomain.NAME}</span>
                            </div>
							<form action="./insert.do?" method="post" name="updateform" id="updateform">
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="number">번호</th>
                                        <th class="program_name">제목</th>
                                        <th class="obs">조회수</th>
                                        <th class="name">작성자</th>
                                        <th class="join">작성일</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.IDX}"  >
                                        <td><input type="checkbox" value="${item.IDX}" name="chk_calc" data-id="${item.IDX}"></td>
                                        
                                         <c:if test="${item.TYPE == '2'}">
                                      	   <td class="td_number">공지</td>	
                                         </c:if>
                                         <c:if test="${item.TYPE != '2'}">
                                         	<td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                         </c:if>
                                            
                                        
                                        
                                        <td style="text-align: left;"><a href="./${item.IDX}/update.do">${item.TITLE}</a></td>
                                        <td>${item.READ_CNT}</td>
                                        <td>${item.MEMBER_NAME}</td>
                                        <td>
                                            ${fn:substring(item.CREATE_TM,0,11)}
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
                                        <a href="./insert.do">글쓰기</a>
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

</body></html>



<script>




</script>