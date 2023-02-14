<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/menu.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>
</head>

<script language="JavaScript">
//ckeditor setting
var ckeditor_config = {
	allowedContent : true,
	

	resize_enabled : false, // 에디터 크기를 조절하지 않음
	enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
	shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 +  엔터를 <p> 로 적용함.
	toolbarCanCollapse : true,
	removePlugins : "elementspath", // DOM 출력하지 않음                        
	filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditor/file_upload.do', // 파일 업로드를 처리 할 경로 설정.
	height : '500px',
	// 에디터에 사용할 기능들 정의
	toolbar : [
			[  'Source','NewPage', 'Preview' ],
			[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
			[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript',
					'Superscript' ],
			['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
			[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight',
					'JustifyBlock' ], '/',
			['Image','Link','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
			['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize', 'ShowBlocks','-'],
			
			[ 'About' ] ]

};

var editor = null;

jQuery(function() {
	// ckeditor 적용
	editor = CKEDITOR.replace( "content" , ckeditor_config);
});

  CKEDITOR.on('dialogDefinition', function( ev ){
      var dialogName = ev.data.name;
      var dialogDefinition = ev.data.definition;
    
      switch (dialogName) {
          case 'image': //Image Properties dialog
              //dialogDefinition.removeContents('info');
              dialogDefinition.removeContents('Link');
              dialogDefinition.removeContents('advanced');
              break;
      }
  });

</script>

<body>
<!--헤더-->
<%@ include file="../include/header.jsp" %>
<!--헤더 end-->


<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div>
                    <form action="./update.do" method="post" name="updateForm" id="updateForm" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden"  name="idx" value="${model.view.idx}" />
                        <input type="hidden"  name="name" value="${model.view.name}" />
                        <input type="hidden"  name="member_id" value="${model.view.member_id}" />
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>설문 관리</span>
                            </div>
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                        <li>
                                        	<span class="list_t">설문 폼 제목</span>
                                        	<input class="input_title" type="text" name="title" id="title" value="${model.view.title }" >
                                        </li>
                                        <li>
                                            <span class="list_t">설문 여부</span>
                                            <input type="radio" name="type" id="true" value="TRUE" <c:if test="${model.view.type == 'TRUE' }">checked="checked"</c:if> >
                                            <label for="normal">O</label>
                                            <input type="radio" name="type" id="false" value="FALSE" <c:if test="${model.view.type == 'FALSE' }">checked="checked"</c:if> >
                                            <label for="admin">X</label>
                                        </li>
                                        <li>
                                        	<span class="list_t">설문 개요</span>
                                        	<textarea name="content" id="content">${model.view.content}</textarea>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!--저장하기 버튼-->
	                        <div class="register_btn_area">
	                            <div class="register_btn_con">
	                                <a class="storage" href="javascript:updateClick()">설문 수정</a>
	                                <a class="cancel" href="javascript:history.back()">취소하기</a>
	                            </div>
	                        </div>
                        	<!--저장하기 버튼 end-->
                            
                            <div class="title">
                                <span></span>
                                <span>질문 관리</span>
                            </div>
                            <div class="member_register_wrap">
                            	<c:forEach var="item" items="${model.question_list }" varStatus="status">
	                                <div class="member_input_wrap question_input_wrap" id="question_input_${status.index }">
	                                    <ul class="member_input">
	                                    	<input type="hidden" name="question_idx" id="question_idx" value="${item.idx }" />
	                                        <li>
	                                        	<span class="list_t">질문 순서</span>
	                                        	<input class="input_mr" type="text" name="" id="question_seq" value="${item.seq }" readonly="readonly" >
	                                        	<span><button type="button" class="storage" onclick="modalUpdateOpen('${status.index}')" >질문 수정</button></span>
	                                        	<span><button type="button" class="storage" onclick="QuestionDelete(this)" idx="${item.idx }" survey_idx="${item.survey_idx }" >질문 삭제</button></span>
	                                        </li>
	                                        <li>
	                                        	<span class="list_t">질문 제목</span>
	                                        	<input class="input_title" type="text" name="" id="question_field_name" value="${item.field_name }" readonly="readonly" >
	                                        </li>
	                                        <c:if test="${item.type ==  '0'}">
	                                        <li>
	                                        	<span class="list_t">답변 타입</span>
	                                        	<input class="input_title" type="text" name="" id="question_type" value="텍스트" readonly="readonly" >
	                                        </li>
	                                        </c:if>
	                                        <c:if test="${item.type ==  '1'}">
	                                        <li>
	                                        	<span class="list_t">답변 타입</span>
	                                        	<input class="input_title" type="text" name="" id="question_type" value="라디오" readonly="readonly" >
	                                        </li>
	                                        </c:if>
	                                        <c:if test="${item.type ==  '2'}">
	                                        <li>
	                                        	<span class="list_t">답변 타입</span>
	                                        	<input class="input_title" type="text" name="" id="question_type" value="체크박스" readonly="readonly" >
	                                        </li>
	                                        </c:if>
	                                        <c:if test="${item.type != '0' }">
	                                        <li>
	                                        	<span class="list_t">답변 목록</span>
	                                        	<input class="input_title" type="text" name="" id="question_select_list" value="${item.select_list }" readonly="readonly" >	                                        
	                                        </li>
	                                        </c:if>
	                                        <li>
	                                        	<span class="list_t">질문 설명</span>
	                                        	<input class="input_title" type="text" name="" id="question_coment" value="${item.coment }" readonly="readonly" >
	                                        </li>
	                                    </ul>
	                                </div>
                                </c:forEach>
                            </div>
                            
                            <!--질문관리 버튼-->
	                        <div class="register_btn_area">
	                            <div class="register_btn_con">
	                                <a class="storage" onclick="modalInsertOpen()" >질문 추가</a>
	                            </div>
	                        </div>
                        	<!--질문관리 버튼 end-->
                            
                        </div>

                        
                     </form>
                    </div>
                </section>
                <!--본문 내용 end-->
            </div>
        </div>
    </div>
</section>
<!--본문 end-->


<!--질문 modal 시작-->
	<div class="modal_fade" id="insert_modal" style="display:none;">
		<div class="modal_content">
			<div class="modal_docu_box">
				<form  id="dcmnt_insert">
					<ul class="docu_add_box">
						<input type="hidden" name="insert_question_idx" value="" readonly="readonly"/>
						<li>
							<p>순서</p>
							<input type="text" id="insert_question_seq" class="docu_select_size" name="seq" value="" readonly="readonly">
						</li>
						<li>
							<p>질문 제목</p>
							<input type="text" id="insert_question_field_name" class="docu_select_size" name="field_name" value="">
						</li>
						<li id="question_type">
							<p>질문 타입</p>
							<input type="radio" name="type" id="type_text" value="0">
                            <label for="type_text">텍스트</label>
                            <input type="radio" name="type" id="type_radio" value="1">
                            <label for="type_radio">라디오</label>
                            <input type="radio" name="type" id="type_checkbox" value="2">
                            <label for="type_checkbox">체크박스</label>
						</li>
						<li id="select_list" style="display:none">
							<p>질문 내용</p>
							<input type="text" name="select_list" value="" placeholder="ex)첨단소재|ICT|공정장비" disabled="disabled"><br>
							<span style="color : red; font-size: 10px">각 질문 을 | 자로 구분지어서 작성하여주세요.</span>
						</li>
						<li>
							<p>질문 설명</p>
							<input type="text" id="insert_question_coment" class="docu_select_size" name="coment" value="">
						</li>
					</ul>
				</form>
			</div>
			<div class="docu_modal_btn">
				<button type="button" class="docu_btn docu_btn_01" onclick="question_insert()">저장</button>
				<button type="button" class="docu_btn docu_btn_02" id="modal_close" class="modal_close" onclick="modalClose()">취소</button>
			</div>
		</div>
	</div>
<!--질문 modal 끝-->


<!--푸터-->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
<!--푸터 end-->

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/board.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>



</body></html>

<script type="text/javascript">

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(2).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(2).css({
	    backgroundColor: "#fff"
	});
	
	$('#question_type [name=type]').change(function(e){
	
		console.log($(e)[0].target.value);
		
		if($(e)[0].target.value == '0'){
			
			$('#select_list').css('display','none');
			$('[name=select_list]').attr('disabled' , true);
			
		}else{
			
			$('#select_list').css('display','block');
			$('[name=select_list]').attr('disabled' , false);
		}
		
	})
	
	
});


function QuestionDelete(e){
	
	var result = confirm('해당 질문을 삭제하시겠습니까?\n삭제한 질문은 복구가 불가능합니다.');
	if(result == true){
		
	}else{
		return;
	}
	
	console.log($(e).attr('survey_idx'));
	console.log($(e).attr('idx'));
	
	var survey_idx = $(e).attr('survey_idx');
	var idx = $(e).attr('idx');
	
	$.ajax({
	
		url : '/admin/survey/question/delete.do',
		type : 'POST',
		data : ({
			survey_idx : survey_idx,
			idx : idx
		}),
		success : function(data , status , xhr){
			
			console.log('success');
			alert('해당 질문이 삭제되었습니다.');
			location.reload();
			
		},
		error : function(status , xhr){
			
			console.log('error')
			
		}
	
	})
	
	
	
}

function updateClick()
{

	$('#updateForm').submit();
}

//modal 청소
function modalsetting(){
	
	$('[name=seq]').val('');
	$('[name=field_name]').val('');
	$('input:radio[id="type_text"]').prop('checked',true);
	$('[name=coment]').val('');
	$('#select_list').css('display','none');
	$('[name=select_list]').attr('disabled' , true);
	
}

//moadl 닫기
function modalClose(){
	
	$('#insert_modal').css('display','none');
	
	modalsetting();
	
}

//moadl 열기(insert)
function modalInsertOpen(){
	
	var SurveyType = '${model.view.type}';
	if(SurveyType == 'TRUE'){
		alert('진행중인 설문의 질문 추가 및 수정이 불가능합니다.');
		return;
	}
	
	modalsetting();
	var SeqNumber = $('.question_input_wrap').length;
	SeqNumber += 1;
	$('[name=seq]').val(SeqNumber);
	$('#insert_modal').css('display','block')
	
	$('.modal_fade .docu_btn_01').attr('onclick','question_insert("insert")');
		
}

//moadl 열기(update)
function modalUpdateOpen(status){
	
	var SurveyType = '${model.view.type}';
	if(SurveyType == 'TRUE'){
		alert('진행중인 설문의 질문 추가 및 수정이 불가능합니다.');
		return;
	}
	
	modalsetting();
	
	var seq = $('#question_input_'+status+' #question_seq').val();
	var field_name = $('#question_input_'+status+' #question_field_name').val();
	var type = $('#question_input_'+status+' #question_type').val();
	if(type == '텍스트'){
		type = 'text'
	}else if(type == '라디오'){
		type = 'radio'
		$('#select_list').css('display','block');
		$('[name=select_list]').attr('disabled' , false);
	}else if(type == '체크박스'){
		type = 'checkbox'
		$('#select_list').css('display','block');
		$('[name=select_list]').attr('disabled' , false);
	}
	
	var select_list = $('#question_input_'+status+' #question_select_list').val();
	var coment = $('#question_input_'+status+' #question_coment').val();
	var idx = $('#question_input_'+status+' [name=question_idx]').val();
	
	$('[name=seq]').val(seq);
	$('[name=field_name]').val(field_name);
	$('input:radio[id="type_'+type+'"]').prop('checked',true);
	$('[name=select_list]').val(select_list);
	$('[name=coment]').val(coment);
	$('[name=insert_question_idx]').val(idx);
	
	$('#insert_modal').css('display','block');
	
	$('.modal_fade .docu_btn_01').attr('onclick','question_insert("update")');
	
}

//질문 입력
function question_insert(ChangeType){
	
	if(ChangeType == 'insert'){
	
		var survey_idx = '${model.view.idx}';
		var seq = $('[name=seq]').val();
		var field_name = $('[name=field_name]').val();
		var type = $('#question_type [name=type]:checked').val();
		var select_list = '';
		if($('[name=select_list]').attr('disabled') == 'disabled'){
			console.log('no');
		}else{
			console.log('yes');
			
			select_list = $('[name=select_list]').val(); 
			
		}
		var coment = $('[name=coment]').val();
		
		$.ajax({
			url : '/admin/survey/question/insert.do',
			type : 'POST',
			data : ({
				survey_idx : survey_idx,
				seq : seq,
				field_name : field_name,
				type : type,
				select_list : select_list,
				coment : coment
			}),
			success : function(data , status , xhr){
				
				console.log('success');
				
				location.reload();
				
				/*
				$('.member_register_wrap').eq(0).append(		
				`<div class="member_input_wrap">
		                                    <ul class="member_input">
		                                        <li>
		                                        	<span class="list_t">질문 순서</span>
		                                        	<input class="input_mr" type="text" name="" id="question_seq" value="`+seq+`" readonly="readonly" >
		                                        </li>
		                                        <li>
		                                        	<span class="list_t">질문 제목</span>
		                                        	<input class="input_title" type="text" name="" id="question_field_name" value="`+field_name+`" readonly="readonly" >
		                                        </li>
		                                        <li>
		                                        	<span class="list_t">질문 설명</span>
		                                        	<input class="input_title" type="text" name="" id="question_coment" value="`+coment+`" readonly="readonly" >
		                                        </li>
		                                    </ul>
		                                </div>`
				);
				
				modalClose();
				*/
				
			},
			error : function(status , xhr){
				
				console.log('error');
			}
			
			
		})
		
	}else if(ChangeType == 'update'){
		
		var idx = $('[name=insert_question_idx]').val();
		var survey_idx = '${model.view.idx}';
		var seq = $('[name=seq]').val();
		var field_name = $('[name=field_name]').val();
		var type = $('#question_type [name=type]:checked').val();
		var select_list = '';
		if($('[name=select_list]').attr('disabled') == 'disabled'){
			console.log('no');
			
		}else{
			console.log('yes');
			
			select_list = $('[name=select_list]').val(); 
			
		}
		var coment = $('[name=coment]').val();
		
		$.ajax({
			url : '/admin/survey/question/update.do',
			type : 'POST',
			data : ({
				idx : idx,
				survey_idx : survey_idx,
				seq : seq,
				field_name : field_name,
				type : type,
				select_list : select_list,
				coment : coment
			}),
			success : function(data , status , xhr){
				
				console.log('success');
				
				location.reload();
				
				/*
				$('.member_register_wrap').eq(0).append(		
				`<div class="member_input_wrap">
		                                    <ul class="member_input">
		                                        <li>
		                                        	<span class="list_t">질문 순서</span>
		                                        	<input class="input_mr" type="text" name="" id="question_seq" value="`+seq+`" readonly="readonly" >
		                                        </li>
		                                        <li>
		                                        	<span class="list_t">질문 제목</span>
		                                        	<input class="input_title" type="text" name="" id="question_field_name" value="`+field_name+`" readonly="readonly" >
		                                        </li>
		                                        <li>
		                                        	<span class="list_t">질문 설명</span>
		                                        	<input class="input_title" type="text" name="" id="question_coment" value="`+coment+`" readonly="readonly" >
		                                        </li>
		                                    </ul>
		                                </div>`
				);
				
				modalClose();
				*/
				
			},
			error : function(status , xhr){
				
				console.log('error');
			}
			
			
		})
		
	}
	
	
}

</script>