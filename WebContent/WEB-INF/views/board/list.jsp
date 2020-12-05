<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="boardList" value="${dataMap.boardList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />



<head>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>게시글 목록</title>
	<style>
		
		table th,td{
			text-align:center;		
		}
		
	</style>
</head>	
	
<body id="page-top">

	<div id="wrapper">

		<div class="container">
				
			<br>
			<div id="keyword" class="card-tools" style="width:350px; float: right;margin-bottom: 25px;">
			<button type="button"  style="float: right; margin: 20px;" id ='registbtn'class="btn btn-primary">새 글 작성</button>
					<div class="input-group row" >	
						<select class="form-control col-md-4" name="searchType" id="searchType" >
						
							<option value = "twc" ${cri.searchType eq 'c' ? selected : '' }>전체</option>
							<option value = "t" ${cri.searchType eq 't' ? selected : '' }>제목</option>
							<option value = "w" ${cri.searchType eq 'w' ? selected : '' }>작성자</option>
							<option value = "c" ${cri.searchType eq 'c' ? selected : '' }>내용</option>
						
						
						
						
							<!-- option -->
						</select>	
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요."  value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="searchList_go(1);" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>			
		<div class="card-body">
			<table class="table table-bordered text-center table table-hover">
				<tr style="font-size: 0.95em;">
					<th style="width: 10%;">번 호</th>
					<th style="width: 50%;">제 목</th>
					<th style="width: 15%;">작성자</th>
					<th>등록일</th>
					<th style="width: 10%;">조회수</th>
				</tr>
				<c:if test="${empty dataMap.boardList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>		
					<c:forEach var="board" items="${boardList }" varStatus="status">
						<tr>
							<td>${board.bno }</td>
							<td id="boardTitle"
								style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								<a
								href="<%=request.getContextPath() %>/board/detail.do?bno=${board.bno}">${board.title}</a>
									<c:if test="${board.replycnt ne 0 }">		
										<span class="nav-item">															
										&nbsp;&nbsp;<i class="fa fa-comment"></i>
										<span class="badge badge-warning navbar-badge">${board.replycnt}</span>
										</span>
										
									</c:if>
							</td>

							<td>${board.writer}</td>
							<td><fmt:formatDate value="${board.regdate}"
									pattern="yyyy-MM-dd" /></td>

							<td><span class="badge bg-primary">${board.viewcnt}</span></td>
						</tr>
					</c:forEach>
				</table>
				
			<div class="card-footer ">
				<%@ include file = "/WEB-INF/views/common/pagination.jsp" %>
			</div>
			
			</div>
		</div>
	</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<script>

	window.onload=function(){
		var id = "<c:out value='${loginUser.id}'/>";
		$("#registbtn").on("click",function(){
			if(id == "" || id == null){
				alert("회원만 작성 가능합니다..");
				return;
			}
			location.href="<%=request.getContextPath()%>/board/registform.do";
		});
		
	}
	</script>
</body>  