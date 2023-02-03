<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%

Random random = new Random();
random.setSeed(System.currentTimeMillis());

String [] backgroundList = {"main_bg_01.jpg","main_bg_02.jpg"};

int backgroundCnt = backgroundList.length;

int RandomInt = random.nextInt(backgroundCnt);

String Background = backgroundList[RandomInt];


%>

<c:set var="background" value="<%=Background %>" />

<!-- 상단탭 -->
<div class="sub_all_tit" style="background:url('/resources/img/${background}') no-repeat center center">

<div class="container ${fullURL}">
	<div class="row">
		<div class="container in_sub_sort">
			<div class="row">
				<div class="col">
					<c:if test="${fn:indexOf( requestURI , '/view/login') > -1 
					|| fn:indexOf( requestURI , '/view/register') > -1
					|| fn:indexOf( requestURI , '/view/id_search') > -1
					|| fn:indexOf( requestURI , '/view/password_search') > -1
					}">
						<ul class="nav gab_04">
							<li>
								<a class="nav-link <c:if test="${fn:indexOf( pageContext.request.requestURI , '/view/login') > -1}">active</c:if> " href="/view/login.do">로그인</a>
							</li>
							<li>
								<a class="nav-link <c:if test="${fn:indexOf( pageContext.request.requestURI , '/view/register') > -1}">active</c:if> " href="/view/register.do">회원가입</a>
							</li>
							<li>
								<a class="nav-link <c:if test="${fn:indexOf( pageContext.request.requestURI , '/view/id_search') > -1}">active</c:if> " href="/view/id_search.do">아이디 찾기</a>
							</li>
							<li>
								<a class="nav-link <c:if test="${fn:indexOf( pageContext.request.requestURI , '/view/password_search') > -1}">active</c:if> " href="/view/password_search.do">비밀번호 재설정</a>
							</li>
						</ul>
					</c:if>
					<c:if test="${fullURL == '/view/subpage/view.do?idx=1&'
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=2') > -1 
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=3') > -1
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=4') > -1
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=5') > -1
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=6') > -1
					}">
						<ul class="nav gab_06">
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=1') > -1}">active</c:if> " href="/view/subpage/view.do?idx=1">센터장인사말</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=2') > -1}">active</c:if> "  href="/view/subpage/view.do?idx=2">비전및전략</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=3') > -1}">active</c:if> " href="/view/subpage/view.do?idx=3">핵심가치</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=4') > -1}">active</c:if> " href="/view/subpage/view.do?idx=4">주요사업</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=5') > -1}">active</c:if> " href="/view/subpage/view.do?idx=5">조직도</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=6') > -1}">active</c:if> " href="/view/subpage/view.do?idx=6">오시는길</a></li>
						</ul>
					</c:if>
					<c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=7') > -1 
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=8') > -1 
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=9') > -1
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=10') > -1
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=11') > -1
					|| fn:indexOf( fullURL , '/view/subpage/view.do?idx=12') > -1
					}">
						<ul class="nav gab_06">
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=7') > -1}">active</c:if> " href="/view/subpage/view.do?idx=7">첨단소재부품</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=8') > -1}">active</c:if> "  href="/view/subpage/view.do?idx=8">공정장비</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=9') > -1}">active</c:if> " href="/view/subpage/view.do?idx=9">바이오 및 헬스케어</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=10') > -1}">active</c:if> " href="/view/subpage/view.do?idx=10">ICT/SW</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=11') > -1}">active</c:if> " href="/view/subpage/view.do?idx=11">기계항공</a></li>
							<li><a class="nav-link <c:if test="${fn:indexOf( fullURL , '/view/subpage/view.do?idx=12') > -1}">active</c:if> " href="/view/subpage/view.do?idx=12">제조자동화 및 지능화</a></li>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="tit_01 font_noto f_wet_01">기술 혁신을 위한 <span class="f_wet_04">최고의 파트너</span></div> 
</div>
<!-- 상단탭끝 -->
