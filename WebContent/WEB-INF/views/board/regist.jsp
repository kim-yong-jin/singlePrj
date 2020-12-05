<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


  <!-- Content Wrapper. Contains page content -->
  	 <div  style="max-width:1000px;min-width:420px;margin:0 auto;min-height:812px;">
  
   <jsp:include page="/WEB-INF/views/content_header.jsp">
   	<jsp:param value="자유게시판" name="subject"/>
   	<jsp:param value="list.do" name="url"/>
   	<jsp:param value="등록" name="item"/>
   </jsp:include>

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-info">
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
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
						<div class="card-header" style="float: right;">
							<button type="button" class="btn btn-primary" id="registBtn">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="cancelBtn">취 소</button>
						</div>
					</div><!--end card-header  -->
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
    </section>
    </div>
  <!-- /.content-wrapper -->
<script>
	window.onload=function(){
		
		SmartEditor_summernote($("#content"));
			$('#registBtn').on('click',function(e){
				//alert("regist click");
				var form=document.registForm;
				
				if(form.title.value==""){
					alert("제목은 필수입니다.");
					return;
				}
				
				if(form.content.value.length>1000){
					alert("글자수가 1000자를 초과할 수 없습니다.");
					return;
				}
				
				form.submit();
			});
	}
	
	
	
</script>

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>










  