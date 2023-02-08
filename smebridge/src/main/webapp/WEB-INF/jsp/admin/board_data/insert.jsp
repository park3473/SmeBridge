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
// ckeditor setting
var ckeditor_config = {
allowedContent : true,

```
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
	editor = CKEDITOR.replace( "CONTENT" , ckeditor_config);
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

```

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
                    <form action="./insert.do" method="post" name="insertForm" id="insertForm" >
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>게시판관리</span>
                            </div>
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                        <li>
                                            <span class="list_t">게시판 등급</span>
                                            <input type="radio" name="level" id="normal" value="1" checked >
                                            <label for="normal">일반</label>
                                            <input type="radio" name="level" id="notice" value="2">
                                            <label for="notice">공지</label>
                                            <input type="radio" name="level" id="admin" value="3">
                                            <label for="admin">관리자</label>
                                        </li>
                                        <li>
                                            <span class="list_t">게시판 명</span>
                                            <input class="input_size mr" type="text" name="name" id="name">
                                        </li>
                                        <li>
                                            <span class="list_t">댓글 여부</span>
                                            <input type="radio" name="reply" id="reply" value="TRUE" checked>
                                            <label>유</label>
                                            <input type="radio" name="reply" id="reply" value="FALSE">
                                            <label>무</label>
                                        </li>
                                        <li>
                                            <span class="list_t">썸네일 여부</span>
                                            <input type="radio" name="type" id="type" value="0" checked>
                                            <label>일반</label>
                                            <input type="radio" name="type" id="type" value="1" >
                                            <label>썸네일</label>
                                        </li>
                                        <li>
                                            <span class="list_t">파일 여부</span>
                                            <input type="radio" name="file" id="file" value="TRUE" checked>
                                            <label>유</label>
                                            <input type="radio" name="file" id="file" value="FALSE">
                                            <label>무</label>
                                        </li>
                                        <li>
                                            <span class="list_t">파일 갯수</span>
                                            <select class="input_size mr" id="file_cnt" name="file_cnt">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                            <span class="relate_c">파일 갯수를 선택해주세요.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!--저장하기 버튼-->
                        <div class="register_btn_area">
                            <div class="register_btn_con">
                                <a class="storage" href="javascript:insertClick()">게시판 생성</a>
                                <a class="cancel" href="javascript:history.back()">취소하기</a>
                            </div>
                        </div>
                        <!--저장하기 버튼 end-->
                        </form>
                    </div>
                </section>
                <!--본문 내용 end-->
            </div>
        </div>
    </div>
</section>
<!--본문 end-->

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
$(document).ready(function()
{
//		 $("input:radio[name=TYPE]").click(function(){
//		        if($("input[name=TYPE]:checked").val() == "1"){
//		        	location.href='./insert.do?TYPE=1';
//		        }else if($("input[name=TYPE]:checked").val() == "2"){
//		        	location.href='./insert.do?TYPE=2';					
//		        }
//		        $("input[name=radio]:checked")
//		    });
});

```
function insertClick()
{

	if($('#TITLE').val() == '')
	{
		alert('제목을 입력 하여 주세요');
		return;
	}

	if( !($('#file2')[0].files[0] == "" || $('#file2')[0].files[0] == null
			|| $('#file2')[0].files[0] == undefined
			|| ( $('#file2')[0].files[0] != null && typeof value == "object"
					&& !Object.keys($('#file2')[0].files[0]).length ) ))
	{

		$('#IMAGE').val($('#file2')[0].files[0].name);

	}else
	{
		console.log('파일없음');
	}

	$('#updateform').submit();
}

```

</script>