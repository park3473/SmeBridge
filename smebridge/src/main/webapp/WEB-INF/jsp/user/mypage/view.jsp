<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">

<style>
	#mypage_box{
	
	display: flex;
    justify-content: center;
    text-align: center;
    margin-top: 20%;
	
	}
</style>

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
    <div class="font_noto tit_01 f_wet_01"><span class="f_wet_05">내정보</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
        	<div id="tab03" class="tab-contents_02">
            <div class="container txt_just">
                <div class="row">
                	<div class="col-sm-3 img_top_gab_03">
                        <div class="max_img" id="mypage_box" ><img src="/resources/img/logo.png" alt="이미지" class="b_rad_05"></div>
                    </div>
                    <div class="col-sm-9 cont_tit">
                        <div class="tit_04 font_noto"><span class="cont_blit_01"></span>${model.view.name }</div>
                        <div class="sul_area">
                            <ul class="b_line">
                                <li>아이디 : ${model.view.member_id }</li>
                                <li>전화번호 : ${model.view.phone }</li>
								<li>이메일 : ${model.view.email } @ ${model.view.email_address }</li>
                                <li>주소 : ${model.view.address }   ${model.view.address_detail }</li>
                            </ul>
                        </div>
                        <div class="bnk_gab_20"></div>
                        <!-- 
                        <div class="tit_04 font_noto"><span class="cont_blit_01"></span>주요연구분야</div>
                        <div class="sul_area">
                            <ul class="b_line">
                                <li>중장기적 기술혁신 전략 로드맵(SMB-STAR)과 연계하여 기업수요형 R&amp;D 과제 기획에 대한 전략전 지원</li>
                                <li>4대 과기원 내 연구진화 협력하여 사업 공동 제안서 작성 및 공동 연구 진행</li>
								<li>중장기적 기술혁신 전략 로드맵(SMB-STAR)과 연계하여 기업수요형 R&amp;D 과제 기획에 대한 전략전 지원</li>
                                <li>4대 과기원 내 연구진화 협력하여 사업 공동 제안서 작성 및 공동 연구 진행</li>
								<li>4대 과기원 내 연구진화 협력하여 사업 공동 제안서 작성 및 공동 연구 진행</li>
                            </ul>
                        </div>
                        -->
                    </div>
                </div>
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
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
</script>