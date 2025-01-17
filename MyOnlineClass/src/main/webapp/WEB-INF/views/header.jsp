<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)session.getAttribute("id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="64x64" href="${contextPath}/resources/image/favicon.png" />
<meta charset="UTF-8">


<title>클래스팡 :: MyOnlineClass</title>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 폰트 스타일 시트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 부트 스트랩 스타일 시트 -->
<link rel="stylesheet"
     href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
     integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
     crossorigin="anonymous">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- <script>
	function confirm(title, msg, type) {
		swal({
			title : title,
			text : msg,
			icon : type,
			buttons: {
			    yes: "예",
			    no: "아니오"
			  },
		})
		.then((value) => {
			switch(value) {
			case "예":
				return true;
			case "아니오":
				return false;
			}
			 
		});
	}
</script> -->

<!-- 다중 Autocomplete -->
<script type="text/javascript">
   $(function() {
      $( "#searchKey" ).autocomplete({
        source: '${contextPath}/autoComplete',
        delay: 200,
        select: function(event, ui) {
        	var url = '${contextPath}/search/'
        	window.location.href = url + JSON.stringify(ui.item.value).replace(/\"/gi, "");
        }
      });
   });
</script>

<script>
	function search() {
		var searchKey = document.getElementById("searchKey").value;
		var url = '${contextPath}/search/';
		location.href = url + searchKey;
	}
</script>

<!-- 로그인 한 회원이 강사인지 확인 -->
<script>
	$(document).ready(function() {
		var id = "${id}";
		$.ajax({
			type: "POST",
			url: "getInstFlag",
			data: {id : id},
			success: function(data) {
				nickname = data['nickname'];
				
				if (!id) {
					$('.textSwitch').text('');
				}
				else {
					if (!nickname) {
						$('.textSwitch').text('강사 신청');
						$('.linkSwitch').attr("href", 'open');
					} else {
						$('.textSwitch').text('클래스 개설');
						$('.linkSwitch').attr("href", 'enroll');
					}
				}
				
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				console.log("실패");
			}
		});
	});
</script>

<style>
body {
   padding-top: 56px;
}

.carousel-item {
   height: 65vh;
   min-height: 300px;
   background: no-repeat center center scroll;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
}

.portfolio-item {
   margin-bottom: 30px;
}

.logoImage {
   width: 120px;
   height: auto;
   object-fit: cover;      
}

.ul {
   list-style:none;
}

.custom-card-body {
   -ms-flex: 1 1 auto;
     flex: 1 1 auto;
     min-height: 1px;
     padding: 0.3rem;
     font-size: 15px;
}

}
</style>

<style>
html,
body {
   position: relative;
     height: 100%;
}

body {
   background: #eee;
     font-family: Noto Sans KR, sans-serif, Helvetica Neue, Helvetica, Arial !important;
     font-size: 14px;
     color: #000;
     margin: 0;
     padding: 0;
}

.swiper-container {
   width: 100%;
   height: 100%;
}

.swiper-slide {
   text-align: center;
     font-size: 18px;
     background: #fff;

  /* Center slide text vertically */
    display: -webkit-box;
     display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
     -webkit-box-pack: center;
     -ms-flex-pack: center;
     -webkit-justify-content: center;
     justify-content: center;
     -webkit-box-align: center;
     -ms-flex-align: center;
     -webkit-align-items: center;
     align-items: center;
}

.swiper-slide img {
   display: block;
     width: 100%;
     height: 100%;
     object-fit: cover;
}

.swiper-button-prev {
   background-repeat: no-repeat;
   background-size: 100% auto;
   background-position: center;
   -webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
   filter: opacity(.5) dropshadow(0 0 0 gray);
}

.swiper-button-next {
   background-repeat: no-repeat;
   background-size: 100% auto;
   background-position: center;
   -webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
   filter: opacity(.5) dropshadow(0 0 0 gray);
}

.swiper-button-prev:hover {
   -webkit-filter: opacity(.5) drop-shadow(0 0 0 black);
   filter: opacity(.5) dropshadow(0 0 0 black);
}

.swiper-button-next:hover {
   -webkit-filter: opacity(.5) drop-shadow(0 0 0 black);
   filter: opacity(.5) dropshadow(0 0 0 black);
}

.swiper-button-prev::after {
   display: none;
}

.swiper-button-next::after {
   display: none;
}
</style>

<style>
.my-box {
   border: 1px solid #ff5a5f;
   width: 80px;
   height: 25px;
}

a#MOVE_TOP_BTN {
    position: fixed;
    right: 5%;
    bottom: 80px;
    display: none;
    z-index: 999;
}

.ui-autocomplete {
	font-size: 13px;
	z-index: 9999 !important;
}
</style>

<style>
.ui-autocomplete {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    float: left;
    display: none;
    min-width: 160px;   
    padding: 4px 0;
    margin: 0 0 10px 25px;
    list-style: none;
    background-color: #ffffff;
    border-color: #ccc;
    border-color: rgba(0, 0, 0, 0.2);
    border-style: solid;
    border-width: 1px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    -webkit-background-clip: padding-box;
    -moz-background-clip: padding;
    background-clip: padding-box;
    *border-right-width: 2px;
    *border-bottom-width: 2px;
}

.ui-menu-item > a.ui-corner-all {
    display: block;
    padding: 3px 15px;
    clear: both;
    font-weight: normal;
    line-height: 18px;
    color: #555555;
    white-space: nowrap;
    text-decoration: none;
}

.ui-state-hover, .ui-state-active {
    color: #ffffff;
    text-decoration: none;
    background-color: #0088cc;
    border-radius: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    background-image: none;
}
.swal-button {
  padding: 7px 19px;
  border-radius: 2px;
  background-color: #4962B3;
  font-size: 12px;
  border: 1px solid #3e549a;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}
.swal-button:focus {
  box-shadow: none;
}

</style>
<script>
var alert = function(title, msg, type) {
	swal({
		title : title,
		text : msg,
		icon : type,
		button: '확인'
	}).then((YES) => {
		if(YES) {
			
		}
	});
}
</script>
</head>
<body>
<!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #ffffff;">
      <div class="container">
         <a class="navbar-brand" href="${contextPath}/">
            <img src="${contextPath}/resources/image/Classpang_logo.png" alt="클래스팡" class="logoImage">
         </a>
         
         <div class="ui-widget" style="padding-top: 15px;">
            <label class="header__search-label" for="searchKey" >
                <input id="searchKey" name="searchKey" type="text" placeholder="클래스나 코치를 검색해보세요" maxlength="20" autocomplete="off" onfocus="this.value=''" style="border:0; outline:0; width: 200px; padding-left:12px; font-size: 13px; background-color: #f8f9fa; border-radius: 30px;">
            	<button type="submit" style="border:0; outline:0; background-color: white;">
               		<i class="fas fa-search" onclick="search()"></i>
            	</button>
            </label>
         </div>
            
         <button class="navbar-toggler" type="button" data-toggle="collapse"
               data-target="#navbarResponsive" aria-controls="navbarResponsive"
               aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         
         <div class="collapse navbar-collapse" id="navbarResponsive">
         	<ul class="navbar-nav ml-auto">
         		<li class="nav-item active">
         			<a class="nav-link linkSwitch" href="${contextPath}/open" >
         				<span class="textSwitch"></span>
            		</a>
            	<li class="nav-item active">
            		<a class="nav-link" style="display:cursor" href="${contextPath}/">
            			<i class="far fa-bell"></i>
            		</a>
            	</li>
               <li class="nav-item active">
                  <% if (id == null || id == "") { %>
                  <a class="nav-link" href="${contextPath}/login" style="padding-right: 40px;">
                     <i class="fas fa-user"></i>
                  </a>
                  <% } else { %>
                  <a class="nav-link" href="${contextPath}/mylecture" style="padding-right: 40px;">
                     <i class="fas fa-user"></i>
                  </a>
                  <% } %>
               </li>
            </ul>
         </div>
      </div>
   </nav>
   
   <!-- Bootstrap core JavaScript -->
   <%--    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script> --%>
   <%--    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>

   <!-- Bootstrap core CSS -->
   <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   
   <!--  Custom styles for this template -->
   <link href="${contextPath}/resources/css/full-width-pics.css" rel="stylesheet">

</body>
</html>