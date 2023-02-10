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
	                                <a class="storage" href="javascript:insertClick()">설문 수정</a>
	                                <a class="cancel" href="javascript:history.back()">취소하기</a>
	                            </div>
	                        </div>
                        	<!--저장하기 버튼 end-->
                            
                            <div class="title">
                                <span></span>
                                <span>질문 관리</span>
                            </div>
                            <div class="member_register_wrap">
                            	<c:forEach var="item" items="${model.list }" varStatus="status">
	                                <div class="member_input_wrap">
	                                    <ul class="member_input">
	                                        <li>
	                                        	<span class="list_t">질문 순서</span>
	                                        	<input class="input_mr" type="text" name="" id="question_seq" value="" readonly="readonly" >
	                                        </li>
	                                        <li>
	                                        	<span class="list_t">질문 제목</span>
	                                        	<input class="input_title" type="text" name="" id="question_field_name" value="" readonly="readonly" >
	                                        </li>
	                                        <li>
	                                        	<span class="list_t">질문 설명</span>
	                                        	<input class="input_title" type="text" name="" id="question_coment" value="" readonly="readonly" >
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
						<li>
							<p>순서</p>
							<input type="text" id="insert_question_seq" class="docu_select_size" name="seq" value="">
						</li>
						<li>
							<p>질문 제목</p>
							<input type="text" id="insert_question_field_name" class="docu_select_size" name="field_name" value="">
						</li>
						<li id="question_type">
							<p>질문 타입</p>
							<input type="radio" name="type" id="type_text" value="text">
                            <label for="type_text">텍스트</label>
                            <input type="radio" name="type" id="type_radio" value="radio">
                            <label for="type_radio">라디오</label>
                            <input type="radio" name="type" id="type_checkbox" value="checkbox">
                            <label for="type_checkbox">체크박스</label>
						</li>
						<li>
							<p>질문 설명</p>
							<input type="text" id="insert_question_coment" class="docu_select_size" name="coment" value="">
						</li>
					</ul>
				</form>
			</div>
			<div class="docu_modal_btn">
				<button type="button" class="docu_btn docu_btn_01" onclick="javascript:insert_dcmnt()">저장</button>
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
		
		if($(e)[0].target.value == 'text'){
			
		}else{
			
		}
		
	})
	
	
});


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
	
}

//moadl 닫기
function modalClose(){
	
	$('#insert_modal').css('display','none');
	
	modalsetting();
	
}

//moadl 열기(insert)
function modalInsertOpen(){
	
	modalsetting();
	var SeqNumber = '${model.list.size()}';
	if(SeqNumber == ''){
		SeqNumber = 1;
	}else{
		SeqNumber = parseInt(SeqNumber);
		SeqNumber += 1;
	}
	$('[name=seq]').val(SeqNumber);
	$('#insert_modal').css('display','block')
		
}

//moadl 열기(update)
function modalUpdateOpen(){
	
	modalsetting();
	$('#insert_modal').css('display','block')
	
}


</script>