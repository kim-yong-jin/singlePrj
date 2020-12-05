<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>

  <div  style="max-width:1000px;min-width:420px;margin:0 auto;min-height:812px;">

<!-- Content Wrapper. Contains page content -->
  <div >
   <jsp:include page="/WEB-INF/views/content_header.jsp">
   	<jsp:param value="공지사항" name="subject"/>
   	<jsp:param value="수정" name="item"/>
   	<jsp:param value="modifyForm.do" name="url"/>
   </jsp:include>

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-info">
					<div class="card-body pad">
  						<form role="form" method="post" action="modify.do" name="modifyForm">
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>							
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" readonly
									name="writer" class="form-control" value="${loginUser.id }">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display:none"></textarea>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" >
					 <div class="float-right">
						<button type="button" class="btn btn-primary" id="modifyBtn" onclick = "submit();">수 정</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary " id="cancelBtn" onclick = "cancel();">취 소</button>
					</div>
					</div><!--end card-header  -->
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
    </section>
    <!-- /.content -->
  </div>
  </div>
   <%@ include file = "/WEB-INF/views/common/summernote.jsp" %>
  
  
  <script>
 
  	window.onload = function () {
	    SmartEditor_summernote($("#content"));
	}
  
  
  	function submit() {
  		
  		var title = $("input[name='title']");
  		if(title.val() == ""){
  			alert("제목은 필수입니다.");
  			title.focus();
  			return;
  		}
  		
  		
  		var content = $("input[name='content']");
  		if(title.val() == ""){
  			alert("내용은 필수입니다.");
  			content.focus();
  			return;
  		}
  		
		$("form").submit();
	}
  	
  	function cancel() {
		history.go(-1);
	}
  
  </script>
  
  
  <!-- /.content-wrapper -->