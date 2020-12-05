<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WeBKy - Register</title>

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath() %>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath() %>/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




<style>
button{
	
    margin-left: 130px;
	
}



</style>
</head>

<body class="bg-gradient-primary">
 <form role="form" class="form-horizontal" action="regist.do" method="post"    >
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block" style=" margin-top: 50px; background-image:url('<%=request.getContextPath()%>/resources/img/aaaa1.jpg');
                   			 background-size: contain ; background-repeat: no-repeat ;"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                           
                            
                            	<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    
                                        <input type="text" class="form-control form-control-user" style="width: 150%;" id="id" name ="id"
                                            placeholder="Enter ID...">
                                            
                                            
                                    </div>
                                   <button class="btn btn-primary" id ="login" type="button" onclick="idCheck_go();" >
                                               <i>중복확인</i></button>
                                </div>
                                
                                <div class="mb-20 form-group">
                                    <input type="password" class="form-control form-control-user" id="pwd" name = "pwd"
                                       onkeyup="chkPW();" placeholder="Enter password...">
                                      <div class = "reply" id = "namemsg"></div>
                                </div>
                                
                               	<div class="mb-20 form-group">
                                    <input type="password" class="form-control form-control-user" id="pwd2" name = "pwd2"
                                        placeholder="Enter password...">
                                      <div class = "reply" id = "namemsg" ></div>
                                </div>
                                
                                <div class="mb-20 form-group">
                                    <input type="text" class="form-control form-control-user" id="name" name = "name"
                                      onkeyup="nameChk();"  placeholder="Enter name...">
                                      <div class = "reply" id = "namemsg" ></div>
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    
                                       <input type="email" class="form-control form-control-user"
											style="width: 150%;" id="email1" name="email1"
											 placeholder="Enter Email...">
                                            
                                    </div>
                                   <button class="btn btn-primary" id ="emailchk1"  name ="emailchk1" type="button"  onclick="chkmail();">
                                               <i>인증번호 전송</i></button><br>
                                </div>
                                
                             
                                 <div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">

										<input type="email" class="form-control form-control-user"
											style="width: 150%;" id="email2" name="email2"
											placeholder="Enter EmailNum...">
									</div>
									
									<button class="btn btn-primary" name="mailinput" id = "mailinput" type="button" onclick="emailnum();">
                                               <i>인증하기</i></button>
                                </div>
                                

                                 <div class="mb-20 form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">

										<input type="email" class="form-control form-control-user"
											style="width: 150%;" id="phone1" name="phone1"
											 placeholder="Enter Phone...">
									</div>
                                    
									<button class="btn btn-primary" id ="phonechk"  name ="phonechk" type="button" onclick="phone_Chk();" >
                                              <i>인증번호 전송</i></button>
                                     <div class = "reply" id = "namemsg" style="margin-left: 25px;"></div>
                                </div>
                                
                                
                                 <div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">

										<input type="email" class="form-control form-control-user"
											style="width: 150%;" id="phone2" name="phone2"
											placeholder="Enter PhoneChkNum...">
									</div>
									
									<button class="btn btn-primary" name="phoneinput" id = "phoneinput" type="button" onclick="phone_num();">
                                               <i>인증하기</i></button>
                                </div>
                                <hr>
                                   <button class="btn btn-primary" name="phoneinput" id = "phoneinput" type="button" onclick="submit_go();">
                                   <i>가입하기</i></button>
                                <a href="<%=request.getContextPath()%>/common/loginForm.do" class="btn btn-primary">
                                    <i >Back</i>
                                </a>
                                </div>
                                
                             
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>

</form>
    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath() %>/resources/js/sb-admin-2.min.js"></script>
	<%@ include file="regist_js.jsp" %>
	
	
	



</body>

</html>