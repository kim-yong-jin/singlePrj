<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



  <!-- Content Wrapper. Contains page content -->
  <div >
   <jsp:include page="/WEB-INF/views/content_header.jsp">
   	<jsp:param value="자유게시판" name="subject"/>
   	<jsp:param value="수정" name="item"/>
   	<jsp:param value="modifyForm.do" name="url"/>
   </jsp:include>

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header row">
						<h4 class="col-md-8">글수정</h4>
						<div class="col-md-4">
							<div class="float-right">
								<button type="button" class="btn btn-warning" id="modifyBtn">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default " id="cancelBtn">취 소</button>
							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form role="form" method="post" action="modify.do" name="modifyForm">
							
							<input type="hidden" name="bno" value="${board.bno }" />
							<input type='hidden' name='page' value="${param.page}">
							<input type='hidden' name='perPageNum' value="${param.perPageNum}">
							<input type='hidden' name='searchType' value="${param.searchType}">
							<input type='hidden' name='keyword' value="${param.keyword}">
							
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" value="${board.title }"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" readonly
									name="writer" class="form-control" value="${board.writer }">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="content" id="content" rows="3"
									placeholder="500자 내외로 작성하세요.">${fn:escapeXml(board.content) }</textarea>
							</div>
							
							
							
							
						</form>
					</div><!--end card-body  -->
					
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
window.onload=function(){
	
	SmartEditor_summernote($("#content"));
	$('#modifyBtn').on('click',function(e){				
		var title=$('input[name="title"]');
		if(title.val()==""){
			alert("제목은 필수입니다.");			
			title.focus();
			return;
		}
		var form=document.modifyForm;		
		form.submit();
	});
	
	$('#cancelBtn').on('click',function(e){
		history.go(-1);
	});
}
</script>







  