<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*,java.text.*" %>
<script type="text/javascript">
	/*
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/view/menu.do',
		cache : false,
		success : function(result , status , xhr){
			console.log(result);
		}
	})
	*/
</script>

<header id="adm_hd">
        <div id="adm_hd_area">
            <div id="adm_hd_con">
                <div class="adm_hd_size nanumgothic">

                    <div class="hd_menu">
                        <!--관리자 메뉴-->
                        <div class="adm_menu_area">
                            <div class="home">
                                <a href="${pageContext.request.contextPath}/admin/board/list.do">
                                    <img src="${pageContext.request.contextPath}/resources/img/admin/home.png" alt="홈" />
                                </a>
                            </div>
                            <ul class="adm_menu_con">
                            	<li <c:if test="${fn:indexOf(pageContext.request.requestURI , '/member/') > -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/member/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/member_icon.png" alt="회원관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>회원 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/member/list') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/list.do">회원 리스트</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, 'member/insert') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/insert.do">회원 생성</a>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(pageContext.request.requestURI , '/board/') > -1 || fn:indexOf(fullURL , '/board_data/') > -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/board/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/board_icon.png" alt="회원관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>게시판 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/board/list') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/board/list.do">게시판 리스트</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, 'board/insert') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/board/list.do">게시판 생성</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, 'board_data/list') > -1}">class="nav_active"</c:if>>
                                        <a href="#">게시글 관리</a>
                                        <c:if test="${fn:indexOf(pageContext.request.requestURI , '/board_data/') > -1}">
	                                        <ul class="sub_menu_ob">
		                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, 'board_data/list') > -1}">class="nav_active"</c:if>>
		                                            <a href="${pageContext.request.contextPath}/admin/board_data/list.do">게시글 리스트</a>
		                                        </li>
	                                        </ul>
                                        </c:if>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(pageContext.request.requestURI , '/survey/') > -1 || fn:indexOf(pageContext.request.requestURI , '/answer/') > -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/survey/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/program_icon.png" alt="회원관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>설문 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/survey/list') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/list.do">설문 리스트</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/survey/insert') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/insert.do">설문 생성</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/survey/answer/') > -1}">class="nav_active"</c:if>>
                                        <a href="#">답변 관리</a>
                                        <c:if test="${fn:indexOf(pageContext.request.requestURI , '/survey/answer/') > -1}">
	                                        <ul class="sub_menu_ob">
		                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/survey/answer/list') > -1}">class="nav_active"</c:if>>
		                                            <a href="${pageContext.request.contextPath}/admin/survey/answer/list.do">답변 리스트</a>
		                                        </li>
	                                        </ul>
                                        </c:if>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(pageContext.request.requestURI , '/professor/') > -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/professor/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/freshman_icon.png" alt="회원관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>회원 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/professor/list') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/professor/list.do">교수 리스트</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/professor/insert') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/professor/insert.do">교수 생성</a>
                                        </li>
                                    </ul>
                                </li>
                                <!-- 
                                <li <c:if test="${fn:indexOf(pageContext.request.requestURI , '/file/') > -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/file/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/member_icon.png" alt="회원관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>회원 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, '/member/list') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/file/list.do">파일 리스트</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(pageContext.request.requestURI, 'member/insert') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/file/insert.do">파일 생성</a>
                                        </li>
                                    </ul>
                                </li>
                                -->
                                
                            </ul>
                        </div>
                        <!--관리자 메뉴 end-->

                        <!--서브메뉴 및 배너카드-->
                        <div class="adm_banner_area">
                            <div class="adm_logo">
                                <h2>ADMINISTRATOR</h2>
                            </div>
                            <div class="adm_banner_con">
                                <div class="card_area">
                                    <ul class="card_con">
                                        <li>
                                            <span>관리자 아이디</span>
                                            <span>${sessionScope.UserId }</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="phone_area">
                                    <div class="phone_con">
                                        <div class="phone_icon">
                                            <span><img src="${pageContext.request.contextPath}/resources/img/admin/phone.png" alt="전화기"></span>
                                        </div>
                                        <div class="phone_txt">
                                            <p>이용불편문의</p>
                                            <h2>042.935.5421</h2>
                                        </div>
                                    </div>
                                    <p>E-mail : inct@inct.co.kr</p>
                                </div>
                            </div>
                        </div>
                        <!--서브메뉴 및 배너카드 end-->

                    </div>
                    
                    <ul class="hd_adm_menu">
                        <li class="hd_active">
                            <a href="${pageContext.request.contextPath}/admin/board/list.do">MAIN</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/index.do">HOMEPAGE</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/view/logout.do">LOGOUT</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </div>
    </header>