<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<% String cp = request.getContextPath(); %>

<% 
					String userId="";
					//session = request.getAttribute("ses");
					int check;
					userId =(String)session.getAttribute("userId");
					if(userId==null||userId.equals("")){
						check=0;
					}else{
						check=1; //session 있을 때,
					}
					if(check==0){
%>
<%}else{%>

<%}%>

<% if(check==0){%>

<%}else{%>

<%}%>
<!DOCTYPE html>
  <html>
    <head>
    <meta charset="UTF-8">
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="<%=cp%>/resources/css/materialize.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="<%=cp%>/resources/js/materialize.js"></script>
      <script type="text/javascript" src="<%=cp%>/resources/js/myb.js"></script>
    
    <script src="<%=cp%>/resources/js/id_check.js"></script>
    	
    <!-- 네비게이션 시작-->
    <nav>
      <div class="nav-wrapper">
        <a href="#" class="brand-logo center">Logo</a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
          <li><a href="bestrecipe.html">명예의 전당</a></li>
          <li><a href="recipe.html">레시피</a></li>
          <li><a href="recipe.html">On Air</a></li>
        </ul>
        <ul class="right hide-on-med-and-down">

          <li><a class="waves-effect waves-light modal-trigger" href="#loginmodal">로그인</a></li>
          <li><a class="waves-effect waves-light modal-trigger" href="#registermodal">회원가입</a></li>
        </ul>
      </div>
    </nav>
    <!-- 네비게이션 끝 -->

    <!-- 슬라이더 시작 -->
    <div class="slider">
    <ul class="slides">
      <li>
        <img src="<%=cp%>/resources//img/banner_img_1.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h3>첫번째 배너 타이틀</h3>
          <h5 class="light grey-text text-lighten-3">첫번째 배너 서브 타이틀</h5>
        </div>
      </li>
      <li>
        <img src="<%=cp%>/resources//img/banner_img_1.jpg"> <!-- random image -->
        <div class="caption left-align">
          <h3>두번째 배너 타이틀</h3>
          <h5 class="light grey-text text-lighten-3">두번째 서브 타이틀</h5>
        </div>
      </li>
      <li>
        <img src="http://lorempixel.com/580/250/nature/3"> <!-- random image -->
        <div class="caption right-align">
          <h3>세번째 배너 타이틀</h3>
          <h5 class="light grey-text text-lighten-3">세번째 서브 타이틀</h5>
        </div>
      </li>
      <li>
        <img src="http://lorempixel.com/580/250/nature/4"> <!-- random image -->
        <div class="caption center-align">
          <h3>네번째 타이틀</h3>
          <h5 class="light gre번y-text text-lighten-3">네번째 서브 타이틀</h5>
        </div>
      </li>
    </ul>
  </div>
  <!-- 슬라이더 끝 -->
  
  <div class="container">
  
  <!-- 명예의 전당 시작 -->
  
  
  <span class="black-text left-align">명예의 전당</span>
  <div class="row">
  <!-- card no 1 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj2.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 322개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 1 end -->

  <!-- card no 2 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj1.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 312개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 2 end -->

  <!-- card no 3 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj2.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 123개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 3 end -->

  <!-- card no 4 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj1.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 43개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 4 end -->
  </div>
  <!-- 명예의 전당 끝 -->
  
  <!-- HOT 레시피 시작 -->
  <span>HOT 레시피</span>
  <div class="row">
  <!-- card no 1 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj2.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 322개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 1 end -->

  <!-- card no 2 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj1.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 312개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 2 end -->

  <!-- card no 3 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj2.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 123개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 3 end -->

  <!-- card no 4 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj1.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 43개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 4 end -->
  </div>
  <!-- HOT 레시피 끝 -->

<!-- 최근 레시피 시작 -->
  <span>최근 레시피</span>
  <div class="row">
  <!-- card no 1 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj2.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 322개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 1 end -->

  <!-- card no 2 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj1.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 312개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 2 end -->

  <!-- card no 3 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj2.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 123개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 3 end -->

  <!-- card no 4 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="<%=cp%>/resources/img/bj1.jpg">
          <span class="card-title">Card Title</span>
        </div>
        <div class="card-content">
          <p>좋아요 43개</p>
        </div>
        <div class="card-action">
          <a href="#">BJ닉네임</a>
        </div>
      </div>
    </div>
  <!-- card no 4 end -->
  </div>
  <!-- 최근 레시피 끝 -->
  </div>


  <!-- 모달 영역 시작 -->
  <!-- 로그인 모달 시작 -->
  <!-- Modal Structure -->
  <div id="loginmodal" class="modal">
    <div class="modal-content">
    <form>
      <h4>로그인</h4>
       <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
 
    <div class="modal-footer">
      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">확인</a>
    </div>
    </form>
  </div>
</div>

<!-- 로그인 모달 끝 -->


<!-- 회원가입 모달  -->
<div id="registermodal" class="modal">
    <div class="modal-content">
    <form name="frm" method="post" class="form-horizontal">
      <h4>회원가입</h4>
       <div class="row">
        <div class="input-field col s12">
          <input id="email" name="email" type="email" class="validate" />
          <label for="email">Email</label>
        </div> 
        
        
			<input id="mailcode2" name="mailcode2" type="button" class="btn btn-success" value="인증코드 발송" onclick="valuesend()"/>


		<div class="input-field col s12">
          <input id="valid-value" name="valid-value" type="text" class="validate">
          <label for="name">인증 코드</label>
        </div> 
        
        <div class="input-field col s12">
          <input id="name" name="name" type="text" class="validate">
          <label for="name">name</label>
        </div>  
        <div class="input-field col s12">
          <input id="password" name="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
        <div class="input-field col s12">
          <input id="repass" name="repass" type="password" class="validate">
          <label for="repass">Re-EnterPassword</label>
        </div>
      </div>

    
    <div class="modal-footer">
    
    <input id="confirmsignup" name="confirmsignup" type="button" class="btn btn-success" value="확인" onclick="sign_up()"/>

    
   
    </div>

 			
     </form>
  </div>
</div>

<!-- 회원가입 모달 끝 -->


    </body>
    <footer class="page-footer">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">마이 비룡 텔레비전</h5>
                <p class="grey-text text-lighten-4">요리로 승부하다.</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">도움말</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">공지사항</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">문의하기</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">FAQ</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">이용약관</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2016 Copyright 마이비룡텔레비전
            <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
            </div>
          </div>
        </footer>
  </html>