<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body>

  <!-- Content Wrapper. Contains page content -->
  <div>
  	<jsp:include page="/WEB-INF/views/content_header.jsp">
 		
		<jsp:param value="회원관리" name="subject"/>	
		<jsp:param value="수정하기" name="item"/>	
		<jsp:param value="list.do" name="url"/>	
	</jsp:include>
  <!-- Main content -->
  <section class="content register-page" >
	<form role="form" class="form-horizontal" action="remove.do" method="post">	
		<div class="register-box" style="min-width:450px;">	
			<div class="register-card-body">	
				 <div class="form-group row" >
	                  <label for="inputEmail3" class="col-sm-3 control-label text-right">아이디</label>
						<div class="col-sm-9">
	                  	<input name = "id" type="text" class="form-control" id ="inputId"  name = "id" value="${member.id }" readonly>
	                  </div>
	                </div>	
				
				<div class="form-group row">
					<label for="pwd" class="col-sm-3 control-label text-center" >비밀번호</label>

					<div class="mb-20 col-sm-9">
						<input name="pwd" type="password" class="form-control" id="pwd"
						onclick="chkPW()"	placeholder="Enter password...">
						<div class = "reply" id = "namemsg"></div>
					</div>
				</div>
						
				
				<div class="form-group row">
					<label for="email" class="col-sm-3 control-label text-center">비밀번호 중복</label>

					<div class="mb-20 col-sm-9">
						<input name="pwd" type="password" class="form-control" id="pwd2"
							placeholder="Enter password..." >
						<div class = "reply" id = "namemsg"></div>
					</div>
				</div>
				
				<div class="card-footer row" style="margin-top: 0; border-top: none;">						
					<button type="button" id="modifypwdBtn" 
						class="btn btn-warning col-sm-4 text-center" >탈퇴하기</button>
					<div class="col-sm-4"></div>
					<button type="button" id="cancelBtn"
						class="btn btn-default pull-right col-sm-4 text-center">취 소</button>
				</div>	
			</div>
		</div>
	</form>

  </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 <%@ include file="modify_js.jsp" %>
</body>


