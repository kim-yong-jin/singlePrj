<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />

<body>
	<div >
    	
    		<jsp:include page ="/WEB-INF/views/content_header.jsp">
    			<jsp:param value="회원리스트" name="subject"/>
    			<jsp:param value="목록" name="item"/>
   			</jsp:include>
    			
	    <!-- Main content -->
    	<section class="content">
    	  <div class="card">    		
    	  	<div class="card-header with-border">
    	  		<button type="button" class="btn btn-primary" 	onclick="OpenWindow('registForm.do','회원등록',800,900);" >회원등록</button>
    	  		<div id="keyword" class="card-tools" style="width:550px;">
				  <div class="input-group row">	
				   <!-- sort num -->
				  	<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
				  		<option value="10" >정렬개수</option>
				  		<option value="2" ${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>
				  		<option value="3" ${cri.perPageNum == 3 ? 'selected':''}>3개씩</option>
				  		<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
				  		
				  	</select>
				  <!-- search bar -->	  										
					<select class="form-control col-md-3" name="searchType" id="searchType">
						<option value=""  ${cri.searchType eq '' ? 'selected':''}>검색구분</option>
						<option value="i"  ${cri.searchType eq 'i' ? 'selected':''}>아이디</option>
						<option value="p"  ${cri.searchType eq 'p' ? 'selected':''}>전화번호</option>
						<option value="e"  ${cri.searchType eq 'e' ? 'selected':''}>이메일</option>
					</select>		
					
					<input  class="form-control" type="text" name="keyword" 
					placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
					
					<span class="input-group-append">
						<button class="btn btn-primary" type="button" 
						id="searchBtn" data-card-widget="search" onclick="searchList_go(1);">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
					<!-- end : search bar -->
				  </div>
				 </div>    	  		
    	  	</div>	  
    		<div class="card-body" style="text-align:center;">
    		  <div class="row">
	             <div class="col-sm-12">	
		    		<table class="table table-bordered">
		    			<tr>
		                	<th>아이디</th>
		                	<th>패스워드</th>
		                	<th>이메일</th>
		                	<th>전화번호</th>
		                	<th>등록날짜</th> <!-- yyyy-MM-dd  -->
		               	</tr>
		               	<c:forEach var="member" items="${memberList}" varStatus="status">	
		               	<tr>
		               		<td>
		               			<a href="javascript:OpenWindow('detail.do?id=${member.id }','회원상세보기',800,700);">${member.id }</a>
		               		</td>
		               		<td>${member.pwd }</td>
		               		<td>
		               			<a href="javascript:OpenWindow('mail.do?id=${member.id }','이메일보내기',800,700);">${member.email }</a>
		               		</td>
		               		<td>
		               			<a href="tel:${member.phone }">${member.phone }</a></td>
		               		<td>
		               			<fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd"/>
		               		</td>
		               	</tr>
		               	</c:forEach>
		    		</table>
    		   </div> <!-- col-sm-12 -->
    		 </div> <!-- row -->
    		</div> <!-- card-body -->
    		<div class="card-footer">
    			<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
    		</div> <!-- card-footer -->
          </div> <!-- card  -->
    	</section>	
   </div>
   </div>

<script>
</script>

</body>

