
//컨텍스트 패스인 /kitri_spring01_co_co 받아오기
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}



/*아이디 중복 실시간 체크*/
var x;
function idCheck() {
	console.log("sdsd");
	var uid = document.getElementById("email").val();
	
	var para = 'email='+uid;	
	$.ajax({
		type:"POST",
		url: "/kitri_spring01_co_co/check_id",		
		data: para,
		dataType : "json",
		success:function(data)
		{			
			if(data.result=="true"){				      	
				document.getElementById("result").innerHTML = "Alredy using";    	
x=1;
			}else{

				document.getElementById("result").innerHTML = "ok";	
				x=2;
			}
		}		
	});
}










$("#email").keyup(function(){
	$.ajax({
	    url : getContextPath()+"/checkId",
	    dataType : "json",
	    type : "post",
	    data : $('#email').serializeArray(),
	    success: function(data) {
	        alert("성공:"+data.KEY);
	    },
	    error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"error:"+error);
	    }
	 
	}); 
})
//$("#email").keyup(function(){
//    $.post(getContextPath()+"/check_id"
//            ,{"email" : $("#email").val()}
//            , function(data){
//            console.log(data);
//        
//        if(data =="true"){
//            $("#result").text("이미사용중인 아이디입니다.")
//        }else{
//            $("#result").text("사용가능한 아이디입니다.")
//        }
//    });
//})


/* 중복일때 버튼 막기, 아니면 회원가입 */
var pw = document.getElementById("password").value();
var rpw = document.getElementById("reenterpassword").value();

$(document).ready(function(){
	$("#confirmsignup").click(function(){
		console.log(pw);
		console.log(rpw);
		if(pw != rpw){
			alert("check your password");
			return false;
		}
		else{
			if(x==1){

				alert("check your id");
				return false;

			}else{signup();
			//memberSubmit();
			}
		}
	});
});


$(document).ready(function(){
    $("#findpw").click(function(){
    	if(x==1){
        alert("check your id");
    		return false;
        
    	}else{signup();
    	//memberSubmit();
    	}
    });
});
//memberSubmit();

/*회원가입 보내기/
function memberSubmit() {
	var email = document.getElementById("email").value;
	var userid = document.getElementById("userid").value;
	var password = document.getElementById("password").value;	
	
	var personInfo = new Object();
    
    personInfo.email = email;
    personInfo.name = userid;
    personInfo.passwrod = password;
    var jsonInfo = JSON.stringify(personInfo);
    
	$.ajax({
		type:"POST",
		url:"/web/add",		
		data: jsonInfo,
		dataType : "json",
		success:function(data)
		{			
			
			session.setAttribute("email", user.getEmail());
			response.sendRedirect("index.jsp");
		}		
	});
}*


/*아이디 로그인 구현 안함
function idLogin() {
	var idlog = document.getElementById("userid").value;
	var passlog = document.getElementById("passwordinput").value;
	var para = 'userid='+idlog+'passlog'+passlog;
	$.ajax({
		type:"POST",
		url:"/login()",		
		data: para,
		dataType : "json",
		success:function(data)
		{			
			if(data.result=="true"){				      	
				document.getElementById("result").innerHTML = "Alredy using";    	
x=1;
			}else{

				document.getElementById("result").innerHTML = "ok";	
				x=2;
			}
		}		
	});
}*/



/*회원가입 입력폼에서 엔터키막기*/
function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
    return false;
}

/*이건 일단 지켜봐야함*/
function callBack() {
	if(xmlReq.readyState == 4) {
		if(xmlReq.status == 200) {        	
			printData();
		}
	}
}



//function valuesend(){
//	
//	
//	var uid = document.getElementById("email").val();
//	console.log(uid);
//	var para = 'email='+uid;	
//	$.ajax({
//		type:"POST",
//		url: "/kitri_spring01_co_co/check_id",		
//		data: para,
//		dataType : "json",
//		success:function(data)
//		{			
//			if(data.result=="true"){				      	
//				document.getElementById("result").innerHTML = "Alredy using";    	
//x=1;
//			}else{
//
//				document.getElementById("result").innerHTML = "ok";	
//				x=2;
//			}
//		}		
//	});
//	
//	
//	$.ajax({
//	    url : getContextPath()+"/sendmail",
//	    dataType : "json",
//	    type : "post",
//	    data : para,
//	    success: function(data) {
//	        alert("성공:"+data.KEY);
//	    },
//	    error:function(request,status,error){
//	        alert("code:"+request.status+"\n"+"error:"+error);
//	    }
//	 
//	}); 
//}


/*인증코드 이메일 전송*/
//function valuesend(){
//	window.open("", "value", "width=430, height=150,scrollbars=1, menubar=1, resizable=1"); 
//                                           //새창의 타겟과 크기 같은 옵션을 지정
//
//	document.frm.target ="value";             //새창에서 지정한 value옵션으로 타겟을 지정
//	document.frm.action=getContextPath()+"/sendmail"; 
//	document.frm.method="post";//새창으로 띄울 jsp
//	document.frm.submit();
//	
//}


function valuesend(){
	window.open("", "value", "width=430, height=150,scrollbars=1, menubar=1, resizable=1"); 
                                           //새창의 타겟과 크기 같은 옵션을 지정

	document.frm.target ="value";             //새창에서 지정한 value옵션으로 타겟을 지정
	document.frm.action=getContextPath()+"/sendmail"; 
	document.frm.method="post";//새창으로 띄울 jsp
	document.frm.submit();
	
}

function sign_up(){
	window.open("", "value", "width=430, height=150,scrollbars=1, menubar=1, resizable=1"); 
                                           //새창의 타겟과 크기 같은 옵션을 지정

	document.frm.target ="value";             //새창에서 지정한 value옵션으로 타겟을 지정
	document.frm.action=getContextPath()+"/sign_up"; 
	document.frm.method="post";//새창으로 띄울 jsp
	document.frm.submit();
	
}

var uid = document.getElementById("email").val();

var para = 'email='+uid;	
$.ajax({
	type:"POST",
	url: "/kitri_spring01_co_co/check_id",		
	data: para,
	dataType : "json",
	success:function(data)
	{			
		if(data.result=="true"){				      	
			document.getElementById("result").innerHTML = "Alredy using";    	
x=1;
		}else{

			document.getElementById("result").innerHTML = "ok";	
			x=2;
		}
	}		
});


function findpwd(){
	window.open("", "value", "width=430, height=150,scrollbars=1, menubar=1, resizable=1"); 
                                           //새창의 타겟과 크기 같은 옵션을 지정

	document.frm2.target ="value";             //새창에서 지정한 value옵션으로 타겟을 지정
	document.frm2.action="/find"; 
	document.frm2.method="post";//새창으로 띄울 jsp
	document.frm2.submit();
	
}


/* 중복일때 이메일 인증 버튼 막기, 아니면 회원가입 */
$(document).ready(function(){
    $("#mailcode2").click(function(){
    	console.log("mailcode2");
    	if(x==1){
        alert("check your id");
    		return false;
        
    	}else{
    		valuesend();
    		}
    });
});

$("#mailcode2").click(function(){
	valuesend();
});


/*
$(document).ready(function(){
    $("#findpw").click(function(){
    	if(x==1){
        alert("check your id");
    		return false;
        
    	}else{valuesend();}
    });
});


function signin() {
	var idlog = document.getElementById("logemail").value;
	var passlog = document.getElementById("passwordinput").value;
	var para = 'logemail='+idlog+'passlog'+passlog;
	$.ajax({
		type:"POST",
		url:"/sign_in",		
		data: para,
		dataType : "json",
		success:function(data)
		{			
			if(data.result=="true"){				      	
				windows.location.href="index.jsp";
			}else{

				alert("아이디나 비밀번호가 틀렸습니다.");
			}
		}		
	});
}*/


//function signup(){
//	document.frm.action=getContextPath()+"/sign_up"; 
//	document.frm.method="post";//새창으로 띄울 jsp
//	document.frm.submit();
//}
//function signin(){
//	document.infrm.action=getContextPath()+"/sign_in"; 
//	document.infrm.method="post";//새창으로 띄울 jsp
//	document.infrm.submit();
//}

