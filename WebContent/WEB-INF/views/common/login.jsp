<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true" %>        
<!DOCTYPE html>
<html lang="en">

<head>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
		
		$(function(){
			$("#back").on("click",function(){
				location.href="<%=request.getContextPath()%>/index.do";
			})
			
			
		})
			
		
		$(document).ready(function(){
 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("key");
		    $("#id").val(key); 
		     
		    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#idRem").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		     
		    $("#idRem").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#idRem").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key");
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idRem").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
		        }
		    });
		});
	 
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
	}
	</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WebKY</title>
					
    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
	
    <div class="container" style="margin: 130px; margin-left: 400px;">

        <!-- Outer Row -->
        <div class="row justify-content-center" >

            <div class="col-xl-10 col-lg-12 col-md-9" style=" margin-right: 150px;">
		
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6" style = "margin-top: 50px; background-image:url('<%=request.getContextPath()%>/resources/img/2222.jpg');
                            		background-size: contain ; background-repeat: no-repeat ;"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                   <form action="<%=request.getContextPath() %>/common/login.do" method="post">
                                       
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                              id ="id"  name = "id" aria-describedby="idHelp" 
                                                placeholder="Enter ID..." >
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name ="pwd"  placeholder="Enter Password...">
                                        </div>
                                        
                                        <div class="form-group">
                                             <div class="form-check">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" id="idRem" value="">Remember Me
											  </label>
											</div>
                                        </div>
                                       
                                       	<button type ="submit" class="btn btn-primary btn-user btn-block">
                                       					Login</button>
                               		     <a href="<%=request.getContextPath()%>/index.do" class="btn btn-primary btn-user btn-block">
	                                    		<i >Back</i>
	                               		</a>
                                   
                                
                                   
                                    <div class="text-center">
                                        <a class="small" href="<%=request.getContextPath()%>/member/registForm.do">Create an Account!</a>
                                      <br>  <a class="small" href="<%=request.getContextPath()%>/member/passfindForm.do">Forgot Password?</a>
                                    </div>
                                   </form>
                                </div>
                                
                            </div>
                                  
                        </div>
                          
                    </div>
                  
                </div>

            </div>

        </div>

    </div>
   
    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	
    <!-- Custom scripts for all pages-->
    <script>
		var message="${msg}";
		if(message!=""){
			alert(message);
		}
		
		
	</script>
	<% session.removeAttribute("msg"); %>
    <script src="<%=request.getContextPath()%>/resources/js/sb-admin-2.min.js"></script>

</body>

</html>