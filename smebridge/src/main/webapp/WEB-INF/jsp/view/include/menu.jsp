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

<a href="/view/register.do"><span>회원가입</span></a><span class="gab">ㅣ</span>
<a href="/view/login.do"><span>로그인</span></a><span class="gab">ㅣ</span>
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
<ul class="gnb-menu">

<li>
<a href="#"><span>센터소개</span></a>
<ul class="depth2">
<li><a href="/view/subpage/view.do?idx=1"><span>센터장인사말</span></a></li>
<li><a href="/view/subpage/view.do?idx=2"><span>비전및전략</span></a></li>
<li><a href="/view/subpage/view.do?idx=3"><span>핵심가치</span></a></li>
<li><a href="/view/subpage/view.do?idx=4"><span>주요사업</span></a></li>
<li><a href="/view/subpage/view.do?idx=5"><span>조직도</span></a></li>
<li><a href="/view/subpage/view.do?idx=6"><span>오시는길</span></a></li>
</ul>
</li>

<li>
<a href="#"><span>센터혁신기술 A-Z</span></a>
<ul class="depth2">
<li><a href="/view/subpage/view.do?idx=7"><span>첨단소재부품</span></a></li>
<li><a href="/view/subpage/view.do?idx=8"><span>공정장비</span></a></li>
<li><a href="/view/subpage/view.do?idx=9"><span>바이오 및 헬스케어</span></a></li>
<li><a href="/view/subpage/view.do?idx=10"><span>ICT/SW</span></a></li>
<li><a href="/view/subpage/view.do?idx=11"><span>기계항공</span></a></li>
<li><a href="/view/subpage/view.do?idx=12"><span>제조자동화 및 지능화</span></a></li>
</ul>
</li>

<li><a href="#"><span>기술협력 및 지원</span></a></li>
<li><a href="#"><span>장비공유 및 교육</span></a></li>

<li>
<a href="#"><span>커뮤니티센터</span></a>
<ul class="depth2">
<li><a href="#"><span>공지사항</span></a></li>
<li><a href="#"><span>정보안내</span></a></li>
<li><a href="#"><span>기술이전문의</span></a></li>
</ul>
</li>


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