<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/header.jsp" %>
</head>

<body>
<!--헤더-->
<%@ include file="../include/menu.jsp" %>
<!--헤더 end-->


<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div>
                    <form action="./insert.do" method="post" name="insertForm" id="insertForm" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden" name="idx" value="${model.view.idx }" />
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>회원 등록</span>
                            </div>
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                    	<li>
                                            <span class="list_t">교수 프로필</span>
                                            <div>
                                            	<img id="preview_img" alt="교수진 사진 미리보기" src="">
                                            </div>
                                            <input type="file" id="image" name="file" onchange="changeValue(this)"> 
                                        </li>
                                        <li>
                                            <span class="list_t">교수 명</span>
                                            <input class="input_size mr" type="text" name="name" id="name" value="">
                                        </li>
                                        <li>
                                            <span class="list_t">교수진 이메일</span>
                                            <input class="input_size mr" type="text" name="email" id="email" value=""> @ 
                                            <select class="input_size mr" id="email_address" name="email_address">
                                            	<option value="" >선택하여주세요.</option>
                                                <option value="naver.com"  >naver.com</option>
                                                <option value="google"  >google.com</option>
                                                <option value="daum.net"  >daum.net</option>
                                            </select>
                                        </li>
                                        <li>
                                            <span class="list_t">분야</span>
                                            <select class="input_size mr" type="text" name="field" id="field" value="">
                                                <option value="첨단소재부품"  >첨단소재부품</option>
                                                <option value="공정장비"  >공정장비</option>
                                                <option value="바이오및헬스케어"  >바이오및헬스케어</option>
                                                <option value="ICT/SW"  >ICT/SW</option>
                                                <option value="기계항공"  >기계항공</option>
                                                <option value="제조자동화및지능화"  >제조자동화및지능화</option>
                                            </select>
                                        </li>
                                        <li>
                                            <span class="list_t">소속</span>
                                            <input class="input_address mr" type="text" name="team" id="team" value="" >
                                        </li>
                                        <li>
                                        	<span class="list_t">소개</span>
											<textarea name="content" id="content" ></textarea>
                                         </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!--저장하기 버튼-->
	                        <div class="register_btn_area">
	                            <div class="register_btn_con">
	                                <a class="storage" href="javascript:insertClick()">정보 등록</a>
	                                <a class="storage" href="javascript:history.back()">취소하기</a>
	                            </div>
	                        </div>
	                        <!--저장하기 버튼 end-->
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
						<input type="hidden" id="insert_research_pro_idx" class="docu_select_size" name="insert_research_pro_idx" value="" readonly="readonly">
						<li>
							<p>순서</p>
							<input type="text" id="insert_research_seq" class="docu_select_size" name="insert_research_seq" value="" readonly="readonly">
						</li>
						<li>
							<p>연구분야</p>
							<input type="text" id="insert_research_content" class="docu_select_size" name="insert_research_content" value="">
						</li>
					</ul>
				</form>
			</div>
			<div class="docu_modal_btn">
				<button type="button" class="docu_btn docu_btn_01" onclick="research_insert()">저장</button>
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

```

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>


</body>

</html>

<script type="text/javascript">

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(3).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(3).css({
	    backgroundColor: "#fff"
	});
});


function insertClick(){
	
	if($('[name=image]').val() == ''){
		
		$('[name=image]').attr('disabled',true);
		
	}
	$('form[name=insertForm]').submit();
	
}

//프로필 사진 미리보기
function preview_img(input){
	const reader = new FileReader();
	reader.onload = e => {
		const previewImage = document.getElementById('preview_img');
		previewImage.src = e.target.result
	}
	
	reader.readAsDataURL(input.files[0]);
	
}

//프로필 사진 등록 함수 이벤트 설정
const inputImage = document.getElementById('image')
inputImage.addEventListener('change' , e => {
	preview_img(e.target);
})


</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>