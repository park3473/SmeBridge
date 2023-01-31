<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.in_sub_sort{position:absolute;bottom:0}
.in_sub_sort .nav li {border-left:1px #72777a solid;background:rgba(0, 0, 0, 0.5);line-height:35px;text-align:center}
.in_sub_sort .nav li:first-child {border-left: none}
.in_sub_sort .nav a {color: #fff}
.in_sub_sort .active{background:rgba(255, 255, 255, 0.7);color:#000 !important;font-weight:bold}
.in_sub_sort .gab_01 li {width:calc(100% / 1)}
.in_sub_sort .gab_02 li {width:calc(100% / 2)}
.in_sub_sort .gab_03 li {width:calc(99.9999% / 3)}
.in_sub_sort .gab_04 li {width:calc(100% / 4)}
.in_sub_sort .gab_05 li {width:calc(100% / 5)}
.in_sub_sort .gab_06 li {width:calc(100% / 6)}

@media only screen and (max-width:992px) {        

	.in_sub_sort {display:none}  
}
</style>

<div class="container">
	<div class="row">
		<div class="container in_sub_sort">
			<div class="row">
				<div class="col">
					<c:if test="${fn:indexOf( pageContext.request.requestURI , '/view/login') > -1 
					|| fn:indexOf( pageContext.request.requestURI , '/view/register') > -1
					|| fn:indexOf( pageContext.request.requestURI , '/view/id_search') > -1
					|| fn:indexOf( pageContext.request.requestURI , '/view/password_search') > -1
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
				</div>
			</div>
		</div>
	</div>
</div>