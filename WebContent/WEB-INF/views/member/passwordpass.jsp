<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces = "true" %>    

<script>
	alert("${member.id}님 비밀번호를 변경완료 하셨습니다..");
	location.href="<%=request.getContextPath()%>/index.do";
</script>

