<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/menu.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>
</head>

<body>
<!--헤더-->
<%@ include file="../include/header.jsp" %>
<!--헤더 end-->


<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div>
                    <form action="./update.do" method="post" name="updateForm" id="updateForm" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden"  name="idx" value="${model.view.idx}" />
                        <input type="hidden"  name="name" value="${model.view.name}" />
                        <input type="hidden"  name="member_id" value="${model.view.member_id}" />
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>응답 보기</span>
                            </div>
                            <div class="member_register_wrap">
                            	<c:forEach var="item" items="${model.QuestionList }" varStatus="status">
	                                <div class="member_input_wrap question_input_wrap" id="question_input_${status.index }">
	                                    <ul class="member_input">
	                                        <li>
	                                        	<span class="list_t">질문 순서</span>
	                                        	<input class="input_mr" type="text" name="" id="question_seq" value="${item.seq }" readonly="readonly" >
	                                        	<span>응답 타입</span>
	                                        	<c:if test="${item.type ==  '0'}">
		                                        	<input class="input_mr" type="text" name="" id="question_type" value="텍스트" readonly="readonly" >
		                                        </c:if>
		                                        <c:if test="${item.type ==  '1'}">
													<input class="input_mr" type="text" name="" id="question_type" value="라디오" readonly="readonly" >
		                                        </c:if>
		                                        <c:if test="${item.type ==  '2'}">
		                                        	<input class="input_mr" type="text" name="" id="question_type" value="체크박스" readonly="readonly" >
		                                        </c:if>
	                                        </li>
	                                        <li>
	                                        	<span class="list_t">질문</span>
	                                        	<input class="input_title" type="text" name="" id="question_field_name" value="${item.field_name }" readonly="readonly" >
	                                        </li>
	                                        <li>
	                                        	<span class="list_t">응답</span>
	                                        	<input class="input_title" type="text" name="" id="question_select_list" value="${model.AnswerList[status.index].answer }" readonly="readonly" >	                                        
	                                        </li>
	                                    </ul>
	                                </div>
                                </c:forEach>
                            </div>
                            
                        </div>

                     </form>
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

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/board.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>



</body></html>

<script type="text/javascript">

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(2).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(2).css({
	    backgroundColor: "#fff"
	});
	
	
});



</script>