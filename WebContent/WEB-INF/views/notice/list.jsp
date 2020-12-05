<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" />
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
				<c:forEach var="notice" items="${noticeList }" varStatus="status">
					<tr>
						<td>${notice.nno }</td>
						<td id="boardTitle"
							style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
							<a
							href="<%=request.getContextPath()%>/notice/detail.do?nno=${notice.nno}">${notice.title}</a>
						</td>

						<td>${notice.writer}</td>
						<td><fmt:formatDate value="${notice.regDate}"
								pattern="yyyy-MM-dd" /></td>

						<td><span class="badge bg-primary">${notice.viewcnt}</span></td>
					</tr>
				</c:forEach>
				</table>
				
			<div class="card-footer ">
				<%@ include file = "/WEB-INF/views/common/pagination.jsp" %>
			</div>
			
			</div>
		</div>
	</div>
	<script>

	window.onload=function(){
		var authority = "<c:out value='${loginUser.authority}'/>";
		$("#registbtn").on("click",function(){
			if(authority == "" || authority != 1){
				alert("관리자만 입력 가능합니다.");
				return;
			}
			location.href="<%=request.getContextPath()%>/notice/registform.do";
		});
		
	}
	</script>
</body>

