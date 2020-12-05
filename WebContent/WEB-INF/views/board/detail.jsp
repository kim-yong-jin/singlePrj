<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:1000px;min-width:420px;margin:0 auto;min-height:812px;">
   
   	<jsp:include page="/WEB-INF/views/content_header.jsp">
	   	<jsp:param value="자유게시판" name="subject"/>
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
							<button type="button" id="modifyBtns"  class="btn btn-primary">MODIFY</button>						
						    <button type="button" id="removeBtn" class="btn btn-primary">REMOVE</button>
						    <button type="button" id="listBtn" class="btn btn-primary">LIST</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
							<label for="title">제 목</label>
	                 		<span class = "form-control" id = "title" >${board.title }</span>
						</div>
						<div class="row">	
							<div class="form-group col-sm-4" >
								<label for="writer">작성자</label>
								<span class = "form-control" id = "writer" >${board.writer }</span>
							</div>		
							
							<div class="form-group col-sm-4" >
								<label for="regDate">작성일</label>
								<span class = "form-control" id = "regDate" ><fmt:formatDate value="${board.regdate }" pattern = "yyyy-MM-dd"/></span>
								
							</div>
							<div class="form-group col-sm-4" >
								<label for="viewcnt">조회수</label>
								<span class = "form-control" id = "viewcnt" >${board.viewcnt }</span>
							</div>
						</div>		
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div id = "content" class = "card">
								${board.content }
							</div>
						</div>
												
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
		<!-- reply component start --> 
		<div class="row">
			<div class="col-md-12">
				<div class="card card-info">					
					<div class="card-body">
						<!-- The time line -->
						<div class="timeline">
							<div class="time-label" id="repliesDiv" style="margin-bottom: 20px;">
								<span class="bg-green">Replies List </span>							
							</div>
							<div class="replyLi" data-rno={{rno}}>
								<i class="fas fa-comments bg-yellow"></i>
							 
							</div>
						</div>
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center m-0">
								
							</ul>
						</div>
					</div>
					<div class="card-footer">
						<label for="newReplyWriter">Writer</label>
						<hr>
						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" readonly value="${loginUser.id }"> 
						<label for="newReplyText">Reply Text</label>
						<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newReplyText">
						<br/>
						<button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
						
					</div>				
				</div>			
				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
		
		
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <form role="form">
  	<input type='hidden' name='bno' value ="${board.bno}">
  	<input type='hidden' name='page' value ="${param.page}">
    <input type='hidden' name='perPageNum' value ="${param.perPageNum}">
    <input type='hidden' name="searchType" 
		         value="${param.searchType }" />
	<input type='hidden' name="keyword" 
		         value="${param.keyword }" />
  </form>

<!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<%@ include file="replyAndDetail_js.jsp" %>
