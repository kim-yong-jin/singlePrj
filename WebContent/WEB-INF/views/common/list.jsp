<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />



<head>
	<title>게시글 목록</title>
	<style>
		
		table th,td{
			text-align:center;		
		}
		
	</style>
</head>	
	
<body>
  
        <jsp:include page="/WEB-INF/views/content_header.jsp">
    		<jsp:param value="공지사항" name="subject"/>
    		<jsp:param value="목록" name="item"/>
    	</jsp:include> 
	
    <!-- Main content -->
    <section class="content">		
		<div class="card">
			<div class="card-header with-border">
					<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do','공지등록',600,400);">공지등록</button>		
						
				<div id="keyword" class="card-tools" style="width:350px;">
					<div class="input-group row">						
						<select class="form-control col-md-4" name="searchType" id="searchType">
						
							<option value = "twc" ${cri.searchType eq 'c' ? selected : '' }>전체</option>
							<option value = "t" ${cri.searchType eq 't' ? selected : '' }>제목</option>
							<option value = "w" ${cri.searchType eq 'w' ? selected : '' }>작성자</option>
							<option value = "c" ${cri.searchType eq 'c' ? selected : '' }>내용</option>
						
							<option value = "tc" ${cri.searchType eq 'tc' ? selected : '' }>제목/내용</option>
							<option value = "cw" ${cri.searchType eq 'cw' ? selected : '' }>작성자/내용</option>
						
						
						
							<!-- option -->
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="searchList_go(1);" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body">
				<table class="table table-bordered text-center" >					
					<tr style="font-size:0.95em;">
						<th style="width:10%;">번 호</th>
						<th style="width:50%;">제 목</th>
						<th style="width:15%;">작성자</th>
						<th>등록일</th>
						<th style="width:10%;">조회수</th>
					</tr>				
					     <c:forEach var = "notice" items = "${noticeList }" varStatus = "status">
		                <tr>
		                	<td>${notice.nno }</td>
							<td id = "boardTitle" style ="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								<a href = "javascript:OpenWindow('detail.do?nno=${notice.nno}','상세보기',800,700);">${notice.title}</a>
							</td>		                
		                
							<td>
								${notice.writer}
							</td>		                
							<td>
								<fmt:formatDate value="${notice.regDate}" pattern = "yyyy-MM-dd"/>
							</td>		                
		                
							<td>
								<span class = "badge bg-red">${notice.viewcnt}</span>
							</td>		                
		                </tr>
		                </c:forEach>
					
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file = "/WEB-INF/views/common/pagination.jsp" %>
			</div>
		</div>
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	
</body>  