<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../include/css/addrlinkSample.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
String inputYn = request.getParameter("inputYn");
String zipNo = request.getParameter("zipNo");
String roadFullAddr = request.getParameter("roadFullAddr");
String roadAddrPart1 = request.getParameter("roadAddrPart1");
String roadAddrPart2 = request.getParameter("roadAddrPart2");
String addrDetail = request.getParameter("addrDetail");
%>
</head>
<script>
function init(){
	var url = location.href;
	// 승인키
	var confmKey = "devU01TX0FVVEgyMDI0MDIxNjEyNDM0MjExNDUyMzY=";
	var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="https://business.juso.go.kr/addrlink/addrLinkUrl.do"
		document.form.submit();
	}else{
		opener.jusoCallBack("<%=zipNo%>","<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=roadAddrPart2%>","<%=addrDetail%>");
			window.close();
		}
	}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" /> <input
			type="hidden" id="returnUrl" name="returnUrl" value="" /> <input
			type="hidden" id="resultType" name="resultType" value="" />
	</form>
</body>
</html>