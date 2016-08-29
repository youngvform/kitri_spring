<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<% String cp = request.getContextPath(); %>
<% System.out.print("cp = "+cp); %>

                <!-- navbar -->
                <nav class="navbar navbar-default" id="custom_navbar">
                        <div class="container-fluid">
                        	<!-- Brand and toggle get grouped for better mobile display -->
                                <div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
                                        <a class="navbar-brand" href="#">ZIGLEZIGLE</a>
                                </div>
				
				<!-- Collect the nav links, forms, and other content for toggling-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                                <ul class="nav navbar-nav navbar-left">
        	                                <li><a href="#">NOTICE</a></li>
                	                        <li><a href="#">RECIPE</a></li>
                	                        <li><a href="#">RECOMMEND</a></li>
                        	                <li><a href="#">EVENT</a></li>
                                	        <li><a href="#">FAQ</a></li>
	                                </ul>

                                        <form class="navbar-form navbar-left" role="search">
                                                <div class="input-group col-md-7" style="width:100%">
                                                        <input type="text" class="search-query form-control" placeholder="Search" />
                                                        <span class="input-group-btn">
                                                                <button class="btn btn-danger" type="button">
                                                                        <span class=" glyphicon glyphicon-search"></span>
                                                                </button>
                                                        </span>
                                                </div>
                                        </form>


				<% 
					String email="";
					//session = request.getAttribute("ses");
					int check;
					email=(String)session.getAttribute("email");
					if(email==null||email.equals("")){
						check=0;
					}else{
						check=1; //session 있을 때,
					}
					if(check==0){
				%>
					<ul class="nav navbar-nav navbar-right">
						<li><img src="<%=cp%>/resources/images/login-5.png" id="user_img" data-target="#login" data-toggle="modal"></li>
					</ul>
					<%}else{%>
                        	        <ul class="nav navbar-nav navbar-right">
                                	        <li class="dropdown">
                                        	        <img src="<%=cp%>/resources/images/login-5.png" id="user_img" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                                	<ul class="dropdown-menu">
                                                	        <li><a href="#">My Home</a></li>
                                                	        <li><a href="#" data-target="#logout" data-toggle="modal">정보수정</a></li>
        	                                       	         <li><a href="<%=cp%>/sign_out" >LOGOUT</a></li>
	                                               	 </ul>
        	                                </li>
                	                </ul>
					<%}%>
				</div><!--collapse navbar-collapse End-->
	                </div><!-- /.container-fluid -->
                </nav>
                <!-- navbar End-->
		<% if(check==0){%>
                <!--로그인 안했을 때,  Modal -->
                <div class="modal fade bs-modal-sm" id="login" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                                <div class="modal-content"><br/>
                                        <!-- header -->
                                        <div class="bs-example bs-example-tabs">
                                                <ul id="myTab" class="nav nav-tabs">
                                                        <li class="active"><a href="#signin" data-toggle="tab">Sign In</a></li>
                                                        <li class=""><a href="#signup" data-toggle="tab">Register</a></li>
                                                        <li class=""><a href="#pwdsearch" data-toggle="tab">pwd&nbsp;search</a></li>
                                                </ul>
                                        </div>

                                        <!-- body -->
                                        <div class="modal-body">
                                                <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade active in" id="signin">
                                                                <form name="infrm" method="post" action="<%=cp%>/sign_in" class="form-horizontal" >
                                                               
                                                                        <!-- Sign In Form -->
                                                                        <fieldset>
                                                                                <!-- Text input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="userid">email:</label>
                                                                                        <div class="controls">
                                                                                                <input required="" id="logemail" name="logemail" type="text" class="form-control" placeholder="JoeSixpack" class="input-medium" required="">
                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Password input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="passwordinput">Password:</label>
                                                                                        <div class="controls">
                                                                                                <input required="" id="passwordinput" name="passwordinput" class="form-control" type="password" placeholder="********" class="input-medium">
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
	
                                                                                <!-- Button -->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="signin"></label>
                                                                                        <div class="controls">
                                                                                                <button id="signin" "name="signin" class="btn btn-success" >Sign In</button>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                        </fieldset>
                                                                </form>
                                                        </div>
                                                        
                                                        

                                                        <div class="tab-pane fade" id="signup">
                                                                <form name="frm" class="form-horizontal"  method="post" onkeydown="return captureReturnKey(event)">
                                                                        <!-- Sign Up Form -->
                                                                        <fieldset>
                                                                                <!-- Text input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="email">Email:</label>
                                                                                        <div class="controls">
                                                                                                <input id="email" name="email" onkeyup="idCheck()" class="form-control" type="email"  placeholder="JoeSixpack@sixpacksrus.com" class="input-large" required="">
                                                                                      
                                                                                                <button id="confirmsignup"  name="confirmsignup" class="btn btn-success" onclick="idCheck()" >ddd</button>
                                                                                                <input id="mailcode2" name="mailcode2" type="button" class="btn btn-success" value="인증코드 발송"/>
                                                                                                &nbsp;&nbsp;&nbsp;<span id="result" style="color: BLUE;"> </span>
                                                                                       			<input id="vaildmail" name="vaildmail" class="form-control" type="text" placeholder="발송 버튼을 눌러주세요." class="input-large" required="">
                                                                                        		
                                                                                        
                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Text input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="userid">Alias:</label>
                                                                                        <div class="controls">
                                                                                                <input id="userid" name="userid" class="form-control" type="text" placeholder="JoeSixpack" class="input-large" required="">
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                                <!-- Password input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="password">Password:</label>
                                                                                        <div class="controls">
                                                                                                <input id="password" name="password" class="form-control" minlength="5" data-validation-minlength-message="tow up" type="password" placeholder="********" class="input-large" required="">
                                                                                                <em>1-8 Characters</em>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Re Password input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="reenterpassword">Re-Enter Password:</label>
                                                                                                <div class="controls">
                                                                                                <input id="reenterpassword" class="form-control" name="reenterpassword" type="password" data-validation-match-match="password" placeholder="********" class="input-large" required="">
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
																				
                                                                                <!-- Button -->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="confirmsignup"></label>
                                                                                        <div class="controls">
                                                                                        
                                                                                                <button id="confirmsignup"  name="confirmsignup" class="btn btn-success" onclick="signin()" >Sign Up</button>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                        </fieldset>
                                                                </form>
                                                        </div>
                                                        
                                                        <!-- 비밀번호 찾기 -->
                                                        <div class="tab-pane fade" id="pwdsearch">
                                                                <form name="frm2" action="<%=cp%>/sendpw" method="post" class="form-horizontal">
                                                                        <!-- Sign Up Form -->
                                                                        <fieldset>
                                                                                <!-- Text input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="email">Email:</label>
                                                                                        <div class="controls">
                                                                                                <input id="email" name="email" class="form-control" type="text" placeholder="JoeSixpack@sixpacksrus.com" class="input-large" required="">
                                                                                                                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Button -->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="confirmsignup"></label>
                                                                                        <div class="controls">
                                                                                        		
                                                                                        		<button id="findpw" "name="findpw" class="btn btn-success" >비밀번호 전송</button>
                                                                                                
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                        </fieldset>
                                                                </form>
                                                        </div>
                                                </div>
                                                <!-- Footer -->
                                                <div class="modal-footer">
                                                        <center>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </center>
                                                </div>
                                        </div><!-- Modal Body End-->
                                </div><!-- Modal Contents End-->
                        </div><!-- Modal Dialog End-->
                </div><!-- Modal End-->
		<%}else{%>
                <!-- Modal -->
                <div class="modal fade bs-modal-sm" id="logout" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                                <div class="modal-content"><br/>
                                        <!-- header -->
                                        <div class="bs-example bs-example-tabs">
                                                <ul id="myTab" class="nav nav-tabs">
                                                        <li class="active"><a href="#signin" data-toggle="tab"> 회원정보 수정</a></li>
                                                </ul>
                                        </div>

                                        <!-- body -->
                                        <div class="modal-body">
                                                <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade active in" id="signin">
                                                                <form class="form-horizontal">
                                                                        <!-- Sign Up Form -->
                                                                        <fieldset>
                                                                                <!-- Text input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="email">Email:</label>
                                                                                        <div class="controls">
                                                                                                <input id="email" name="email" class="form-control" type="text" placeholder="JoeSixpack@sixpacksrus.com" class="input-large" required="">
                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Text input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="userid">Alias:</label>
                                                                                        <div class="controls">
                                                                                                <input id="userid" name="userid" class="form-control" type="text" placeholder="JoeSixpack" class="input-large" required="">
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                                <!-- Password input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="password">Password:</label>
                                                                                        <div class="controls">
                                                                                                <input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="" data-target="#passcheck" data-toggle="modal">
                                                                                                <em>1-8 Characters</em>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Button -->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="confirmsignup"></label>
                                                                                        <div class="controls">
                                                                                                <button id="confirmsignup" name="confirmsignup" class="btn btn-success">Sign Up</button>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                        </fieldset>
                                                                </form>
                                                        </div>
                                                </div>
                                                <!-- Footer -->
                                                <div class="modal-footer">
                                                        <center>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </center>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
                <!-- 비밀번호 수정 Modal -->
                <div class="modal fade bs-modal-sm" id="passcheck" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                                <div class="modal-content"><br/>

                                        <!-- body -->
                                        <div class="modal-body">
                                                <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade active in" id="signin">
                                                                <form class="form-horizontal">
                                                                        <!-- Sign Up Form -->
                                                                        <fieldset>

                                                                                <!-- Current Password input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="password">Current Password:</label>
                                                                                        <div class="controls">
                                                                                                <input id="password" name="current_password" class="form-control" type="password" placeholder="********" class="input-large" required="">
                                                                                                <em>1-8 Characters</em>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Password input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="password">Change Your Password:</label>
                                                                                        <div class="controls">
                                                                                                <input id="password" name="change_password" class="form-control" type="password" placeholder="********" class="input-large" required="">
                                                                                                <em>1-8 Characters</em>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                                <!-- Re Password input-->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="reenterpassword">Re-Enter Password:</label>
                                                                                                <div class="controls">
                                                                                                <input id="reenterpassword" class="form-control" name="re_change_password" type="password" placeholder="********" class="input-large" required="">
                                                                                        </div>
                                                                                </div>
                                                                                <br/>

                                                                                <!-- Button -->
                                                                                <div class="control-group">
                                                                                        <label class="control-label" for="confirmsignup"></label>
                                                                                        <div class="controls">
                                                                                                <button id="confirmsignup" name="confirmsignup" class="btn btn-success">OK</button>
                                                                                        </div>
                                                                                </div>
                                                                                <br/>
                                                                        </fieldset>
                                                                </form>
                                                        </div>
                                                </div>
                                                <!-- Footer -->
                                                <div class="modal-footer">
                                                        <center>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </center>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
		<%}%>
