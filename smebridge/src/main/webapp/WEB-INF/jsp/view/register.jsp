<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/register.css">

<!--공통 헤더 시작-->
<%@ include file="./include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!-- 상단탭 -->
<div class="sub_all_tit" style="background:url('/resources/img/main_bg_02.jpg') no-repeat center center">

<style>
/* 회원가입 */
.join {width:50%;margin:0 auto}
.join input{width:100%}
.join .wid_01{width:48%}
.join .wid_02{width:74%}
.join .wid_03{width:45.5%}
.join .wid_04{width:74%}
.join .btn_01{width:100%}
.join .btn_02{width:100%}
.join .btn_03{width:25%;margin-left:1%}
.join .select_01{border-radius:5px;border:1px solid #dedede;height:50px;padding:0 15px;width:25%}


@media only screen and (max-width:992px) {
/* 회원가입 */
.join {width:100%}
.join .wid_01{width:74%}
.join .wid_02{width:100%}
.join .wid_03{width:52.5%}
.join .select_01{width:40%}
}

.input-icon {
  position: absolute;
  top: 0;
  left: 18px;
  height: 48px;
  font-size: 24px;
  line-height: 48px;
  text-align: left;
  color: #ffeba7;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
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
    <div class="font_noto tit_01 f_wet_01">회원<span class="f_wet_05">가입</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="join">
            <p><input type="text" name="member_id" placeholder="아이디" class="wid_01"><span><input type="button" value="중복체크" class="btn_03" onclick="IdCheck()"></span></p>
			<p><input type="password" name="password" placeholder="비밀번호" class="wid_02" onmouseover="typeChange('text')" onmouseout="typeChange('password')"></p>
			<p><input type="text" name="name" placeholder="이름" class="wid_02"></p>
			<p><input type="text" name="phone" placeholder="전화번호(-를 제외한 번호만 입력해주세요.)" class="wid_02" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" ></p>
			<p><input type="text" name="email" placeholder="이메일" class="wid_03"> @ 
			    <select class="select_01" name="email_address">
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="google.com">google.com</option>
                </select>
			</p>
			<p><input type="text" name="address" placeholder="주소" class="wid_04"><span><input type="button" onclick="zipCode()" value="주소검색" class="btn_03"></span></p>
			<p><input type="text" name="address_detail" placeholder="상세주소"></p>
			<div class=""><input type="button" value="회원가입" class="btn_02" onclick="register()"></div>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	//중복 아이디 체크
	function IdCheck(){
		
		var member_id = $('input[name=member_id]').val();
		
		console.log(member_id);
		
		$.ajax({
			url : '/view/IdCheck.do',
			type : 'POST',
			data : ({
				member_id : member_id
			}),
			success : function(data , status){
				console.log(data);
				
				if(data == 'false'){
					alert('이미 가입된 아이디 입니다.');
				}else if(data == 'true'){
					alert('가입 가능한 아이디 입니다.');
				}
				
			}
		})
		
	}
	
	//집 주소 검색
	function zipCode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            console.log(data);
	            
	            var full_address = data.address + "(" + data.buildingName + ")";
	            $('input[name=address]').val(full_address);
	        }
	    }).open();
	}
	
	//회원가입
	function register(){
		
		var member_id = $('input[name=member_id]').val();
		var password = $('input[name=password]').val();
		var name = $('input[name=name]').val();
		var phone = $('input[name=phone]').val();
		var email = $('input[name=email]').val();
		var email_address = $('input[name=email_address]').val();
		var address = $('input[name=address]').val();
		var address_detail = $('input[name=address_detail]').val();
		
		if(member_id == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=member_id]').focus();
		}else if(password == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=password]').focus();
		}else if(name == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=name]').focus();
		}else if(email == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=email]').focus();
		}else if(address == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=address]').focus();
		}
		
		$.ajax({
			url : '/view/register.do',
			type : 'POST',
			data : ({
				member_id : member_id,
				password : password,
				name : name,
				phone : phone,
				email : email,
				email_address : email_address,
				address : address,
				address_detail : address_detail,
			}),
			success : function(data , status , xhr){
				console.log('success');
				alert('회원 가입이 완료되었습니다.');
				location.href='/view/login.do';
				
			},
			error : function(xhr , status){
				alert('error'+status);
			}
		})
		
		
	}
	
	function typeChange(type){
		console.log(type);
		$('input[name=password]').prop('type',type);
	}
	
</script>
