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
      <!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
      
    
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

<!--Tab 시작 -->
	<div class="row">

			    <br><br><div class="col s12">
					        <ul class="tabs">
					        <li class="tab col s3"><a href="#recipeinformation">레시피 정보 입력</a></li>
					        <li class="tab col s3"><a class="active" href="#recipestep">요리과정 등록</a></li>
					        </ul>
					    </div>


<!--레시피정보입력 시작-->
    <div id="recipeinformation" class="col s12">
		<div class="row">

      <form class="col s12">
				        <div class="row">
				          <div class="input-field col s6">
				            <input id="input_text" type="text" length="10">
				            <label for="input_text">레시피 제목</label>
				          </div>
				        </div>
				        <div class="row">
				          <div class="input-field col s12">
				            <textarea id="textarea1" class="materialize-textarea" length="120"></textarea>
				            <label for="textarea1">간단 소개</label>
				          </div>
						</div>


<!--완성이미지 들어갈곳-->
			      <p class="cont_tit4">요리완성사진
			    	  <input type="file" name="file" id="multifile_2" file_gubun="work" style="display:none;" multiple/>
					  <button type="button" onclick="document.getElementById('multifile_2').click();" class="waves-effect waves-light btn">
					  <span class="glyphicon glyphicon-plus"></span> 사진 한번에 넣기</button>
				  </p>
				  
			    <div id="divWorkArea" style="display:inline-block" style="display:inline">
			                <div id="divWorkUpload_1" class="complete_pic" style="display:inline-block">
			            <input type="hidden" name="work_photo[]" id="work_photo_1" value="">
			            <input type="hidden" name="new_work_photo[]" id="new_work_photo_1" value="">
			            <input type="hidden" name="del_work_photo[]" id="del_work_photo_1" value="">
			            <div style="position:absolute;left:-3000px"><input type="file" name="q_work_file_1" id="q_work_file_1" file_gubun="work" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text=""></div>
			            <div id="divWorkPhotoBox_1" is_over="0">
			                <a href="#" class="pic_del" style="display:none"></a>
			                <img id="workPhotoHolder_1" onclick="browseWorkFile(1)" src="http://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor:pointer">
			            </div>
			        </div>
			                <div id="divWorkUpload_2" class="complete_pic" style="display:inline-block">
			            <input type="hidden" name="work_photo[]" id="work_photo_2" value="">
			            <input type="hidden" name="new_work_photo[]" id="new_work_photo_2" value="">
			            <input type="hidden" name="del_work_photo[]" id="del_work_photo_2" value="">
			            <div style="position:absolute;left:-3000px"><input type="file" name="q_work_file_2" id="q_work_file_2" file_gubun="work" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text=""></div>
						            <div id="divWorkPhotoBox_2" is_over="0">
						                <a href="#" class="pic_del" style="display:none"></a>
						                <img id="workPhotoHolder_2" onclick="browseWorkFile(2)" src="http://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor:pointer">
						            </div>
			                </div>
			                <div id="divWorkUpload_3" class="complete_pic" style="display:inline-block">
			            <input type="hidden" name="work_photo[]" id="work_photo_3" value="">
			            <input type="hidden" name="new_work_photo[]" id="new_work_photo_3" value="">
			            <input type="hidden" name="del_work_photo[]" id="del_work_photo_3" value="">
			            <div style="position:absolute;left:-3000px"><input type="file" name="q_work_file_3" id="q_work_file_3" file_gubun="work" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text=""></div>
						            <div id="divWorkPhotoBox_3" is_over="0">
						                <a href="#" class="pic_del" style="display:none"></a>
						                <img id="workPhotoHolder_3" onclick="browseWorkFile(3)" src="http://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor:pointer">
						            </div>
			               </div>
			                <div id="divWorkUpload_4" class="complete_pic" style="display:inline-block">
			            <input type="hidden" name="work_photo[]" id="work_photo_4" value="">
			            <input type="hidden" name="new_work_photo[]" id="new_work_photo_4" value="">
			            <input type="hidden" name="del_work_photo[]" id="del_work_photo_4" value="">
			            <div style="position:absolute;left:-3000px"><input type="file" name="q_work_file_4" id="q_work_file_4" file_gubun="work" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text=""></div>
			            <div id="divWorkPhotoBox_4" is_over="0">
			                <a href="#" class="pic_del" style="display:none"></a>
			                <img id="workPhotoHolder_4" onclick="browseWorkFile(4)" src="http://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor:pointer">
			            </div>
			        </div>
			     </div>
<!--완성이미지 들어갈곳 끝-->



		<div class="row">
          <div class="input-field col s12">
            <textarea id="textarea1" class="materialize-textarea" length="120"></textarea>
            <label for="textarea1">재료</label>
          </div>
		</div>

<!-- Dropdown Trigger -->
  <a class='dropdown-button btn' href='#' data-activates='dropdown1'>소요시간 </a>

  <!-- Dropdown Structure -->
  <ul id='dropdown1' class='dropdown-content'>
    <li><a href="#!">30분이내</a></li>
    <li><a href="#!">1시간이내</a></li>
    <li><a href="#!">2시간이내</a></li>
    <li><a href="#!">2시간이상</a></li>
    <li class="divider"></li>
    <li><a href="#!">소요시간</a></li>
  </ul>


<!-- Dropdown Trigger -->
  <a class='dropdown-button btn' href='#' data-activates='dropdown2'>난이도</a>

  <!-- Dropdown Structure -->
  <ul id='dropdown2' class='dropdown-content'>
    <li><a href="#!">초급</a></li>
    <li><a href="#!">중급</a></li>
    <li><a href="#!">고급</a></li>
    <li class="divider"></li>
    <li><a href="#!">난이도</a></li>
  </ul>
        



		<br><br><br><a class="waves-effect waves-light btn-large">요리 과정 추가</a>



	</div>
</div>

<!--레시피정보입력 끝-->



   
<!--요리과정 등록-->
    <div id="recipestep" class="col s12">
		<div class="row">




		</div>

    </div>



  </div>

<!--Tab 끝 -->

 

      </form>




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