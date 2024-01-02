<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		// 변수 선언
		let iscorrectId = false;
		let iscorrectName = false;
		let iscorrectEmail = false;
		let isSended = false;
		let isChecked = false;
		
		
		$("#id").blur(function() {
			let member_id = $("#id").val();
			<%-- 아이디 길이, 문자 종류 확인 --%>
			let regId = /^[A-Za-z0-9]{5,20}$/; <%-- 5~20자의 영문(대소문자), 숫자 --%>
			if(!regId.exec(member_id)) {
				$("#checkIdResult").text("5~20자의 영문 대/소문자, 숫자를 입력해주세요").css("color", "red");
				iscorrectId = false;
			} else {
				$("#checkIdResult").text("사용 가능한 아이디입니다").css("color", "blue");
				iscorrectId = true;
			}
		});
		
		<%-- 이름 확인 --%>
		$("#name").on("blur", function() {		
			let regName = /^[가-힣]{2,5}$/; <%-- 한글 2~5글자 --%>
			if(!regName.test($("#name").val())){
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				iscorrectName = false;
			} else if(regName.test($("#name").val())){
				$("#checkNameResult").text("사용 가능한 이름입니다").css("color", "blue");
				iscorrectName = true;
		    }
		});	
		
		$("#member_email").on("blur", function() {
			let member_email = $("#member_email").val();
			let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
			if(!regEmail.exec(member_email)){
				$("#checkEmailResult").text("이메일 주소를 확인해주세요").css("color", "red");
				iscorrectEmail = false;
			} else {
				$("#checkEmailResult").text("사용 가능한 이메일입니다").css("color", "blue");
				iscorrectEmail = true;
			}
		});
		
		// 인증번호 발송 버튼을 클릭했을 때
		$("#sendMail").click(function() {		
			let member_email = $("#member_email").val();
			let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
			if(!regEmail.exec(member_email)){
				$("#checkEmailResult").text("이메일 주소를 확인해주세요").css("color", "red");
			} else {
				$("#checkEmailResult").text("사용 가능한 이메일입니다").css("color", "blue");
// 				alert("인증번호를 발송했습니다. \n인증번호를 확인하고 인증번호확인란에 입력해주세요.");
				// 인증여부를 저장하는 변수 값을 true로 변경
				isSended = true;
				$("#sendMail").val("인증번호재발송");
				
				// 인증번호 발송 요청
				$.ajax({
					url: "authEmail",
					data: {
						member_email : member_email
					},
					success: function(data) {
// 						checkCNum(data);
						$("#authCode").val(data);
					
					},
					error: function(xhr, status, error) {
					      // 요청이 실패한 경우 처리할 로직
					      console.log("AJAX 요청 실패:", error); // 예시: 에러 메시지 출력
					}
				});
			}
		});
		
		$("#checkCode").on("click", function() {
			if(!isSended) {
				$("#checkResult").text("인증번호를 발송해주세요.").css("color", "red");
				$("#member_email").focus();
				isChecked = false;
			} else if($("#cNum").val() == '') {
// 				alert("인증번호를 입력해주세요");
				$("#checkResult").text("인증번호를 입력해주세요.").css("color", "red");
				$("#cNum").focus();
				isChecked = false;
			} else if($("#cNum").val() != $("#authCode").val()) {
// 				alert("인증번호가 일치하지 않습니다.");
				$("#checkResult").text("인증번호가 일치하지 않습니다.").css("color", "red");
				isChecked = false;
			} else {
				$("#checkResult").text("인증번호가 일치합니다.").css("color", "blue");
				isChecked = true;
			}
		});
		
		// 인증번호발송을 누르지 않으면 submit 동작 취소
		$("form").on("submit", function() {
			if(!iscorrectId) { <%-- 아이디가 정규표현식에 적합하지 않을 경우(미입력 포함) --%>
				$("#checkIdResult").text("5~20자의 영문 대/소문자, 숫자를 입력해주세요").css("color", "red");
				$("#id").focus();
			return false; // submit 동작 취소
			} else if(!iscorrectName) {
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				$("#name").focus();
				return false;
			} else if(!iscorrectEmail) {
				$("#checkEmailResult").text("이메일 주소를 확인해주세요").css("color", "red");
				$("#member_email").focus();
				return false; // submit 동작 취소
			} else if(!isSended) {
				$("#checkResult").text("인증번호를 발송해주세요.").css("color", "red");
				$("#member_email").focus();
				return false; // submit 동작 취소
			} else if($("#cNum").val() == '') {
				$("#checkResult").text("인증번호를 입력해주세요.").css("color", "red");
				$("#cNum").focus();
				return false; // submit 동작 취소
			} else if(!isChecked) {
				$("#checkResult").text("인증번호를 확인해주세요.").css("color", "red");
				$("#cNum").focus();
				return false; // submit 동작 취소
			}
			return true;
		});
		
	});
</script>
</head>
<body>
	<div id="wrapper">

		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<jsp:include page="../inc/menu_nav.jsp"></jsp:include>
		<section id="content">
		<h1 id="h01">비밀번호찾기</h1>
		<hr>
		<nav class="login_find">
			<ul>
				<li>
					<a href="idFind">
					<input type="button" value="아이디찾기">
					</a>
				</li>
				<li>
					<a href="pwFind">
					<input type="button" value="비밀번호찾기">
					</a>
				</li>
			</ul>
		</nav>
			<form action="pwFindPro" method="post">
				<div class="login_center">
					<h4>회원가입시 등록한 정보를 입력하세요</h4>
					<div id="findArea">
						<input type="text" placeholder="아이디를 입력하세요" id="id" name="member_id">
						<div id="checkIdResult" class="resultArea"></div>
						<input type="text" placeholder="이름을 입력하세요" id="name" name="member_name">
						<div id="checkNameResult" class="resultArea"></div>
						<input type="text" placeholder="이메일을 입력하세요" name="member_email" id="member_email" class="Certification">
						<input type="button" id="sendMail" value="인증번호발송">
						<div id="checkEmailResult" class="resultArea"></div>
						<input type="text" placeholder="인증번호를 입력하세요" id="cNum" name="cNum" class="Certification">
						<input type="hidden" id="authCode">
						<input type="button" id="checkCode" value="인증번호 확인">
						<div id="checkResult"></div>
						<input type="button" value="돌아가기"><%--로그인 페이지로 돌아가기 --%>
						<input type="submit" value="비밀번호찾기">
					<%--"아이디를 알림창으로 띄운뒤" 로그인 페이지로 돌아가기 --%>
					</div>
				</div>
			</form>
		</section>
		<footer>
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>