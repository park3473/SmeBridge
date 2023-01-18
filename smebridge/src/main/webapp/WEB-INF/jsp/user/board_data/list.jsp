<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->

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

<div class="container">
<div class="row">
<div class="container in_sub_sort">
<div class="row">
<div class="col">

<ul class="nav gab_06">
<li><a class="nav-link active" href="sub_02a.php">첨단소재부품</a></li>
<li><a class="nav-link" href="sub_02b.php">공정장비</a></li>
<li><a class="nav-link" href="sub_02c.php">바이오 및 헬스케어</a></li>
<li><a class="nav-link" href="sub_02d.php">ICT/SW</a></li>
<li><a class="nav-link" href="sub_02e.php">기계항공</a></li>
<li><a class="nav-link" href="sub_02f.php">제조자동화 및 지능화</a></li>
</ul>

</div>
</div>
</div>
</div>
</div>


<div class="tit_01 font_noto f_wet_01">기술 혁신을 위한 <span class="f_wet_04">최고의 파트너</span></div> 
</div>
<!-- 상단탭끝 -->

<!-- 서브시작 -->
<div class="sub_wrap">

<!-- 타이틀 -->
<div class="sub_tit">
    <div class="font_noto tit_01 f_wet_01">첨단<span class="f_wet_05">소재부품</span></div>
    <div class="tit_02">중소 중견기업의 기술혁신을 항상 응원하고 함께 합니다.</div>
</div>
<!-- 타이트끝 -->

<!-- 콘텐츠 -->
<div class="container txt_just">
    <div class="row">
        <div class="col-sm-12">
            <div class="tabs_02">
                <div class="tab-button-outer_02">
                    <ul id="tab-button_02" class="font_noto">
                        <li><a href="#tab01">핵심보유기술</a></li>
                        <li><a href="#tab02">기술전략로드맵</a></li>
                        <li><a href="#tab03">참여교수진</a></li>
                    </ul>
                </div>
                <div class="tab-select-outer_02">
                    <select id="tab-select_02">
                    <option value="#tab01">핵심보유기술</option>
                    <option value="#tab02">기술전략로드맵</option>
                    <option value="#tab03">참여교수진</option>
                    </select>
                </div>
                <!-- 탭01 -->
                <div id="tab01" class="tab-contents_02">
                    <!-- 주요기술분야 및 특허이전 -->
                    <div class="row">
                        <div class="col-sm-6 cont_tit">
                            <div class="tit_04 font_noto"><span class="cont_blit_01"></span>주요기술분야</div>
                            <div class="sul_area">
                                <ul class="b_line">
                                    <li>고용량 NANO 구현을 위한 식각 기술</li>
                                    <li>차세대 DRAM(DDR5 PMIC)에 들어가는 유전만 소재</li>
                                    <li>배너리 전극 소재 및 고체 전해질</li>
                                </ul>
                            </div>
                            <div class="bnk_gab_20"></div>
                        </div>
                        <div class="col-sm-6 cont_tit">
                            <div class="tit_04 font_noto"><span class="cont_blit_01"></span>특허 및 이전가능 기술</div>
                            <div class="sul_area">
                                <ul class="b_line">
                                    <li>미세 패턴 네에 증착된 리튬의 전착밀도 측정기수</li>
                                </ul>
                            </div>
                            <div class="bnk_gab_20"></div>
                        </div>
                    </div>
                    <!-- 주요기술분야 및 특허이전 끝 -->
                    <!-- 협력대상 중소.중견기업 -->
                    <div class="row">
                        <div class="col-sm-12 cont_tit">
                            <div class="tit_04 font_noto"><span class="cont_blit_01"></span>협력대상 중소.중견기업</div>
                            <div class="kaist">
                                <div class="flexbox align_c">
                                    <div class="item_02 box_04">
                                        <img src="contents/img/sojae_01.png" alt="이미지">
                                        <div class="font_noto tit_03 t_pad_15">DRAM & NAND분야 중소.중견기업</div>
                                    </div>
                                    <div class="item_02 box_04">
                                        <img src="contents/img/sojae_02.png" alt="이미지">
                                        <div class="font_noto tit_03 t_pad_15">배터리 분야 중소.중견기업</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 협력대상 중소.중견기업 끝 -->
                    <!-- 기술개요 -->
                    <div class="row">
                        <div class="col-sm-12 cont_tit">
                            <div class="bnk_gab_20"></div>
                            <div class="tit_04 font_noto"><span class="cont_blit_01"></span>기술개요</div>
                            <div class="font_noto tit_03 t_spa_00">DRAM & NAND</div>
                            Morphotropic Phase Boundary(MPB)를 이용한 Dielectric constant 증대 및 HAR 조건에서의 균일한 박막 제조를 위한 ALD 증착 및 AFM 이용한 특성 평가
                            <div class="pad_5"></div>
                            <div class="font_noto tit_03 t_spa_00">BATTERY</div>
                            유기전해질과 고체전해질을 혼합하는 유무기 하이브리드 유사 고체 전해질 개발
                        </div>
                    </div>
                    <!-- 기술개요끝 -->
                    <!-- 첨단소재 부품 세부설명 -->
                    <div class="row">
                        <div class="col-sm-12 cont_tit">
                            <div class="bnk_gab_20"></div>
                            <div class="tit_04 font_noto"><span class="cont_blit_01"></span>첨단소재 부품 세부설명</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 img_top_gab_02">
                            <div class="max_img"><img src="contents/img/sojae_03.jpg" alt="이미지" class="b_rad_05"></div>
                        </div>
                        <div class="col-sm-9 cont_tit">
                            <div class="font_noto tit_03 t_spa_00">DRAM</div>
                            <div class="pad_5"></div>
                            <div class="sul_area">
                                <p><b>1) 차세대 DRAM에 응용 가능한 고품질의 Epitaxial ferroelectric 기반 유전막 증착기술</b></p>
                                <div class="b_pad_5"><b>2) 유전막 전자기적 성능 평가 및 구조적 분석기술</b></div>
                                <ul class="gab">
                                    <li>초고속 XRD를 이용한 실시간 박막 분석 기술을 활용하여 전기장 인가에 다른 나노미터 크기에서 일어나는 상변화 imaging연구를 수행</li>
                                    <li>Kr:F eximer Laser를 이용한 PLD 박막 증착 기법으로 기판과의 격차가 일치하는 결맞은 박막(epitaxial thin film)제작가능</li>
                                </ul>
                            </div>
                            <div class="t_pad_15 gray_04">조지영 교수 연구팀</div>
                        </div>
                    </div>
                    <div class="line_gab_15"></div>
                    <div class="row">
                        <div class="col-sm-12 cont_tit">
                            <div class="font_noto tit_03 t_spa_00">NAND</div>
                            <div class="pad_5"></div>
                            <div class="sul_area">
                                <p><b>1) 수소 밸생 반응 매커니즘의 이해 및 성능을 예측할 수 있는 디스크립터 개발</b></p>
                                <div class="b_pad_5"><b>2) 인공지능 모델을 통해 타겟 반응에 우수한 가능성을 지닌 물질 후보군 제안</b></div>
                                <ul class="gab">
                                    <li>현재 보유중인 슈퍼 컴퓨터 장비의 제 1원리 계산을 통해 타겟 반응에 응용할 수 있는 다양한 물질의 빅테이터 생산 및 정제 후 기계학습 트레이닝 데이터로 활용</li>
                                    <li>이와 같은 연구력을 바탕으로 차세대 DRAM 및 NAND 대체 메모리 소재로 강유전 물질 후보군을 제시할 것</li>
                                </ul>
                                <div class="b_pad_5 t_pad_20"><b>3) 나노스케일에서 유전막의 유전성 평가 및 분석</b></div>
                                <ul class="gab">
                                    <li>다양한 분석장비 및 기술 보유</li>
                                    <li>Atomic Force Microscopy (AFM)을 기반으로 한 Piezoresponse Force Microscopy(PFM), Electrostatic Force Microscop(EFM), Kelvin Probe Force Microscop(KPFM), Charge Gradient  Microscop(CGM)등</li>
                                    <li>특히 Piezoresponse Force Microscopy(PFM)을 이용한 핵심소재 분석 솔루션 활용을 제공할 계획</li>
                                </ul>
                                <div class="b_pad_5 t_pad_20"><b>4) High Aspect Ratio(HAR) 조건에서의 균일한 박막 제조를 위한 ALD 증착</b></div>
                                <ul class="gab">
                                    <li>보유 중인 조립식ALD를 통해 최적의 증착 조건들을 확인함</li>
                                    <li>결함제어 가능한 균일성 있는 우수한 박막을 만들 수 있는 기술을 보편화함에 목적이 있음</li>
                                </ul>
                            </div>
                            <div class="t_pad_15 gray_04">홍승범 교수 연구팀</div>
                        </div>
                    </div>
                    <div class="line_gab_15"></div>
                    <div class="row">
                        <div class="col-sm-3 img_top_gab_02">
                            <div class="max_img"><img src="contents/img/sojae_04.jpg" alt="이미지" class="b_rad_05"></div>
                        </div>
                        <div class="col-sm-9 cont_tit">
                            <div class="font_noto tit_03">이차전지 핵심소재 합성 기술</div>
                            <div class="pad_5"></div>
                            <div class="sul_area">
                                <p><b>1) 수열합성을 통한 양극재 합성과 다양한 코팅 및 도핑 방법을 통해 양극재의 사이클 안정성을 향상하는 기술</b></p>
                                <div class="b_pad_5"><b>2) 간단하고 대량생산에 적합한 Solution based 코팅 공정</b></div>
                                <ul class="gab">
                                    <li>autoclave를 사용하는 수열합성을 통해 다양한 조성의 Lithium Nickel Cobalt Mangsnese Oxide(NCM)합성</li>
                                    <li>NCM뿐만 아니라 Cobalt를 제외한 Lithium Nickel Oxide(LNO) 또는  Lithium Nickel Cobalt Mangsnese Oxide(LNMO)를 합성 할 수 있는 기술 보유</li>
                                </ul>
                            </div>
                            <div class="t_pad_15 gray_04">조은애 교수 연구팀</div>
                        </div>
                    </div>
                    <div class="line_gab_15"></div>
                    <div class="row">
                        <div class="col-sm-12 cont_tit">
                            <div class="font_noto tit_03 t_spa_00">이차전지 소재 분석기술</div>
                            <div class="pad_5"></div>
                            <div class="sul_area">
                                <p><b>1) 전해질 성분 및 첨가제의 물리화학적 특성(이온전도도, 양이온 수율, 해리도 등)분석</b></p>
                                <p><b>2) 전극 및 전지 설계에 따른 최적 전해질 및 첨가제 선정 및 전기화학적 특성 분석</b></p>
                                <div class="b_pad_5"><b>3) 전해질 및 첨가제의 난연성 강화 특성 분석</b></div>
                                <ul class="gab">
                                    <li>기능성 첨가제에 대한 연구를 통해 전지 전체 성능 향상을 꾀하거나 난연성 고출력 특성 향상 등의 안정성 향상에 대한 연구 다수 수행</li>
                                    <li>Multi Potentiostat / Galvanostats with EIS System을 통한 다양한 조성의 전해질에 대한 전기 화학적 분석이 가능</li>
                                    <li>전해질이 포함된 전지 제작 및 성능 분석을 위한 장비 보유</li>
                                </ul>
                                <div class="t_pad_15 b_pad_20 gray_04">이용민 교수 연구팀</div>
                                <P><b>4) in-situ electrochemical AFM(EC-AFM)으로 전해질 조건에 따른 셀 내 안정성 및 이온 전도도 실시간 평가 및 분석</b></P>
                                <div class="b_pad_5 t_pad_20_"><b>5) Multi Potentiostat / Galvanostats with EIS System을 통한 다양한 조성의 전해질에 대한 전기화학적 분석</b></div>
                                <ul class="gab">
                                    <li>Atomic Force Microscopy (AFM)을 기반으로 한 다양한 분석 방비 및 기술을 보유중</li>
                                    <li>특히 in-situ EC-AFM을 이용한 실시간 배터리 셀 분석 이미징 솔루션을 활용해 기술을 제공할 계획</li>
                                </ul>
                            </div>
                            <div class="t_pad_15 gray_04">홍승범 교수 연구팀</div>
                        </div>
                    </div>
                    <!-- 첨단소재 부품 세부설명 끝 -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 콘텐츠끝 -->

</div>
<!-- 서브끝 -->

<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">