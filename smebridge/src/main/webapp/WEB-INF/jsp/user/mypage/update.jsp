<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">

<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!-- 탭 -->
<%@ include file="../include/tab.jsp" %>
<!-- 탭 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01">공정<span class="f_wet_05">장비</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="join">
            <p><input type="text" name="member_id" placeholder="아이디" class="wid_01" value="${model.view.member_id }" readonly="readonly"></p>
			<p><input type="text" name="name" placeholder="이름" class="wid_02" value="${model.view.name }"></p>
			<p><input type="text" name="phone" placeholder="전화번호(-를 제외한 번호만 입력해주세요.)" class="wid_02" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${model.view.phone }"></p>
			<p><input type="text" name="email" placeholder="이메일" class="wid_03" value="${model.view.email }"> @ 
			    <select class="select_01" name="email_address">
                    <option value="naver.com" <c:if test="${model.view.email_address == 'naver.com' }" >selected="selected"</c:if> >naver.com</option>
                    <option value="daum.net" <c:if test="${model.view.email_address == 'daum.net' }" >selected="selected"</c:if> >daum.net</option>
                    <option value="google.com" <c:if test="${model.view.email_address == 'google.com' }" >selected="selected"</c:if> >google.com</option>
                </select>
			</p>
			<p><input type="text" name="address" placeholder="주소" class="wid_04" value="${model.view.address }"><span><input type="button" onclick="zipCode()" value="주소검색" class="btn_03"></span></p>
			<p><input type="text" name="address_detail" placeholder="상세주소" value="${model.view.address_detail }"></p>
			<div class=""><input type="button" value="회원수정" class="btn_02" onclick="update()"></div>
			</div>
        </div>
    </div>
</div>
<!-- 콘텐츠끝 -->

</div>
<!-- 서브끝 -->

<!-- content end -->

<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">

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
		var name = $('input[name=name]').val();
		var phone = $('input[name=phone]').val();
		var email = $('input[name=email]').val();
		var email_address = $('input[name=email_address]').val();
		var address = $('input[name=address]').val();
		var address_detail = $('input[name=address_detail]').val();
		
		if(member_id == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=member_id]').focus();
			return;
		}else if(password == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=password]').focus();
			return;
		}else if(name == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=name]').focus();
			return;
		}else if(email == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=email]').focus();
			return;
		}else if(address == ''){
			alert('회원 정보를 모두 입력하여 주세요.');
			$('input[name=address]').focus();
			return;
		}
		
		$.ajax({
			url : '/user/mypage/update.do',
			type : 'POST',
			data : ({
				member_id : member_id,
				name : name,
				phone : phone,
				email : email,
				email_address : email_address,
				address : address,
				address_detail : address_detail,
			}),
			success : function(data , status , xhr){
				console.log('success');
				alert('회원 정보 수정이 완료되었습니다.');
				location.href='/index.do';
				
			},
			error : function(xhr , status){
				alert('error'+status);
			}
		})
		
		
	}

</script>