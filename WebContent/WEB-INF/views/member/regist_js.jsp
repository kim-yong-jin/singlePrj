<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script>
	var idPass= false;
	var pwPass= false;
	var pwPass2 = false;
	var namePass = false;
	var mailPass = false;
	var phonePass = false;
	
	
	//아이디 정규식 및 중복검사
	function idCheck_go(){
		var input_ID = $('input[name="id"]');
		
		if(input_ID.val() == ""){
			alert("아이디를 입력하세요");
			
			input_ID.focus();
			return;
		}else{
			var reqID = /^[a-z]{1}[a-zA-z0-9]{3,12}$/;
			
			if(!reqID.test($('input[name="id"]').val())){
				alert("아이디는 첫글자는 영소문자이며, \n4~13자의 영문자와 숫자로만 입력해야 합니다.");
				$('input[name="id"]').focus();
				return;
			}
		}
		
		var data = {id : input_ID.val().trim()};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/member/idCheck.do",
			data:data,
			type:'post',
			success:function(result){
				console.log(result);
				
				if(result){
					alert("사용가능한 아이디 입니다.");
					idPass = true;
					$('input[name="id"]').val(result);
				}else{
					alert("중복된 아이디 입니다.");
					$('input[name="id"]').focus();
				}
			},
			error:function(error){
				alert("시스템 장애로 가입이 불가능 합니다.");
			}
		});
	}
	
	
	/*------------------------------------------------------------------------------ */
	//비밀번호 정규식 및 두 값이 같은지 확인
	function chkPW(){
		
		$("#pwd").on("keyup",function(){
			passval = $(this).val().trim();
			regpwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			
			if(!regpwd.test(passval)){
				regfail(this,"올바른 형식이 아닙니다");
				pwPass= false;
			}
			else if(regpwd.test(passval)){
				regfail(this,"사용가능한 비밀번호 입니다");
				pwPass= true;
				
			}
			else{
				regpass(this);
			}
		});
		
		$("#pwd2").on("keyup",function(){
			pass2val = $(this).val().trim();
			passval = $("#pwd").val().trim();
			
			if(pass2val == passval) {
				regpass(this,"비밀번호가 일치 합니다");
				pwPass2 = true;
			}
			else{ 
				regfail2(this,"일치하지 않습니다");
				pwPass2 = false;
			}
		});

	}
	
	function nameChk(){
		$("#name").on("keyup",function(){
			passval = $(this).val().trim();
			var reg = /^[가-힣]{2,5}$/;
		
				
			if(!reg.test(passval)){
				regfail3(this,"사용불가능 이름 입니다");
				namePass= false;
			}
			else if(reg.test(passval)){
				regfail3(this,"사용가능한 이름 입니다");
				namePass= true;
			}
			else{
				regpass(this);
			}
		});
	}
	/*------------------------------------------------------------------------------ */
	//이메일 인증번호 전송 및 정규식
	function chkmail(){
	
		var input_email = $('input[name="email1"]');
		
		if(input_email.val() == ""){
			alert("이메일을 입력하세요");
			
			input_email.focus();
			return;
		}else{
			var regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
			if(!regemail.test($('input[name="email1"]').val())){
				alert("이메일을 정확히 입력 해주세요");
				$('input[name="email1"]').focus();
				return;
			}
		}

		var data = {email :  input_email.val().trim()};
		
		$.ajax({
			url : '<%=request.getContextPath()%>/member/SendEmailAction.do',
			data : data,
			type : 'get',
			success : function(res) {
				if(res){
					alert("전송완료!!!!");
					
					$("#email1").attr("readonly",true);
					
				}else{
					alert("전송실패")
					$('input[name="email1"]').focus();
				}
			},
			error : function (req){
				alert("시스템 장애로 가입이 불가능 합니다.");
			}
		});	
			
	}
	
	/*------------------------------------------------------------------------------ */
	//일반회원 인증번호입력
	function emailnum(){
		var input_emailnum = $('input[name="email2"]');
		
		if(input_emailnum.val() == ""){
			alert("인증번호를 입력하세요");
			
			input_emailnum.focus();
			return;
		}
		
		mailinput = $("#email2").val();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/member/GetEmailAction.do',
			type : "post",
			data : {"mailinput" : mailinput},
			success : function(res) {
				if(mailPass == true){
					alert("이미 인증하셨습니다.");
					return;
				}
				alert(res);
				if(res == "인증완료"){
					$("#email2").attr("readonly",true);
					mailPass= true;
					
				}else{
					mailPass= false;
				
				}
			},
			error : function (req){
				alert("req : " + req.status);
			},
			dataType : 'text'
		});
	
	}
	/*------------------------------------------------------------------------------ */
	//휴대폰  정규식 및 인증번호 전송
	
	function phone_Chk(){
		var input_phone = $('input[name="phone1"]');
		
		if(input_phone.val() == ""){
			alert("전화번호를 입력하세요");
			
			input_phone.focus();
			return;
		}else{
			var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
			
			if(!regExp.test($('input[name="phone1"]').val())){
				alert("전화번호를 정확히 입력 해주세요");
				$('input[name="phone1"]').focus();
				return;
			}
		}
		
		//phone = $("#phone1").val();
		
		
		var data = {phone :  input_phone.val().trim()};
	<%-- 	$.ajax({
			url:"<%=request.getContextPath()%>/member/phonechk.do",
			data:data,
			type:'post',
			success:function(result){
				console.log(result);
				if(!result){
					alert("이미 사용중인 전화번호 입니다.");
					$('input[name="phone1"]').focus();
					return;
				}else{
					
				}
			},
			error:function(error){
				alert("시스템 장애로 가입이 불가능 합니다.");
			}
		});

		 --%>
	
		 $.ajax({
				url : '<%=request.getContextPath()%>/member/SendPhoneNumAction.do',
				type : 'get',
				data : data,
				success : function(res) {
					alert("전송완료");	
					$("#phone1").attr("readonly",true);
				},
				error : function (req){
					
					alert("req : " + req.status);
				},
				dataType : 'html'
			});
	}

	/*------------------------------------------------------------------------------ */
	//휴대폰 인증번호 
	function phone_num(){
		var input_phone_Num = $('input[name="phone2"]');
	
		if(input_phone_Num.val() == ""){
			alert("인증번호를 입력하세요");
			
			input_phone_Num.focus();
			return;
		}
		
		phone2 = $("#phone2").val();
		$.ajax({
			url : '<%=request.getContextPath()%>/member/GetPhoneNumAction.do',
			type : "post",
			data : {"phone2" : phone2},
			success : function(res) {
				
				if(phonePass == true){
					alert("이미 인증하셨습니다.");
					return;
				}
				alert(res);
				if(res == "인증완료"){
					$("#phone2").attr("readonly",true);
					phonePass= true;
					
				}else{
					phonePass= false;
					
				}
				
				
			},
			error : function (req){
				alert("req : " + req.status);
			},
			dataType : 'text'
		});
	}
	/*------------------------------------------------------------------------------ */

	//회원가입 전송 
	function submit_go(){
		
		if($('input[name="id"]').val() == ""){
			alert("아이디는 필수 입니다.");
			return;
		}
		if(idPass == false){
			alert("아이디 중복확인은 필수 입니다.");
			return;
		}
		
		if(pwPass == false){
			alert("패스워드는 필수 입니다.");
			return;
		}
		
		if(namePass == false){
			alert("이름은 필수 입니다.");
			return;
		}
		if(mailPass == false){
			alert("이메일은 필수 입니다.");
			return;
		}
		if(phonePass == false){
			alert("전화번호는 필수 입니다.");
			return;
		}
		var form = $('form[role="form"]');
		
		form.submit();
		
	}
	/*------------------------------------------------------------------------------ */

	//비밀번호 메시지
	function regpass(target, text) {
			$(target).parents(".mb-20").find('.reply').empty();
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
					'red').addClass('text-center');
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
				'blue').addClass('text-center ');
		
	}

	function regfail(target, text) {
		$(target).parents(".mb-20").find('.reply').empty();
		if(pwPass == false){
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
				'red').addClass('text-center');
		}
		else{
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
				'blue').addClass('text-center ');
		}
		
		
	}
	function regfail3(target, text) {
		$(target).parents(".mb-20").find('.reply').empty();
		if(namePass == false){
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
				'red').addClass('text-center');
		}
		else{
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
				'blue').addClass('text-center ');
		}
		
		
	}
	function regfail2(target, text) {
		if(pwPass2 == false){
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
				'red').addClass('text-center');
		}
		else{
			$(target).parents(".mb-20").find('.reply').html(text).css('color',
				'blue').addClass('text-center ');
		}
	}
	
	
</script>