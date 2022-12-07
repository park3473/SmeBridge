<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--삭제금지-->

<c:if test="${ssion_langage == 'kr'}">한글</c:if>
<c:if test="${ssion_langage != 'kr'}">영어</c:if>

<!--공통 헤더 시작-->
<%@ include file="./view/include/header.jsp" %>
<%@ include file="./view/include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- 몸통 -->


<script type="text/javascript">


</script>
<!--공통하단-->
<%@ include file="./view/include/footer.jsp" %>
<script type="text/javascript">