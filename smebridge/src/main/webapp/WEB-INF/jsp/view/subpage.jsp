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

<!-- 탭 -->
<%@ include file="./include/tab.jsp" %>
<!-- 탭 -->

<!-- content -->

${model.view.content }

<!-- content end -->


<input type="hidden" name="SubPageName" value="${model.view.name }">
<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function() {
	
	var name = $('input[name=SubPageName]').val();
	
	$.ajax({
		url : '/view/subpage/view.do',
		type : 'POST',
		data : ({
			name : name
		}),
		success : function(data , status , xhr){
			
			console.log(data);
			
			console.log(data.BoardList);
			console.log(data.ProfessorList);
			
			//로드맵 게시판 내용 가져오기
			if(data.BoardList.length > 0){
						var BoardDataHtml = `<div id="tab02" class="tab-contents_02">
			                <!-- 주요기술분야 및 특허이전 -->
			                <div class="row">
			                    <div class="col-sm-12">
			                        <!-- 리스트 -->
			                        <table class="table">
			                            <thead>
			                                <tr>
			                                    <th>번호</th>
			                                    <th>제목</th>
			                                    <th>작성자</th>
			                                    <th>작성일</th>
			                                </tr>
			                            </thead>
			                            <tbody>`;
			             
			             for(i=data.BoardList.length-1; i >= 0; i --){
			            	var moment_create_tm = moment(data.BoardList[i].create_tm).format("YYYY-MM-DD");
			            	BoardDataHtml += 	`<tr>
			                    <td class="center">`+(i+1)+`</td>
			                    <td onclick=OpenLoadMap('`+data.BoardList[i].file+`')>`+data.BoardList[i].title+`</td>
			                    <td class="center">`+data.BoardList[i].name+`</td>
			                    <td class="center">`+moment_create_tm+`</td>
			                </tr>` 
			             }
			             
			             BoardDataHtml += `</tbody>
			                 </table>
			                 <!-- 리스트 -->
			                 <div class="bnk_gab_20"></div>
			             </div>
			         </div>
			     </div>`;
			}else{
				var BoardDataHtml = `<div id="tab02" class="tab-contents_02">
	                <!-- 주요기술분야 및 특허이전 -->
	                <div class="row">
	                    <div class="col-sm-12">
	                        <h1>현제 등록된 로드맵이 없습니다.</h1>
	                 <div class="bnk_gab_20"></div>
	             </div>
	         </div>
	     </div>`;
			}
     
     	$('.tabs_02').append(BoardDataHtml);
     	
     	//해당 교수진 프로필 가져오기
     	if(data.ProfessorList.length > 0){
     		var ProfessorHtml = `<div id="tab03" class="tab-contents_02">
                <div class="container txt_just">`;
            for(i = 0; i < data.ProfessorList.length; i++){
            	var researchs = data.ProfessorList[i].research.split('|');
            	ProfessorHtml += `<div class="row">
                    <div class="col-sm-3 img_top_gab_03">
                        <div class="max_img"><img src="/resources/upload/professor/`+data.ProfessorList[i].image+`" alt="이미지" class="b_rad_05"></div>
                    </div>
                    <div class="col-sm-9 cont_tit">
                        <div class="font_noto tit_05">`+data.ProfessorList[i].name+`<span class="tit_02 l_pad_5">`+data.ProfessorList[i].team+`</span><span class="gab">ㅣ</span><span class="tit_02">`+data.ProfessorList[i].type+`</span></div>
                        <div class="sul_cont">
                            `+data.ProfessorList[i].content+`
                        </div>
                        <div class="bnk_gab_20"></div>
                        <div class="tit_04 font_noto"><span class="cont_blit_01"></span>주요연구분야</div>
                        <div class="sul_area">
                            <ul class="b_line">`
                                for(j =0; j < researchs.length; j ++){
                                	
                                ProfessorHtml += `<li>`+researchs[j]+`</li>`	
                                	
                                }
                                ProfessorHtml +=  `</ul>
                        </div>
                    </div>
                </div>
                <div class="line_gab_35"></div>`
            }
           ProfessorHtml += `</div>
        </div>`;
     	}else{
     		var ProfessorHtml = `<div id="tab03" class="tab-contents_02">
                <div class="container txt_just">
                <div class="row">
                    <h1>해당 등록된 교수진이 없습니다.</h1>
                <div class="line_gab_35"></div>
            </div>
        </div>`;
     	}
     	
    
    
    $('.tabs_02').append(ProfessorHtml);
     	
     	
     	//탭 부분 되돌리기
             
     	//탭소스
     	$(function() {
     	var $tabButtonItem = $('#tab-button li'),
     	$tabSelect = $('#tab-select'),
     	$tabContents = $('.tab-contents'),
     	activeClass = 'is-active';

     	$tabButtonItem.first().addClass(activeClass);
     	$tabContents.not(':first').hide();

     	$tabButtonItem.find('a').on('click', function(e) {
     	var target = $(this).attr('href');

     	$tabButtonItem.removeClass(activeClass);
     	$(this).parent().addClass(activeClass);
     	$tabSelect.val(target);
     	$tabContents.hide();
     	$(target).show();
     	e.preventDefault();
     	});

     	$tabSelect.on('change', function() {
     	var target = $(this).val(),
     	targetSelectNum = $(this).prop('selectedIndex');

     	$tabButtonItem.removeClass(activeClass);
     	$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
     	$tabContents.hide();
     	$(target).show();
     	});
     	});

     	//두번째
     	$(function() {
     	var $tabButtonItem = $('#tab-button_02 li'),
     	$tabSelect = $('#tab-select_02'),
     	$tabContents = $('.tab-contents_02'),
     	activeClass = 'is-active';

     	$tabButtonItem.first().addClass(activeClass);
     	$tabContents.not(':first').hide();

     	$tabButtonItem.find('a').on('click', function(e) {
     	var target = $(this).attr('href');

     	$tabButtonItem.removeClass(activeClass);
     	$(this).parent().addClass(activeClass);
     	$tabSelect.val(target);
     	$tabContents.hide();
     	$(target).show();
     	e.preventDefault();
     	});

     	$tabSelect.on('change', function() {
     	var target = $(this).val(),
     	targetSelectNum = $(this).prop('selectedIndex');

     	$tabButtonItem.removeClass(activeClass);
     	$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
     	$tabContents.hide();
     	$(target).show();
     	});
     	});
     
			
		},
		error : function(status , xhr){
			
			console.log('error-404');
			
		}
	})
	
});

function OpenLoadMap(file){
	
	window.open('/resources/upload/loadmap/'+file, "_blank");
	
}

</script>