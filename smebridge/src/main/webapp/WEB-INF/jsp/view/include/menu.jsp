<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="wrapper" class="main">
<header id="header" class="header color-bright">
<div class="header-inner">

<!--모바일용로고-->
<div class="head-title">
<h1 class="main-logo"><a href="/index.do"><img src="${pageContext.request.contextPath }/resources/img/logo.png"></a></h1>
</div>
<!--모바일용로고-->

<!--로고-->
<strong class="logo"><a href="/index.do"><img src="${pageContext.request.contextPath }/resources/img/logo_white.png"></a></strong>
<!--로고끝-->

<!--모바일메뉴버튼-->
<button type="button" class="btn-gnb-open"><span class="bar"></span><span class="blind">메뉴열기</span></button>
<!--모바일메뉴버튼-->

<nav id="nav">
<div class="nav-inner">
<div class="util-menu">

<!--인사말및 로고처리-->
<div class="welcome">
Welcome to KAIST GCC Homepage !
</div>
<!--인사말및 로고처리끝-->

<!--로그인-->
<div class="util-menu-group bottom">
<!-- 

<c:if test="${sessionScope.Login != 'OkOk' }">
<a href="${pageContext.request.contextPath}/view/login.do">로그인</a>
<a href="${pageContext.request.contextPath}/view/register.do">회원가입</a>
</c:if>
<c:if test="${sessionScope.Login == 'OkOk' }">
<a href="${pageContext.request.contextPath}/view/logout.do">로그아웃</a>
<c:if test="${sessionScope.UserLevel == '3' }">
	<a href="${pageContext.request.contextPath }/admin/index.do">관리자</a>
</c:if>
</c:if>

 -->
 
<c:if test="${sessionScope.Login != 'OkOk' }">
<a href="/view/register.do"><span>회원가입</span></a><span class="gab">ㅣ</span>
<a href="/view/login.do"><span>로그인</span></a><span class="gab">ㅣ</span>
</c:if>
<c:if test="${sessionScope.Login == 'OkOk' }">
<a href="/view/logout.do"><span>로그아웃</span></a><span class="gab">ㅣ</span>
<a href="/user/mypage/view.do?idx=${sessionScope.UserIdx }"><span>마이 페이지</span></a><span class="gab">ㅣ</span>
<c:if test="${sessionScope.UserLevel == '3' }">
	<a href="${pageContext.request.contextPath }/admin/board/list.do">관리자</a>
</c:if>
</c:if>
</div>
<!--로그인끝-->

<!--셀렉트박스-->
<div class="menu">
	<div class="lang-list">
		<div class="lang">
			<a href="#page" class="select-link"><span class="blind">언어 선택</span></a>
			<span class="selected"><i class="las la-search"></i></span>
		</div>
		<ul class="select-lang hide">
			<li>
			<!--<a href="/"><span>English</span></a>-->
			</li>
		</ul>
	</div>
</div>
</div>
<!--셀렉트박스끝-->

<!--메뉴-->
<div class="gnb-area">
	<!--카테고리-->
	<ul class="gnb-menu" id="menu_list" >

		
	</ul>
		<!--카테고리끝-->
		
		<!--고객센터-->
	<ul>
		<li class="t_pad_30 text-right r_pad_20 gray_03 c_show">
		<div class="b_pad_5">Tel : 042.350.8442</div>
		<div class="b_pad_5">E-mail : smebridge@kaist.ac.kr</div>
		</li>
	</ul>
	<!--고객센터-->

</div>
<!--메뉴끝-->

</div>
<button type="button" class="btn-gnb-close ico-close"><span class="blind">메뉴닫기</span></button>
</nav>
</div>
</header>
</div>
