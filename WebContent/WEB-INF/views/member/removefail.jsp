<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces = "true" %>    

<script>
	
	alert("아이디 ${member.id}님을 삭제 실패 했습니다.");
	window.opener.location.reload(true);
	window.close();
</script>