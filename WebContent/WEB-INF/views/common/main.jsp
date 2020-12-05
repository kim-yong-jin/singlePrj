<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces = "true" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class = "row" style="width:1200px;margin-left: 100px; ">
		<div class = "content col-sm-6">
			<div class = "content-header">
				<div class="card shadow  ">
					<div class="card-header py-2">
						<h6 class="m-0 font-weight-bold text-primary">공 지 사 항
							</h6>
					</div>
					<div class="card-body ">
						<table class="table table-bordered text-center table table-hover">
							<tr style="font-size: 0.95em;">
								<th style="width: 10%;">번 호</th>
									<th style="width: 50%;">제 목</th>
								<th style="width: 15%;">작성자</th>
							</tr>
							<c:forEach var="notice" items="${dataMap.noticeList }" varStatus="status">
								
								<tr>
								<c:if test="${status.count le 4 }">    
									<td><c:out value="${status.count}" /> </td>
									<td id="boardTitle"
										style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a
										href="<%=request.getContextPath()%>/notice/detail.do?nno=${notice.nno}">${notice.title}</a>
									</td>
									<td>${notice.writer}</td>
								</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
					</div>
			</div>
		</div>
		
		<div class = "content col-sm-6" >
			<div class = "content-header">
				<div class="card shadow  ">
					<div class="card-header py-2">
						<h6 class="m-0 font-weight-bold text-primary">자 유 게 시 판
							</h6>
					</div>
					<div class="card-body ">
						<table class="table table-bordered text-center table table-hover">
							<tr style="font-size: 0.95em;">
								<th style="width: 10%;">번 호</th>
									<th style="width: 50%;">제 목</th>
								<th style="width: 15%;">작성자</th>
							</tr>
							<c:forEach var="board" items="${dataMap.boardList }" varStatus="status">
								
								<tr>
								<c:if test="${status.count le 4 }">    
									<td><c:out value="${status.count}" /> </td>
									<td id="boardTitle"
										style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a
										href="<%=request.getContextPath()%>/board/detail.do?bno=${board.bno}">${board.title}</a>
									</td>
									<td>${board.writer}</td>
								</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
					</div>
					</div>
			</div>
		</div>
		
		
	</div>
	
	<div class = "row" style="width:1200px;margin-left: 100px; ">
		<div class = "content col-sm-6">
			<div class = "content-header">
				<div class="card shadow  ">
					<div class="card-header py-2">
						<h6 class="m-0 font-weight-bold text-primary">구 인 구 직 
							</h6>
					</div>
					<div class="card-body ">The styling for this basic card
						example is created by using default Bootstrap utility classes. By
						using utility classes, the style of the card component can be
						easily modified with no need for any custom CSS!</div>
					</div>
			</div>
		</div>
		
		<div class = "content col-sm-6">
			<div class = "content-header">
				<div class="card shadow  ">
					<div class="card-header py-2">
						<h6 class="m-0 font-weight-bold text-primary">질 문 게 시 판
							</h6>
					</div>
					<div class="card-body ">The styling for this basic card
						example is created by using default Bootstrap utility classes. By
						using utility classes, the style of the card component can be
						easily modified with no need for any custom CSS!</div>
					</div>
			</div>
		</div>
		
	</div>
</body>