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

<!-- 탭 -->
<%@ include file="./include/tab.jsp" %>
<!-- 탭 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01">비밀번호<span class="f_wet_05"> 찾기</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
    <div class="tit_02">비밀번호 변경시 전화번호 뒤 4자리로 변경되며 추후 변경시 관리자에게 문의 부탁드립니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="login">
            <p><input type="text" name="member_id" placeholder="아이디"></p>
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
		var member_id = $('input[name=member_id]').val();
		var name = $('input[name=name]').val();
		var phone = $('input[name=phone]').val();
		
		$.ajax({
			
			type : 'POST',
			url : '/view/pWSearch.do',
			data : ({
				member_id : member_id,
				name : name,
				phone : phone
			}),
			success : function (data , status , xhr){
				console.log(data);
				if(data == 'true'){
					if(confirm('회원 정보가 확인되었습니다.\n해당 회원의 비밀번호를 변경하시겠습니까?\n변경할시 비밀번호가 핸드폰 뒤 4자리로 변경됩니다.')){
						
						location.href='/view/pWChange.do?member_id='+member_id+'&name='+name+'&phone='+phone+'';
					}
					
				}else if(data == 'false'){
					alert('해당 정보로 검색되는 회원이 없습니다.');
				}else if(data == 'error'){
					alert('error 500 오류! 관리자에게 문의 부탁드립니다.');
				}
				
			},
			error : function (error , status , xhr){
				
			}
			
		})
	}
</script>
