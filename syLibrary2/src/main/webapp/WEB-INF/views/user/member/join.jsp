<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" href="/resources/images/icon.png" type="image/x-icon">
<link rel="stylesheet" href="/resources/static/user.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link
	rel="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/static/assets/lineicons.css" />
<link rel="stylesheet"
	href="/resources/static/assets/materialdesignicons.min.css" />

<script>
	//아이디 중복체크
	function checkId() {
		var mId = $("#mId").val();
		$.ajax({
			url : "id_check.do",
			type : "post",
			data : {
				mId : mId
			},
			success : function(result) {
				if (result == 1) {
					$("#checkId").html('이미 사용중인 아이디입니다.');
					$("#checkId").attr('color', 'red');
				} else {
					$("#checkId").html('사용할 수 있는 아이디입니다.');
					$("#checkId").attr('color', 'blue');
				}
			},
			error : function() {
				myAlert("warning", "에러발생");
			}
		})
	}
	//널값 체크
	$(function() {
		$(".btnJoin").click(function() {
			let mName = $("#mName").val();
			let mId = $("#mId").val();
			let mPasswd = $("#mPasswd").val();
			let mTel = $("#mTel").val();
			let mBirthDate = $("#mBirthDate").val();
			let mEmail = $("#mEmail").val();
			let mAddress = $("#mAddress").val();

			if (mName == "") {
				myAlert("warning", "이름을 입력하세요!");
				$("#mName").focus();
				return false;
			}
			if (mId == "") {
				myAlert("warning", "아이디를 입력하세요!");
				$("#mId").focus();
				return false;
			}
			if (mPasswd == "") {
				myAlert("warning", "비밀번호를 입력하세요!");
				$("#mPasswd").focus();
				return false;
			}
			if (mTel == "") {
				myAlert("warning", "전화번호를 입력하세요!");
				$("#mTel").focus();
				return false;
			}
			if (mBirthDate == "") {
				myAlert("warning", "생년월일을 선택해주세요!");
				return false;
			}
			if (mEmail == "") {
				myAlert("warning", "이메일을 입력하세요!");
				$("#mEmail").focus();
				return false;
			}
			if (mAddress == "") {
				myAlert("warning", "주소를 입력하세요!");
				$("#mAddress").focus();
				return false;
			}
		});
	});

	//myAlert 커스텀
	function myAlert(icon, title, msg) {
		Swal.fire({
			icon : "warning",
			title : title,
			text : msg,
			confirmButtonColor : "#FEC5BB",
			confirmButtonText : "OK"
		});
	}

	//전화번호 자동 하이픈 생성
	function oninputPhone(mTel) {
		mTel.value = mTel.value.replace(/[^0-9]/g, '')
				.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{4})([0-9]{4})/g,
						"$1-$2-$3");
	}

	//주소검색
	function goP() {
		var pop = window.open("../../jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(zipNo, roadFullAddr, roadAddrPart1, roadAddrPart2,
			mDetailAddress) {
		document.form1.mZipNo.value = zipNo; //상세 주소
		document.form1.mAddress.value = roadAddrPart1 + roadAddrPart2; //도로명 주소
		document.form1.mDetailAddress.value = mDetailAddress; //상세 주소 
	}
	//이미지 화면출력
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('url').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('url').src = "";
		}
	}
</script>

<style type="text/css">
/* alert 커스텀 */
.swal2-confirm {
	background-color: #FEC5BB !important;
	border: 1px solid #FEC5BB !important;
	box-shadow: none !important;
	outline: none !important;
	height: 44px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<form method="post" action="/user/member/join.do" name="form1"
		enctype="multipart/form-data">
		<div class="container">
			<h3 class="text-bold">
				<img src="/resources/images/myLibrary/mem.png" width="50px"
					height="40px"> 회원가입
			</h3>
			<hr>
			<div class="container">
				<div class="card-style mb-30" style="border-radius: 40px">
					<div class="row">
						<div class="col-4"
							style="background-color: #ededed; border-radius: 40px;">
							<div style="text-align: -webkit-center;">
								<div>
									<br> <img id="url"
										src="../../resources/images/member/image_no.png" style="margin-top: 50px; margin-bottom: 20px;">
									<input type="file" id="mImg" name="mImg"
										onchange="readURL(this);" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-8"
							style="background-color: white; border-radius: 20px; padding: 30px 50px 30px 50px;">
							<div class="input-style-1">
								<label>이름</label><input id="mName" type="text" name="mName"
									class="form-control" placeholder="이름">
							</div>
							<div class="input-style-1">
								<label>아이디</label> <input type="text" class="form-control"
									id="mId" name="mId" oninput="checkId()" placeholder="아이디 입력">
								<font id="checkId" size="2"></font>
							</div>
							<div class="input-style-1">
								<label>비밀번호</label> <input type="password" name="mPasswd"
									id="mPasswd" class="form-control" placeholder="비밀번호 입력"
									autoComplete="on" />
							</div>
							<div class="input-style-1">
								<label>전화번호</label> <input type="text" name="mTel" id="mTel"
									class="form-control" oninput="oninputPhone(this)"
									placeholder="전화번호  '-' 빼고 입력" maxlength="13">
							</div>
							<div class="input-style-1">
								<label>생년월일</label> <input type="date" id="mBirthDate"
									max="2030-12-30" min="1880-07-07" placeholder="생년월일"
									name="mBirthDate" class="form-control">
							</div>
							<div class="input-style-1">
								<label>이메일</label> <input type="email" id="mEmail" name="mEmail"
									class="form-control" placeholder="이메일  '@' 포함하고 기입" required>
							</div>
							<div class="input-style-1">
								<label>우편번호 <input type="button" id="main-btn"
									onclick="goP();" value="주소 검색"
									style="width: auto; height: 20px; margin-left: 10px; text-align: center; line-height: 2px;">
								</label> <input type="text" id=zipNo name="mZipNo" placeholder="우편번호"
									value="${dto.m_zip_no}">
							</div>
							<div class="input-style-1">
								<input type="text" id=mAddress name="mAddress"
									value="${dto.m_address}" placeholder="주소 입력"
									class="form-control">
							</div>
							<div class="input-style-1">
								<input type="text" id="mDetailAddress" name="mDetailAddress"
									value="${dto.m_detail_address}" placeholder="상세 주소"
									class="form-control">
							</div>
							<div style="text-align: center;">
								<input type="submit" value=" 회원가입" id="main-btn" class="btnJoin">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>