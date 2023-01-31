<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/search.css">

<!--공통 헤더 시작-->
<%@ include file="./include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!-- 상단탭 -->
<div class="sub_all_tit" style="background:url('/resources/img/main_bg_02.jpg') no-repeat center center">

<style>
/* 로그인 */
.login {width:30%;margin:0 auto}
.login input{width:100%}
.login .btn_01{width:100%}
.login .btn_02{width:100%}

@media only screen and (max-width:992px) {
.login {width:100%}
}

</style>

<%@ include file="./include/tab.jsp" %>

<div class="tit_01 font_noto f_wet_01">기술 혁신을 위한 <span class="f_wet_04">최고의 파트너</span></div> 
</div>
<!-- 상단탭끝 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01">아이디<span class="f_wet_05"> 찾기</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="login">
            <p><input type="text" name="name" placeholder="이름"></p>
			<p><input type="text" name="phone" placeholder="전화번호(-를 제외한 번호만 입력해주세요.)" class="wid_02" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" ></p>
			<div class=""><a onclick="IdSearch()"><span class="btn_02">아이디찾기</span></a></div>
			</div>
        </div>
    </div>
</div>
<!-- 콘텐츠끝 -->

</div>
<!-- 서브끝 -->

<!-- content end -->

<!--공통하단-->
<%@ include file="./include/footer.jsp" %>

<script type="text/javascript">
	function IdSearch(){
		var name = $('[name=name]').val();
		var phone = $('[name=phone]').val();
		
		$.ajax({
			
			type : 'POST',
			url : '/view/IdSearch.do',
			data : ({
				name : name,
				phone : phone
			}),
			success : function (data , status , xhr){
				console.log(data);
				if(data == ''){
					alert('해당 정보로 가입된 아이디는 없습니다.')
				}else{
					alert('찾으신 아이디는'+data+'입니다.');	
				}
				
			},
			error : function (error , status , xhr){
				
			}
			
		})
	}
</script>
