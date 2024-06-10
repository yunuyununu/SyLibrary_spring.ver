<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/static/js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
/* function list(page) {
	location.href="/admin/memo/list.do?curPage=" + page;
} */
$(function() {
	$("#ca").click(function() {
		const modal = document.getElementById("modal");
		modal.style.display = "none";
	});
	$("#btnUpdate").click(function() {
		let me_memo = $("#message").val();
		let me_rownum = $("#rownum").val();
		let me_a_id = $("#me_a_id").val();
		$.ajax({
			type : "post",
			url : "/admin/memo/update.do",
			data : {
				"me_memo" : me_memo,
				"me_rownum" : me_rownum,
				"me_a_id" : me_a_id
			},
			success : function() {
				swal('수정되었습니다');
				const modal = document.getElementById("modal");
				modal.style.display = "none";
				location.href = "/admin/admin_login/main";
			}
		});
	});

});
function memo_del(me_rownum) {
	swal({
        text: "정말 삭제하시겠습니까?",
        buttons: ["취소", "확인"],
    }).then(function(isConfirmed) {
        if (isConfirmed) {
        	location.href = "/admin/memo/delete.do?me_rownum=" + me_rownum;
        } 
    });
}
/* function memo_del(me_rownum) {
	swal({
        text: "정말 삭제하시겠습니까?",
        buttons: ["취소", "확인"],
	}).then(function(isConfirmed) {
		if (isConfirmed) {
			$.ajax({
				url : "/admin/memo/delete.do",
				type : "post",
				data : {
					"me_rownum" : me_rownum
				},
				success : function(data) {
					location.reload();
				}
			});
			document.form1.submit();
		}
		
	})
} */
function modal() {
	const modal = document.getElementById("modal")
	modal.style.display = "Flex"
}
function modal2() {
	const modal2 = document.getElementById("modal2")
	modal2.style.display = "Flex"
}
//모달 바깥쪽 누르면 화면창 꺼짐
$(document).mouseup(function (e){
	var LayerPopup = $("#modal-window");
	if(LayerPopup.has(e.target).length === 0){
		const modal = document.getElementById("modal");
		const modal2 = document.getElementById("modal2");
		modal.style.display = "none";
		modal2.style.display = "none";
	}
});
//수정모달
function onModal(me_rownum) {
	//const a_name = "${dto.a_name}";
	//const me_post_date = "${dto.me_post_date}";
	//const me_memo = "${dto.me_memo}";
	//const me_rownum = "${dto.me_rownum}";
	$.ajax({
		type : "post",
		url : "/admin/memo/search.do",
		data : {
			"me_rownum" : me_rownum,
		},
		dataType : "json",
		success : function(data) {
			console.log(data);
			modal();
			document.getElementById("writer").value=data.a_name;
			document.getElementById("date").value=data.me_post_date;
			document.getElementById("message").value=data.me_memo;
			document.getElementById("rownum").value=data.me_rownum;
		}
	});
}
//상세모달
function onModal2(me_rownum) {
	//const a_name = "${dto.a_name}";
	//const me_post_date = "${dto.me_post_date}";
	//const me_memo = "${dto.me_memo}";
	//const me_rownum = "${dto.me_rownum}";
	$.ajax({
		type : "post",
		url : "/admin/memo/search.do",
		data : {
			"me_rownum" : me_rownum,
		},
		dataType : "json",
		success : function(data) {
			console.log(data);
			modal2();
			document.getElementById("writer2").value=data.a_name;
			document.getElementById("date2").value=data.me_post_date;
			document.getElementById("message2").value=data.me_memo;
			document.getElementById("rownum2").value=data.me_rownum;
		}
	});
}

//수정모달
/* function onModal(me_rownum) {
	const me_rownum = $("#me_rownum").val();
	$.ajax({
		type : "post",
		url : "/admin/memo/search/{me_rownum}",
		headers:{"Content-Type":"application/json"},
		data :JSON.stringify({me_rownum:me_rownum}),
		dataType:"text",
		success : function(data) {
			console.log(data);
			modal();
			document.getElementById("writer").value=data.a_name;
			document.getElementById("date").value=data.me_post_date;
			document.getElementById("message").value=data.me_memo;
			document.getElementById("rownum").value=data.me_rownum;
		}
	});
} */
//상세모달
/* function onModal2(me_rownum) {
	const me_rownum = $("#me_rownum").val();
	$.ajax({
		type : "post",
		url : "/admin/memo/search/{me_rownum}",
		headers:{"Content-Type":"application/json"},
		data :JSON.stringify({me_rownum:me_rownum}),
		dataType:"text",
		success : function(data) {
			modal2();
			document.getElementById("writer2").value=data.a_name;
			document.getElementById("date2").value=data.me_post_date;
			document.getElementById("message2").value=data.me_memo;
			document.getElementById("rownum2").value=data.me_rownum;
		}
	});
} */
</script>
<style>
.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 120px;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
}

.modal-window {
	background: white;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 380px;
	height: 400px;
	position: relative;
	top: -100px;
	padding: 10px;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
}

.title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: black;
}

.title h3 {
	display: inline;
}

.close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}

.content {
	padding-left: 10px;
	text-shadow: 1px 1px 2px gray;
}
/* 테이블행 */
table {
  border-collapse: collapse;
  margin: 0rem auto;
  box-shadow: 4px 4px 10px 0 rgba(0, 0, 0, 0.1);
  background-color: white;
}

th {
  padding: 8px;
  text-align: center;
  background-color: #FFED86;
  height: 20px;
}
.ddd {
padding-left: 3px;
padding-right: 3px;
padding-top: 3px;
padding-bottom: 3px;
}

/* 테이블 올렸을 때 */
tbody tr:hover {
  background-color: #d3d3d3;
  opacity: 0.9;
  cursor: pointer;
}

#m_form>input[type=text] {
	border: 1px solid #999999;
	border-radius: 5px;
	height: 30px;
	width:150px;
	outline: none;
	padding: 10px;
	margin: 5px;
}

#m_form>textarea:focus {
	background-color: #f1f3f5;
	border-radius: 5px;
	outline: none;
}

#hr {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<c:choose>
 	<c:when test="${map.list.size() == 0 }">
	<table style='table-layout:fixed; width: 500px;' >
 			<tr align="center">
			 	<th>작성자</th>
			 	<th>메모</th>
			 	<th>날짜</th>
 			</tr>
 			<tr>
				<td colspan="3" align="center">&nbsp;</td>
			</tr>
 			<tr>
				<td colspan="3" align="center">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" align="center">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" align="center">등록된 메모가 없습니다.</td>
			</tr>
			<tr>
				<td colspan="3" align="center">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" align="center">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" align="center">&nbsp;</td>
			</tr>
		</table>
	</c:when>
	<c:when test="${map.list.size() > 0}">
	
	<div id="container">
		<form method="post" name="form1">
			<table style='table-layout:fixed; width: 500px;'>
				<tr align="center">
					<th width="70px" height="45px">작성자</th>
					<th width="200px" height="45px">메모</th>
					<th width="100px" height="45px">날짜</th>
					<th width="65px">&nbsp;</th>
					<th width="65px">&nbsp;</th>
				</tr>
				<c:forEach var="dto" items="${map.list}">
					<tr align="center">
						<td width="70px" height="45px" id="a_name">${dto.a_name}</td>
						<td onclick="onModal2(${dto.me_rownum});" id="btnModal2" width="200px" height="45px" style='word-break:break-all; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>${dto.me_memo}</td>
						<td width="100px" height="45px">${dto.me_post_date}</td>
				
						<c:choose>
							<c:when test="${sessionScope.a_id == dto.me_a_id}">
									<td width="60px" height="45x" class="ddd">
										<input type="hidden" id="me_rownum" name="me_rownum" value="${dto.me_rownum}">
										<input type="button" value="수정" id="btnModal" onclick="onModal(${dto.me_rownum});"
											class="btn btn-outline-warning"></td>
									<td width="60px" height="45px" class="ddd">
										<input type="button" value="삭제" onclick="memo_del('${dto.me_rownum}')" class="btn btn-outline-warning">
									</td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			 	<tr align="center">
					<td colspan="6">
						<c:if test="${map.page.curPage > 1}">
							<a id="hr" href="#" onclick="javascript:list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.page.curBlock > 1}">
							<a id="hr" href="#" onclick="javascript:list('${map.page.prevPage}')">[이전]</a>
						</c:if>
						<c:forEach var="num" begin="${map.page.blockStart}" end="${map.page.blockEnd}">
							<c:choose>
								<c:when test="${num == map.page.curPage}">
									<span style="color:blue">${num}</span>
								</c:when>
								<c:otherwise>
									<a id="hr" href="#" onclick="javascript:list('${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.page.curBlock < map.page.totBlock}">
							<a id="hr" href="#" onclick="javascript:list('${map.page.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.page.curPage < map.page.totPage}">
							<a id="hr" href="#" onclick="javascript:list('${map.page.totPage}')">[마지막]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
 	</c:when>
</c:choose>
<!-- 수정모달 -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window" id="modal-window">
			<div class="title">
				<h3>메모수정</h3>
			</div>
			<div class="close-area" id="ca">X</div>
			<div class="content">
			<div class="modal-body"><hr/>
				<form id="m_form" method="post">
					<input type="hidden" id="rownum" name="rownum">
					<input type="hidden" id="me_a_id" name="me_a_id">
					<span style="color: #26262b">작성자</span> <input type="text" id="writer" name="writer" readonly><br> 
					<span style="color: #26262b">작성 날짜</span> <input type="text" id="date" name="date" readonly><br>
					<textarea rows="5" style="border-radius:5px; margin-top:10px;" cols="40" id="message" name="message" placeholder="메모"></textarea><br>
					<br><br>
					<div align="center">
						<input type="button" class="btn btn-warning" id="btnUpdate" value="수정" align="center">
					</div>
				</form>
			</div>
			</div>
		</div>
	</div>
<!-- 상세모달 -->
	<div id="modal2" class="modal-overlay">
		<div class="modal-window" id="modal-window">
			<div class="title">
				<h3>메모상세</h3>
			</div>
			<div class="close-area" id="ca">X</div>
			<div class="content">
			<div class="modal-body"><hr/>
				<form id="m_form" method="post">
					<input type="hidden" id="rownum2" name="rownum2">
					<input type="hidden" id="me_a_id" name="me_a_id">
					<span style="color: #26262b">작성자</span> <input type="text" id="writer2" name="writer2" readonly><br> 
					<span style="color: #26262b">작성 날짜</span> <input type="text" id="date2" name="date2" readonly><br>
					<textarea rows="5" style="border-radius:5px; margin-top:10px;" cols="40" id="message2" name="message2" placeholder="메모"></textarea><br>
				</form>
			</div>
			</div>
		</div>
	</div>
</body>
</html>