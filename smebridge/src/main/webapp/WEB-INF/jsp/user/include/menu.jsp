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

<script>
		$.ajax({
			url : '/view/menu.do',
			type : 'POST',
			dataType : 'json',
			success : function(data , status , xhr){
				
				console.log('success : ' + status);
				console.log(data);
				var html = '';
				for(i =0; i < data.list.length; i ++){
					
					
					if(data.list[i].depth == 0){
						if(data.list[i].UNDER_CNT > 0){
							
							html += `<li><a href="#"><span>`+data.list[i].name+`</span></a>`;
							html += `<ul class="depth2">`;
							
							var j_cnt = data.list[i].UNDER_CNT;
							
							console.log(j_cnt);
							for(j=0; j < j_cnt; j++){
								
								
								i += 1;
								if(data.list[i].link == null || data.list[i].link == ''){
								
									html +=`<li><a href="#"><span>`+data.list[i].name+`</span></a></li>`;
									
								}else{
									
									html +=`<li><a href="`+data.list[i].link+`"><span>`+data.list[i].name+`</span></a></li>`;
									
								}
								
							}
							
							html += `</ul>`;
							html += `</li>`;
							
							
						}else{
							
							html += `<li><a href="#"><span>`+data.list[i].name+`</span></a></li>`;
							
						}	
					}else{
								
					}
					
				}
				//메뉴 부분 구성
				console.log(html);
				$('#menu_list').append(html);
				
				//메뉴 부분 navi 설정
				var header = $("#header");
				var windowWidth = $(window).width();

				$(".btn-gnb-open").on("click",function () { // [p] 20190503 수정
					m_gnb_open ();
				});
				$(".btn-gnb-close").on("click",function () { // [p] 20190503 수정
					m_gnb_close ();
				});
				

				// PC GNB 2Depth
				$(".gnb-menu li").on("mouseover", function () {
					depth2_open(this);
				});

				// [p] 20190514 수정
				$(".nav-inner").mouseleave(function () { 
					depth2_close(this);
				});

				// Mobile GNB 2Depth
				$(".gnb-menu li > a").on("click",function () {
					m_depth2_open(this);
				});

				// 언어 선택
				$(".lang-list").children(".lang").on("click",function () {
					$(this).next(".select-lang").toggleClass("hide");
				});

				$(".select-lang").children("li").each(function () {
					$(this).find("a").click(function () {
						var selected = $(this).children("span").html();
						$(this).parent("li").addClass("on").siblings("li").removeClass("on")
						$(this).parent().parent(".select-lang").addClass("hide").siblings(".lang").children("span").html(selected);
					})
				});


				$(window).resize(function () {
					if($(window).width() >= 768 && $("#header").hasClass("m-gnb-open")) {
						m_gnb_close();
					}
					m_mode()

					// [p] 20190509 수정
					if (windowWidth >= 768) {
						$(".nav-inner").on("mouseleave", function () { 
							depth2_close(this);
						});
					}
				});

			// 스크롤
				$(window).on("scroll", function(){
			       goTop();
			       scroll_header (); // 스크롤시 header
			    });
				
			},
			error : function(status , xhr){
				
				console.log('error : ' + status);
				
			}
		})
</script>
