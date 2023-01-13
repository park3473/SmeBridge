<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--공통 헤더 시작-->
<%@ include file="./include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- content -->

<!--메인이미지-->
<div id="carousel11_indicator" class="carousel slide carousel-fade" data-ride="carousel" data-interval="50000">
    <ol class="carousel-indicators">
        <li data-target="#carousel11_indicator" data-slide-to="0" class="active"></li>
        <li data-target="#carousel11_indicator" data-slide-to="1"></li>
        <li data-target="#carousel11_indicator" data-slide-to="2"></li>
    </ol>
    <div class="carousel-caption">
        <div style="border:5px rgba(255,255,255,.5) solid;height:50px;width:320px;border-bottom:none;left:360px;top:-20px" class="pos_a c_hide"></div>
        <div style="border:5px rgba(255,255,255,.5) solid;height:50px;width:320px;border-top:none;left:360px;top:200px" class="pos_a c_hide"></div>
        <div style="border:1px rgba(255,255,255,.5) solid;padding:5px 20px;left:0px;top:200px" class="pos_a c_hide">자세히보기 →</div>
        <div class="font_noto f_wet_01 gray_00">
            <div class="txt_32">중소.중견기업</div>
            <div class="txt_64">기술 혁신을 위한 <span class="f_wet_05">최고의 파트너 !</span></div>
            <div class="txt_32 t_pad_15 c_hide">중소기업 R&D 공유센터는 중소 중견기업의 기술혁신을 항상 응원하고 함께합니다.</div>
        </div>
    </div>
    <div class="carousel-inner">
        <div class="pattern-overlay_wrap"></div>
        <div class="carousel-item active">
            <video autoplay loop muted playsinline class="movie">
            <source src="http://big3ad.com/theme/gcc/contents/video/kaist_rnd.mp4" type="video/mp4">
            </video>
        </div>
        <div class="carousel-item"><img src="${pageContextPath.request.contextPath}/resources/img/main_bg_01.jpg" class="ani"></div>
        <div class="carousel-item"><img src="${pageContextPath.request.contextPath}/resources/img/main_bg_02.jpg" class="ani"></div>
    </div>
    <a class="carousel-control-prev" href="#carousel11_indicator" role="button" data-slide="prev"><i class="la la-angle-left" aria-hidden="true"></i></a>
    <a class="carousel-control-next" href="#carousel11_indicator" role="button" data-slide="next"><i class="la la-angle-right" aria-hidden="true"></i></a>
</div>
<!--메인이미지-->

<!-- 센터혁신기술 -->
<div class="main_wrap_02 main_gab_01">
    <div class="main_tit gray_00">
        <div class="font_noto tit_01 f_wet_01">센터<span class="f_wet_05">혁신</span>기술</div>
        <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
    </div>
    <div class="container">
        <div class="row">
		    <!-- 탭 -->
            <div class="col-sm-9">
			    <!-- 게시물 -->
                <div class="tabs">
                    <div class="tab-button-outer txt_16">
                        <ul id="tab-button">
                            <li><a href="#tab01">공지사항</a></li>
                            <li><a href="#tab02">기술이전문의</a></li>
                            <li><a href="#tab03">자료실</a></li>
                        </ul>
                    </div>
                    <div class="tab-select-outer">
                        <select id="tab-select">
                        <option value="#tab01">공지사항</option>
                        <option value="#tab02">기술이전문의</option>
                        <option value="#tab03">자료실</option>
                        </select>
                    </div>
                </div>
                <div id="tab01" class="tab-contents">
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                </div>
                <div id="tab02" class="tab-contents">
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                </div>
                <div id="tab03" class="tab-contents">
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                    <div class="list">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다. <span class="date">01-10</span></div>
                </div>
				<!-- 게시물끝 -->
				<!-- 배너 -->
				<div class="kaist font_noto f_wet_03">
                <div class="flexbox align_c gray_10">
                    <div class="item box_01 pointer" onclick="location.href='./'">
                        <i class="las la-user-tie"></i>
                        <div>4대과기원 기술전문가매칭</div>
                    </div>
                    <div class="item box_02 pointer" onclick="location.href='./'">
                        <i class="las la-flask"></i>
                        <div>공동R&D프로포서 작성</div>
                    </div>
                    <div class="item box_03 pointer" onclick="location.href='./'">
                        <i class="las la-pen-nib"></i>
                        <div>기술애로사항 진단 및 자문신청</div>
                    </div>
					<div class="item box_04 pointer" onclick="location.href='./'">
                        <i class="las la-hands-helping"></i>
                        <div>기술이전신청</div>
                    </div>
                </div>
            </div>
			<!-- 배너끝 -->
            </div>
            <!--탭끝-->
            <div class="col-sm-3">
              <div id="owl_03" class="owl-carousel owl-theme">
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/tech_img_01.png">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/tech_img_01.png">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/tech_img_01.png">
                    </div>
                </div>
            </div>
		</div>
    </div>
</div>
<!-- 센턴혁신기술끝 -->

<!-- 관계사 -->
<div class="main_gab_02">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="owl_02" class="owl-carousel owl-theme">
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/quick_01.jpg">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/quick_02.jpg">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/quick_03.jpg">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/quick_04.jpg">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/quick_05.jpg">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/quick_06.jpg">
                    </div>
                    <div class="item pointer" onclick="location.href='#'">
                        <img src="${pageContextPath.request.contextPath}/resources/img/quick_07.jpg">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 관계사 -->

<!-- content end -->

<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<script type="text/javascript">