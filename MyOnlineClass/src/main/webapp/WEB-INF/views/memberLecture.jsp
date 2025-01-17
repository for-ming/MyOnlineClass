<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String user = null;
//로그인 세션 확인
if (session.getAttribute("id") != null) {
	user = (String) session.getAttribute("id");
}

Date nowTime = new Date();
SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal_init_s = Calendar.getInstance();
String resultTime = "";

cal_init_s.add(Calendar.DATE, +30);
java.util.Date result_date = cal_init_s.getTime();
resultTime = dateForm.format(result_date);
%>
<c:set var="lecture" value="${lectureDTO}" />
<!DOCTYPE html>
<html>
<head>
<c:import url="header2.jsp"></c:import>
<meta charset="UTF-8">
<title>클래스팡 :: MyOnlineClass</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
$(function(){
	var user = '<%=(String) session.getAttribute("id")%>';
	if (user == 'null'){
		Swal.fire({ 
			title: '비회원 이용불가', 
			text: "로그인 후 이용해주세요.", 
			icon: 'warning', 
			showCancelButton: true, 
			confirmButtonColor: '#a1d1ff', 
			cancelButtonColor: '#fa7373', 
			confirmButtonText: '확인', 
			cancelButtonText: '취소' 
		}).then((result) => { 
			if (result.isConfirmed) { 
				location.href='/online/login';
				} 
			else
				history.back();
			})
		return;
	}
});

$(document).on("click", "#regbtn", function() {
	Swal.fire({ 
		title: '강의를 수강하시겠습니까?', 
		text: "오늘부터 강의를 수강할 수 있습니다!", 
		icon: 'warning', 
		showCancelButton: true, 
		confirmButtonColor: '#a1d1ff', 
		cancelButtonColor: '#fa7373', 
		confirmButtonText: '네', 
		cancelButtonText: '아니오' 
	}).then((result) => { 
		if (result.isConfirmed) { 
			location.href='/online/memberlecture/action/'+${lecture.id};
			return;
		} 
		else{
			return;
		}
		})
});

</script>
<style>
.myButton {
	box-shadow: inset -4px 0px 0px -15px #f7c5c0;
	background: linear-gradient(to bottom, #f27e9b 5%, #e37b95 100%);
	background-color: #f27e9b;
	border-radius: 9px;
	border: 1px solid #d12e6a;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 7px 24px;
	text-decoration: none;
	text-shadow: 0px 2px 0px #db3362;
}

.myButton:hover {
	background: linear-gradient(to bottom, #e37b95 5%, #f27e9b 100%);
	background-color: #e37b95;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.myButton2 {
	box-shadow: inset -4px 0px 0px -15px #ffffff;
	background: linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color: #ededed;
	border-radius: 9px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #777777;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 7px 24px;
	text-decoration: none;
	text-shadow: 0px 2px 0px #ffffff;
}

.myButton2:hover {
	background: linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color: #dfdfdf;
}

.myButton2:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>
	<div id="preloder">
		<div class="loader"></div>
		<div class="loaderAfterWhite"></div>
	</div>
	<div style="border: 3px solid silver; padding: 1px; height: 10px;"></div>
	<div style="text-align: center; padding: 40px;">
		<img
			src="${pageContext.request.contextPath}/lectureThumbnail?name=${lecture.name}&thumbnail=${lecture.thumbnail}"
			alt="" height="240" style="border: 1px solid pink"><br>
		<h2>${lecture.name}</h2>
		<br> <br>

		<h6><%=user%>님 수강을 시작하시겠습니까?
		</h6>
		<br> 수강 기간 <br> 총 ${lecture.duration} 일<br> <br>
		수강 시작일 :
		<%=dateForm.format(nowTime)%>
		<br> <br> <br>
		<button type="button" class="myButton2"
			onclick="location.href='javascript:history.back()'">취소</button>
		<button type="button" class="myButton" id="regbtn">수강신청하기</button>
	</div>
	<div style="height: 100px;"></div>
	<c:import url="footer.jsp"></c:import>
</body>

</html>