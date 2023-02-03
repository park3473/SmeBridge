<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/professor.css">

<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!-- 상단탭 -->
<div class="sub_all_tit" style="background:url('/resources/img/main_bg_02.jpg') no-repeat center center">

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
<div class="container">
    <div class="row">
        <div class="col-sm-12">
        	<div id="tab03" class="tab-contents_02">
            <div class="container txt_just">
                <div class="row">
                    <div class="col-sm-3 img_top_gab_03">
                        <div class="max_img"><img src="/resources/img/no_image.jpg" alt="이미지" class="b_rad_05"></div>
                    </div>
                    <div class="col-sm-9 cont_tit">
                        <div class="font_noto tit_05">홍승범 <span class="tit_02 l_pad_5">KAIST 신소재공학과 교수</span><span class="gab">ㅣ</span><span class="tit_02">책임교수</span><span class="tit_02 l_pad_5">(첨단소재부품 분과장)</span></div>
                        <div class="sul_cont">
                            본 중소기업R&D공유센터는 과학기술정보통신부 지원으로 카이스트(KAIST), 광주과학기술원(GIST), 대구경북과학기술원(DGIST), 울산과학기술원(UNIST)이 협력하여 교수 연구실에서 보유한 전문인력, 기술 및 지식, 장비를 활용하여 기술혁신형 중소/중견기업과 벤처기업의 중장기 전략기술의 발굴, 개발, 실용화를 지원하기 위해 2021년 4월에 설립되었습니다.
                        </div>
                        <div class="bnk_gab_20"></div>
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
                    </div>
                </div>
                <div class="line_gab_35"></div>
				<div class="row">
                    <div class="col-sm-3 img_top_gab_03">
                        <div class="max_img"><img src="/resources/img/no_image.jpg" alt="이미지" class="b_rad_05"></div>
                    </div>
                    <div class="col-sm-9 cont_tit">
                        <div class="font_noto tit_05">홍승범 <span class="tit_02 l_pad_5">KAIST 신소재공학과 교수</span></div>
                        <div class="sul_cont">
                            본 중소기업R&D공유센터는 과학기술정보통신부 지원으로 카이스트(KAIST), 광주과학기술원(GIST), 대구경북과학기술원(DGIST), 울산과학기술원(UNIST)이 협력하여 교수 연구실에서 보유한 전문인력, 기술 및 지식, 장비를 활용하여 기술혁신형 중소/중견기업과 벤처기업의 중장기 전략기술의 발굴, 개발, 실용화를 지원하기 위해 2021년 4월에 설립되었습니다.
                        </div>
                        <div class="bnk_gab_20"></div>
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
                    </div>
                </div>
                <div class="line_gab_35"></div>
				<div class="row">
                    <div class="col-sm-3 img_top_gab_03">
                        <div class="max_img"><img src="/resources/img/no_image.jpg" alt="이미지" class="b_rad_05"></div>
                    </div>
                    <div class="col-sm-9 cont_tit">
                        <div class="font_noto tit_05">홍승범 <span class="tit_02 l_pad_5">KAIST 신소재공학과 교수</span></div>
                        <div class="sul_cont">
                            본 중소기업R&D공유센터는 과학기술정보통신부 지원으로 카이스트(KAIST), 광주과학기술원(GIST), 대구경북과학기술원(DGIST), 울산과학기술원(UNIST)이 협력하여 교수 연구실에서 보유한 전문인력, 기술 및 지식, 장비를 활용하여 기술혁신형 중소/중견기업과 벤처기업의 중장기 전략기술의 발굴, 개발, 실용화를 지원하기 위해 2021년 4월에 설립되었습니다.
                        </div>
                        <div class="bnk_gab_20"></div>
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
                    </div>
                </div>
                <div class="line_gab_35"></div>
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