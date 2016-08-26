<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<!-- META TAG -->
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		
		<!-- TITLE -->
		<title>ZIGLEZIGLE</title>
		
		<!-- STYLESHEET -->
		<link rel="stylesheet" href="<%=cp%>/resources/lib/css/bootstrap.css"/>
		<link rel="stylesheet" href="<%=cp%>/resources/lib/css/custom_style.css"/>
		<link rel="stylesheet" href="<%=cp%>/resources/lib/css/font-awesome.css"/>
		<link rel="stylesheet" href="<%=cp%>/resources/lib/css/cooking.css"/>
		<link rel="stylesheet" href="<%=cp%>/resources/lib/css/grid.css"/>		
		<!-- JAVASCRIPT-->
		
		<!--script src="lib/js/jqBootstrapValidation.js"></script-->
		<script src="<%=cp%>/resources/lib/js/jquery.min.js"></script>
		<script src="<%=cp%>/resources/lib/js/id_check.js"></script>
		<script src="<%=cp%>/resources/lib/js/bootstrap.js"></script>
		
		
	</head>

	<body>
		<div class="Background">
			<canvas class="Background-canvas" style="width:100%; height:100%"></canvas>
		</div>

		<jsp:include page="navbar.jsp" flush="false"/>
                <div class="intro">
                        <h2 class="intro__title">ZIGLEZIGLE</h2>
                        <p class="intro__subtitle"> Welcomdddddde to our Page</p>
                        <button class="intro__button">Register now</button>
                </div>
	
		<!-- /container -->
		<script src="<%=cp%>/resources/lib/js/cooking.js"></script>
	</body>
</html>
