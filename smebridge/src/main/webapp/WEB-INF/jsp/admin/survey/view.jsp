<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--삭제금지-->
<!--공통 헤더 시작-->
<%@ include file="../include/header.jsp" %>

script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script> 
<script language="JavaScript">
	// ckeditor setting
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
	  //CKEDITOR.config.contentsCss = '${pageContext.request.contextPath}/resources/css/startupTemplate.css';

</script>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<!--공통 헤더 끝-->


<div>
	<input type="text" name="idx" readonly="readonly" value="${model.view.idx }">
	<input type="text" name="answer_cnt" readonly="readonly" value="${model.view.answer_cnt }">
	<input type="text" name="title" readonly="readonly" value="${model.view.title }">
	<input type="text" name="type" readonly="readonly" value="${model.view.type }">
	<input type="text" name="member_id" readonly="readonly" value="${model.view.member_id }">
	<input type="text" name="name" readonly="readonly" value="${model.view.name }">
	<input type="text" name="content" readonly="readonly" value="${model.view.content }">
	<input type="text" name="create_tm" readonly="readonly" value="${model.view.create_tm }">
	<input type="text" name="update_tm" readonly="readonly" value="${model.view.update_tm }">
</div>

<div>
	<c:if test="${fn:length(model.question_list) > 0 }">
		<c:forEach items="${model.question_list }" varStatus="status">
			<div>
				<div>
					<input type="hidden" name="question_idx_${status.index +1 }" value=${item.idx } >
					<input type="text" name="question_seq_${status.index +1 }" value="${item.seq }">
					<input type="text" name="question_field_name_${status.index +1 }" value="${item.field_name }">
					<button type="button" name="question_update" class="question_update_btn" onclick="question_update_popup(${item.idx})">질문 수정</button>
					<button type="button" name="question_update" class="question_update_btn" onclick="question_delete(${item.idx})">질문 삭제</button>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<div>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/survey/update.do?idx=${model.view.idx }'">수정하기</button>
		<button type="button" onclick="question_insert_popup(${model.view.idx})">신규 질문 추가하기</button>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/survey/list.do'">목록</button>
	</div>
</div>

<script type="text/javascript">


</script>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">