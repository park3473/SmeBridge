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



<div class="tit_01 font_noto f_wet_01">기술 혁신을 위한 <span class="f_wet_04">최고의 파트너</span></div> 
</div>
<!-- 상단탭끝 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01">공정<span class="f_wet_05">장비</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container txt_just">
    <div class="row">
        <div class="col-sm-12">
            <div class="tabs_02">
                콘텐츠 넣기
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
	function login(){
		var member_id = $('[name=member_id]').val();
		var password = $('[name=password]').val();
		
		if(member_id == ''){
			alert('아이디를 입력하여주세요.');
			return;
		}else if(password == ''){
			alert('비밀번호를 입력하여주세요.');
			return;
		}else{
			
			$.ajax({
			
				type : 'POST',
				url : '/view/login.do',
				data : ({
					member_id : member_id,
					password : password
				}),
				success : function (data , status , xhr){
					console.log(data);
					
					if(data.indexOf('true') > -1){
						
						console.log(data.indexOf('true'));
						
						alert('로그인 성공');
						location.href='/index.do';
					}else if(data.indexOf('false') > -1){
						
						if(data.indexOf('0') > 0){
						
							console.log(data.indexOf('-1'));
							
							alert('완전불일치');
							
						}else if(data.indexOf('2') > -1){
							
							console.log(data.indexOf('2'));
							
							alert('비밀번호가 틀렸습니다.');
							
						}else if(data.indexOf('3') > -1){
							
							console.log(data.indexOf('3'));
							
							alert('로그인 오류 error - 사이트 관리자에게 문의 부탁드립니다.');
							
						}
						
					}
				},
				error : function (error , status , xhr){
					
				}
				
			})
			
			
		}
	}
</script>
