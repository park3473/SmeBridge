<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">

<!--공통 헤더 시작-->
<%@ include file="./include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!-- 탭 -->
<%@ include file="./include/tab.jsp" %>
<!-- 탭 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01">MEMBER <span class="f_wet_05">LOGIN</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
		    <div class="login">
	            <p><input type="text" name="member_id" placeholder="아이디" onkeyup="if(window.event.keyCode==13){login()}"></p>
				<p><input type="password" name="password" placeholder="비밀번호" onmouseover="typeChange('text')" onmouseout="typeChange('password')" onkeyup="if(window.event.keyCode==13){login()}"></p>
				<div class="">
					<a onclick="login()"><span class="btn_01">로그인</span></a>
					<a onclick="location.href='/view/search.do'"><span class="btn_02">아이디 / 비밀번호 찾기</span></a>
				</div>
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
							
						}else if(data.indexOf('4') > -1){
							
							console.log(data.indexOf('4'));
							
							alert('삭제처리된 회원입니다. - 사이트 관리자에게 문의 부탁드립니다.');
							
						}
						
					}
				},
				error : function (error , status , xhr){
					
				}
				
			})
			
			
		}
	}
	
	function typeChange(type){
		console.log(type);
		$('input[name=password]').prop('type',type);
	}
</script>
