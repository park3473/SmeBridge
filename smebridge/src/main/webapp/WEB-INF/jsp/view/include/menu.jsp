<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/view/menu.do',
		cache : false,
		success : function(result , status , xhr){
			console.log(result);
		}
	})
</script>

<div id="menu">
	<!-- 메뉴 생성 -->
	<ul>
		<li>
			<a>센터 소개</a>
			<ul>
				<li><a>센터장 인사말</a></li>
				<li><a>비전 및 전략</a></li>
				<li><a>핵심 가치</a></li>
				<li><a>주요 사업</a></li>
				<li><a>조직도</a></li>
				<li><a>오시는 길</a></li>
			</ul>
		</li>
		<li>
			<a>센터 혁신 기술 A - Z</a>
			<ul>
				<li><a>첨단 소재 부품</a></li>
				<li><a>바이오 및 헬스 케어</a></li>
				<li><a>공정장비</a></li>
				<li><a>ICT/SW</a></li>
				<li><a>제조 자동화 및 지능화</a></li>
				<li><a>기계 항공</a></li>
			</ul>
		</li>
		<li>
			<a>로그인</a>
			<ul>
				<li><a>로그인</a></li>
				<li><a>회원 가입</a></li>
				<li><a>ID / PW  찾기</a></li>
			</ul>
		</li>
		<li>
			<a>마이 페이지</a>
			<ul>
				<li><a>마이 페이지</a></li>
				<li><a>회원 정보 수정</a></li>
				<li><a>나의 신청 관리</a></li>
			</ul>
		</li>
		<li>
			<a></a>
			<ul>
				<li><a>신청하기</a></li>
				<li><a>신청서 개요</a></li>
				<li><a>신청하기</a></li>
			</ul>
		</li>
	</ul>
</div>

<!-- 에시 -->
<!-- <div>
	<ul>
		<li>메뉴 1</li>
	</ul>
</div>
 -->