<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces = "true" %>    
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<head>
<style type="text/css">
.thumbnail {
	padding: 0px;
}

.panel {
	position: relative;
}

.panel>.panel-heading:after, .panel>.panel-heading:before {
	position: absolute;
	top: 11px;
	left: -16px;
	right: 100%;
	width: 0;
	height: 0;
	display: block;
	content: " ";
	border-color: transparent;
	border-style: solid solid outset;
	pointer-events: none;
}

.panel>.panel-heading:after {
	border-width: 7px;
	border-right-color: #f7f7f7;
	margin-top: 1px;
	margin-left: 2px;
}

.panel>.panel-heading:before {
	border-right-color: #ddd;
	border-width: 8px;
}
</style>


</head>

<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}

<div class="replyLi">
<div class="container">
<div class="row">
<div class="col-sm-12">

</div><!-- /col-sm-12 -->
</div><!-- /row -->
<div class="row">
<div class="col-sm-1">
<div class="thumbnail">
<img class="img-circle user-photo " src="<%=request.getContextPath()%>/replies/getPicture.do?id={{replyer}}">

</div><!-- /thumbnail -->
</div><!-- /col-sm-1 -->

<div class="col-sm-5">
<div class ="timeline-item"     style= "width: 800px;">
<div class="panel panel-default">
<div class="panel-heading">
  		<h5 class="timeline-header"><strong style="display:none;">{{rno}}</strong>{{replyer}}</h5>

		<span class="time" style="float: right;margin-top: -25px;">
    		<i class="fa fa-clock"></i>{{prettifyDate regdate}}
	 		<a class="btn btn-primary btn-xs" id="modifyReplyBtn" data-rno={{rno}}
	    		data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal" 
				style = "display : {{checkOwner replyer}}">Modify
			</a>
  		</span>

</div>
<div class="panel-body">
<div class="timeline-body" id="{{rno}}-replytext">{{replytext}} </div>
</div><!-- /panel-body -->
</div><!-- /panel panel-default -->
</div><!-- /col-sm-5 -->
</div>
{{/each}}	
</script>



<script>

window.onload = function () {
	
	var loginUserid = "<c:out value='${loginUser.id}'/>";
	
	var replyPage = 1;

	var formObj = $("form[role='form']");
	var writerId ="<c:out value ='${board.writer}'/>";
	
	
	$('button#modifyBtns').on('click',function(evnet){
		if(loginUserid != writerId){
			alert("작성자 본인만 수정 할 수 있습니다.");
			return;
		}

		formObj.attr({
			'action':'modifyForm.do',
			'method':'post'
		});
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		if(loginUserid != writerId){
			alert("작성자 본인만 삭제 할 수 있습니다.");
			return;
		}

		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){		
			formObj.attr("action", "remove.do");
			formObj.attr("method", "post");
			formObj.submit();
		}
	});
	
	$("#listBtn").on("click", function(){
		location.href="<%=request.getContextPath()%>/board/list.do";
	});	
	
	////////리플
	getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+replyPage);
	
	
	
	
	
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.replyList, $("#repliesDiv"), $("#reply-list-template"));
			printPaging(data.pageMaker, $(".pagination"));
		});
	}
	
	
	$('.pagination').on('click', 'li a', function (event) {
		
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page=" + replyPage);
		
	});
	
	
	$('#replyAddBtn').on('click',  function (event) {
		if(loginUserid == null || loginUserid == ""){
			alert("댓글 작성은 회원만 할 수 있습니다.");
			return;
		}
		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();
		
		if(replytext==""){
			alert("댓글은 필수입니다.");
			$("#newReplyText").focus().css("border-color", "red").attr("placeholder", "내용은 필수입니다.");
			return;
		}
		
		var data = {
				"bno" : "${board.bno}",
				"replyer" : replyer,
				"replytext" : replytext
		}
		
		$.ajax({
			
			url : "<%= request.getContextPath()%>/replies/add.do",
			type : "post",
			data : JSON.stringify(data),
			success : function (data) {
				alert("댓글이 등록되었습니다.");
				getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page="+data);
				$("#newReplyText").val("");
				
			},
			error : function (error) {
				alert("댓글 등록이 실패하였습니다.");
			}
			
		});
		
	});
	
	$("div.timeline").on("click", "#modifyReplyBtn",function (event) {
		/* alert("modi relybtn click"); */
		
		var rno = $(this).attr("data-rno");
		var replyer = $(this).attr("data-replyer");
		var replytext = $("#" + rno + "-replytext").text();
		
		$("#replytext").val(replytext);
		$(".modal-title").text(rno);
		
		
	});
	
	
	$("#replyModBtn").on("click", function (event) {
		
		var rno = $(".modal-title").text();
		var replytext = $("#replytext").val();
		
		var sendData = {
				rno : rno,
				replytext : replytext
		};
		alert(rno);
		alert(replytext);
		$.ajax({
			
			url : "<%=request.getContextPath()%>/replies/update.do",
			type : "post",
			data : JSON.stringify(sendData),
			success : function (result) {
				alert("수정되었습니다.");
				getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page=" + replyPage);
			},
			error : function (error) {
				alert("수정 실패");
				
			},
			complete : function () {
				history.go(0);
			}
			
		});
		
		
	})
	
	$("#replyDelBtn").on("click", function (event) {
		
		alert("del");
		
		var rno = $(".modal-title").text();
		
		var sendData = {
				bno : "${board.bno}",
				rno : rno,
				page : replyPage 
		};
		
		$.ajax({
			
			url : "<%= request.getContextPath()%>/replies/remove.do",
			type : "post",
			data : JSON.stringify(sendData),
			success : function (page) {
				alert("삭제되었습니다.");
				replyPage = page;
				getPage("<%=request.getContextPath()%>/replies/list.do?bno=${board.bno}&page=" + page);
			},
			error : function (error) {
				alert("삭제 실패");
			},
			complete : function () {
				history.go(0);
			}
			
		});
		
		
	})
	
}




var printData=function(replyArr, target, templateObject){
	
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
	
}


Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var day = dateObj.getDate();
	return year + "/" + month + "/" + day;
});

Handlebars.registerHelper("checkOwner", function(replier) {
	var replierName = replier;
	var loginUserName = "${loginUser.id}";
	
	if(replierName != loginUserName)
		return "none";
	else{
		return "visible";
	}
	
});

Handlebars.registerHelper("getPicture", function(replyer) {
	
	var data = {id : replyer};
	var src = "<%=request.getContextPath()%>/member/getPicture.do?picture=";
	$.getJSON("<%= request.getContextPath()%>/member/getMemberToJson.do", data , function (result) {
		
		if(result){
			src+=result.picture;
		}else{
			src+="default.jpg";
		}
		
		$("img[data-target='"+ replyer+ "']").attr("src", src);	
			
	});
	
})


var printPaging=function(pageMaker, target){
	
	var str = "";
	if(pageMaker.prev){
		str += "<li class = 'page-item'><a class = 'page-link' href ='"+ (pageMaker.startPage-1)
		+ "'> <i class = 'fas fa-angle-left'/> </a></li>";
	}
	for(var i = pageMaker.startPage; i<= pageMaker.endPage; i++){
		var strClass = pageMaker.cri.page == i ? 'active' : '';
		str += "<li class = 'page-item "+ strClass +"'><a class = 'page-link' href = '" + i + "'>" +
		i + "</a><li>";
	}
	if(pageMaker.next){
		str += "<li class = 'page-item'><a class = 'page-link' href ='"+ (pageMaker.endPage+1)
		+ "'> <i class = 'fas fa-angle-right'/> </a></li>";
	}
	target.html(str);
}






</script>