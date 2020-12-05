<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body>

  <!-- Content Wrapper. Contains page content -->
  <div >
 
    <!-- Main content -->
    <section class="content register-page" style="height: 586.391px;">       
		<div class="register-box" style="min-width:450px;">         
	    	<form action="<%=request.getContextPath()%>/member/detail.do"role="form" class="form-horizontal"  method="post">
	        	<div class="register-card-body" >
	            	<div class="row"  style="height:200px;">
						<div class="mailbox-attachments clearfix col-md-12" style="text-align: center;">							
							<div id="pictureView" style="border: 1px solid; width: 200px; height: 200px; border-radius: 50%; margin-left: 30%;"></div>														
							
						</div>
					</div>
					<br />
	                <div class="form-group row" >
	                  <label for="inputEmail3" class="col-sm-3 control-label text-right">아이디</label>
						<div class="col-sm-9">
	                  	<input name = "id" type="text" class="form-control" id ="inputId" value="${member.id }" readonly>
	                  </div>
	                </div>	               
	                <div class="form-group row">
	                  <label for="inputPassword3" class="col-sm-3 control-label text-right">이  름</label>
	                  <div class="col-sm-9">
	                  <input name = "name" type="text" class="form-control" id ="inputName" value="${member.name }" readonly>
	                  </div>
	                </div>
	                 <div class="form-group row">
	                  <label for="inputPassword3" class="col-sm-3 control-label text-right">이메일</label>
	                  <div class="col-sm-9">
					<input name = "email" type="text" class="form-control" id ="inputEmail" value="${member.email }" readonly>
	                  </div>
	                </div>
	                 <div class="form-group row">
	                  <label for="inputPassword3" class="col-sm-3 control-label text-right">전화번호</label>
	                  <div class="col-sm-9">   
	                  <input name = "phone" type="text" class="form-control" id ="inputPhone" value="${member.phone }" readonly>
	                  </div>                  
	                </div>               
	              </div>  
		          <div class="card-footer" >
		          		<div class="row">
			          		
			          		
			          		<div class="col-sm-3 text-center">
			          			<button class="btn btn-primary" type="button" id="modifyBtn" class="btn btn-warning ">
                                               <i>수정</i>
                             </button>
			          		</div>
		          			
		          			<div class="col-sm-4 text-center">
			          			<button class="btn btn-primary" type="button" id="modifypwdBtn" class="btn btn-warning ">
                                               <i>비밀번호 수정</i>
                             </button>
			          		</div>
			          		
			          		<div class="col-sm-3 text-center">
				          		<button class="btn btn-primary" type="button" id="deleteBtn" class="btn btn-warning ">
	                                               <i>탈퇴</i>
	                             </button>
			          		</div>
			          	
			          		<div class="col-xs-2 text-center">
			            		<button type="button" id="listBtn" onclick="CloseWindow();" class="btn btn-primary"> <i>닫기</i></button>
			            	</div>
		          	    </div>  	
		          </div>
	      	  </form>
      	  </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->



<%@ include file="detail_js.jsp" %>
</body>