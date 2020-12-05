<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Content Wrapper. Contains page content -->
  <div  style="max-width:1000px;min-width:420px;margin:0 auto;min-height:812px;">
   
   	<jsp:include page="/WEB-INF/views/content_header.jsp">
	   	<jsp:param value="공지사항" name="subject"/>
	   	<jsp:param value="list.do" name="url"/>
	   	<jsp:param value="상세보기" name="item"/>
   </jsp:include>
   
    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title">상세보기</h3>
						<div class="card-tools">
							<button type="button" id="modifyBtn" class="btn btn-primary">MODIFY</button>						
						    <button type="button" id="removeBtn" class="btn btn-primary">REMOVE</button>
						    <button type="button" id="listBtn" class="btn btn-primary">LIST</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
							<label for="title">제 목</label>
	                 		<span class = "form-control" id = "title" >${notice.title }</span>
						</div>
						<div class="row">	
							<div class="form-group col-sm-4" >
								<label for="writer">작성자</label>
								<span class = "form-control" id = "writer" >${notice.writer }</span>
							</div>		
							
							<div class="form-group col-sm-4" >
								<label for="regDate">작성일</label>
								<span class = "form-control" id = "regDate" ><fmt:formatDate value="${notice.regDate }" pattern = "yyyy-MM-dd"/></span>
								
							</div>
							<div class="form-group col-sm-4" >
								<label for="viewcnt">조회수</label>
								<span class = "form-control" id = "viewcnt" >${notice.viewcnt }</span>
							</div>
						</div>		
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div id = "content" class = "card">
								${notice.content }
							</div>
						</div>
												
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

	<form role = "form">
		<input type = "hidden" name = "nno" value = "${notice.nno }">
	</form>


<script>
	window.onload = function () {
		
		var formObj = $("form[role='form']");
		
		$("button#modifyBtn").on("click", function(event) {
			
			formObj.attr({
					'action' : 'modifyForm.do',
					'method' : 'get'
			});
			formObj.submit();
		});
		
		
		$("button#removeBtn").on("click", function(event) {
			
			var answer = confirm("정말 삭제하시겠습니까?");
			if(answer){
				
				formObj.attr({
					'action' : 'remove.do',
					'method' : 'post'
				});
				formObj.submit();
			}
			
		});
		
		
		$("button#listBtn").on("click", function(event) {
			location.href = "<%=request.getContextPath()%>/notice/list.do";
		});
	}

	
	

</script>








  
  