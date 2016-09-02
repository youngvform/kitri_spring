<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
  <html>
    <head>
    <meta charset="UTF-8">
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.js"></script>
      <script type="text/javascript" src="js/myb.js"></script>
    
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

  <div class="container">

  <!-- 프로필 영역 시작 -->
   <div class="col s12 m8 offset-m2 l6 offset-l3">
        <div class="card-panel grey lighten-5 z-depth-1">
          <div class="row valign-wrapper">
            <div class="col s2">
              <img src="img/profile.png" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
            </div>
            <div class="col s10">
              <h5>쉐프명</h5>
              <p>hello@hello.com</p>
              <p><a href="#">회원정보 수정</a></p>
              <p><a href="#">비밀번호 변경</a></p>
            </div>
          </div>
        </div>
      </div>
  <!-- 프로필 영역 끝 -->
  <!-- Tab 시작 -->
  <div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a class="active" href="#myrecipecard">나의 레시피</a></li>
        <li class="tab col s3"><a class="" href="#favoritereipecard">스크랩 레시피</a></li>
      </ul>
    </div>
    
    <div id="myrecipecard" class="col s12">
      <div class="row">
  <!-- card no 1 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="img/bj2.jpg">
          <span class="card-title">나의 레시피</span>
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
          <img src="img/bj1.jpg">
          <span class="card-title">나의 레시피</span>
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
          <img src="img/bj2.jpg">
          <span class="card-title">나의 레시피</span>
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
          <img src="img/bj1.jpg">
          <span class="card-title">나의 레시피</span>
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
  </div>
  <!-- 나의 레시피 컨텐츠 끝-->
  

  <!-- 스크랩 레시피 컨텐츠 시작 -->
  <div id="favoritereipecard" class="col s12">
  <div class="row">
  <!-- card no 1 start -->
    <div class="col s12 m3">
      <div class="card small hoverable">
        <div class="card-image">
          <img src="img/bj2.jpg">
          <span class="card-title">스크랩 레시피</span>
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
          <img src="img/bj1.jpg">
          <span class="card-title">스크랩 레시피</span>
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
          <img src="img/bj2.jpg">
          <span class="card-title">스크랩 레시피</span>
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
          <img src="img/bj1.jpg">
          <span class="card-title">스크랩 레시피</span>
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
  </div>
  <!-- 스크랩 레시피 컨텐츠 끝 -->

</div>
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
    <form>
      <h4>회원가입</h4>
       <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div> 

            <button class="btn waves-effect waves-light right" type="submit" name="action">이메일 인증
                <i class="material-icons right">send</i>
            </button>

        <div class="input-field col s12">
          <input id="name" type="text" class="validate">
          <label for="name">name</label>
        </div>  
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Re-EnterPassword</label>
        </div>
      </div>

    
    <div class="modal-footer">
      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">확인</a>
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