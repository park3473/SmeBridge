<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>중소기업R&D공유센터 - 관리자</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:image" content="${pageContext.request.contextPath}/resources/img/kakao_bg.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min45.css">
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script src="${pageContext.request.contextPath}/resources/js/gtag.js"></script>
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-163568943-1"></script> -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-163568943-1');
</script>
<script>

</script>

<c:if test="${sessionScope.Login != 'OkOk' }">
<a href="${pageContext.request.contextPath}/view/login.do">로그인</a>
<a href="${pageContext.request.contextPath}/view/register.do">회원가입</a>
</c:if>
<c:if test="${sessionScope.Login == 'OkOk' }">
<a href="${pageContext.request.contextPath}/view/login.do">로그아웃</a>
<c:if test="${sessionScope.UserLevel == '3' }">
	<a href="${pageContext.request.contextPath }/admin/index.do">관리자</a>
</c:if>
</c:if>