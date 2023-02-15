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
                    <form action="./update.do" method="post" name="updateForm" id="updateForm" enctype="multipart/form-data">
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
                                            	<img id="preview_img" alt="교수진 사진" src="/resources/upload/professor/${model.view.image }">
                                            </div>
                                            <input type="file" id="image" name="file" onchange="changeValue(this)"> 
                                        </li>
                                        <li>
                                            <span class="list_t">교수 명</span>
                                            <input class="input_size mr" type="text" name="name" id="name" value="${model.view.name }">
                                        </li>
                                        <li>
                                            <span class="list_t">교수진 이메일</span>
                                            <input class="input_size mr" type="text" name="email" id="email" value="${model.view.email }"> @ 
                                            <select class="input_size mr" id="email_address" name="email_address">
                                            	<option value="" <c:if test="${model.view.email_address == '' }" >selected="selected"</c:if> >이메일을 선택하여주세요.</option>
                                                <option value="naver.com" <c:if test="${model.view.email_address == 'naver.com' }" >selected="selected"</c:if> >naver.com</option>
                                                <option value="google" <c:if test="${model.view.email_address == 'google.com' }" >selected="selected"</c:if> >google.com</option>
                                                <option value="daum.net" <c:if test="${model.view.email_address == 'daum.net' }" >selected="selected"</c:if> >daum.net</option>
                                            </select>
                                        </li>
                                        <li>
                                            <span class="list_t">분야</span>
                                            <select class="input_size mr" type="text" name="field" id="field" value="${model.view.field }">
                                                <option value="첨단소재부품" <c:if test="${model.view.field == '첨단소재부품' }" >selected="selected"</c:if> >첨단소재부품</option>
                                                <option value="공정장비" <c:if test="${model.view.field == '공정장비' }" >selected="selected"</c:if> >공정장비</option>
                                                <option value="바이오및헬스케어" <c:if test="${model.view.field == '바이오및헬스케어' }" >selected="selected"</c:if> >바이오및헬스케어</option>
                                                <option value="ICT/SW" <c:if test="${model.view.field == 'ICT/SW' }" >selected="selected"</c:if> >ICT/SW</option>
                                                <option value="기계항공" <c:if test="${model.view.field == '기계항공' }" >selected="selected"</c:if> >기계항공</option>
                                                <option value="제조자동화및지능화" <c:if test="${model.view.field == '제조자동화및지능화' }" >selected="selected"</c:if> >제조자동화및지능화</option>
                                            </select>
                                        </li>
                                        <li>
                                            <span class="list_t">소속</span>
                                            <input class="input_address mr" type="text" name="team" id="team" value="${model.view.team }" >
                                        </li>
                                        <li>
                                        	<span class="list_t">소개</span>
											<textarea name="content" id="content" >${model.view.content }</textarea>
                                         </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!--저장하기 버튼-->
	                        <div class="register_btn_area">
	                            <div class="register_btn_con">
	                                <a class="storage" href="javascript:updateClick()">정보 수정</a>
	                                <a class="cancel" href="javascript:deleteClick()">교수진 삭제</a>
	                                <a class="storage" href="javascript:history.back()">취소하기</a>
	                            </div>
	                        </div>
	                        <!--저장하기 버튼 end-->
                            
                            <div class="title">
                                <span></span>
                                <span>연구 분야 관리</span>
                            </div>
                            <div class="member_register_wrap">
	                                <div class="member_input_wrap research_input_wrap" id="research_input_${status.index }">
	                                    <ul class="member_input">
	                                    	<c:forEach var="item" items="${model.list }" varStatus="status">
	                                    	<input type="hidden" name="research_idx" value="${item.idx }">
	                                    	<input type="hidden" name="research_pro_idx" value="${item.pro_idx }">
	                                    	<input type="hidden" name="research_seq" value="${item.seq }">
	                                        <li class="research_input_li">
	                                        	<span class="list_t">연구 분야</span>
	                                        	<input class="input_address" type="text" name="research_content" id="question_seq" value="${item.content }" readonly="readonly" >
	                                        	<button type="button" onclick="research_delete('${item.idx}' , '${item.pro_idx}')" >삭제</button>
	                                        </li>
	                                        </c:forEach>
	                                    </ul>
	                                </div>
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


function updateClick(){
	
	if($('[name=image]').val() == ''){
		
		$('[name=image]').attr('disabled',true);
		
	}
	$('form[name=updateForm]').submit();
	
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

//modal 청소
function modalsetting(){
	
	$('[name=insert_research_seq]').val('');
	$('[name=insert_research_content]').val('');
	$('[name=insert_research_pro_idx]').val('');
	
}

//moadl 열기(insert)
function modalInsertOpen(){
	
	modalsetting();

	$('#insert_modal').css('display','block');
	
	var pro_idx = '${model.view.idx}';
	var seq = $('.research_input_li').length + 1;
	
	
	$('[name=insert_research_seq]').val(seq);
	$('[name=insert_research_content]').val('');
	$('[name=insert_research_pro_idx]').val(pro_idx);
	
	
		
}

//moadl 닫기
function modalClose(){
	
	$('#insert_modal').css('display','none');
	
	modalsetting();
	
}


//research_insert
function research_insert(){
	
	var seq = $('[name=insert_research_seq]').val();
	var content = $('[name=insert_research_content]').val();
	var pro_idx = $('[name=insert_research_pro_idx]').val();
	
	if(content == ''){
		alert('연구분야를 작성하여 주세요.');
		return;
	}
	
	$.ajax({
		
		url : '/admin/professor/research/insert.do',
		type : 'POST',
		data : ({
			
			seq : seq,
			content : content,
			pro_idx : pro_idx
			
		}),
		success : function(data , status , xhr){
			
			console.log('success');
			location.reload();
			
		},
		error : function(status , xhr){
			
			console.log('error');
			
		}
		
	});
	
	
}

function research_delete(idx , pro_idx){
	
	var result = confirm('정말 해당 연구분야를 삭제 하시겠습니까?\삭제한 연구분야는 복구가 불가능합니다.');
	if(result == true){
		
		$.ajax({
		
			url : '/admin/professor/research/delete.do',
			type : 'POST',
			data : ({
				idx : idx,
				pro_idx : pro_idx
			}),
			success : function(data , status , xhr){
				
				console.log('success');
				location.reload();
				
			},
			error : function(status , xhr){
				
				console.log('error');
				
			}
			
		})
		
		
	}else{
		
		conosole.log('out');
		
	}
	
}


</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>