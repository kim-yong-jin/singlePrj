<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script>
	var pwPass= false;
	var pwPass2 = false;
	var mailPass = false;
	
	
	
	
	/*------------------------------------------------------------------------------ */
	//비밀번호 정규식 및 두 값이 같은지 확인
	function chkPW(){
		
		
		
		
		$("#pass1").on("keyup",function(){
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
		
		$("#pass2").on("keyup",function(){
			pass2val = $(this).val().trim();
			passval = $("#pass1").val().trim();
			
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
	

	/*------------------------------------------------------------------------------ */
	//이메일 인증번호 전송 및 정규식
	function chkmail(){
	
		var input_email = $('input[name="email1"]');
		var input_id = $('input[name="id"]');
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
		var data2 = {id :  input_id.val().trim()};
		idinput = $("#id").val();
		mailinput = $("#email1").val();
		$.ajax({
			url : '<%=request.getContextPath()%>/member/idchk2.do',
			data : {id: idinput, email: mailinput},
			type : 'post',
			success : function(res){
				if(res){
					alert("존재하지 않는 아이디 또는 회원 정보를 올바르게 입력 하세요");
				}else{
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
			},
			error : function(req){
				alert("시스템 장애로 가입이 불가능 합니다.");
				
			}
		})
	
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
				if(res == "인증완료"){
					$("#email2").attr("readonly",true);
					mailPass= true;
					alert("변경하실 비밀번호를 입력 해주세요!");
					var pwd1 = $('<input type="password" class="form-control form-control-user" onkeyup="chkPW();" id="pass1" name = "pass1" placeholder="Enter password..."> <div class = "reply" id = "namemsg"></div>').addClass('new');
					var pwd2 = $('<input type="password" class="form-control form-control-user" id="pass2" name = "pass2" placeholder="Enter password..."> <div class = "reply" id = "namemsg"></div>').addClass('new');
					$('#pwd1').append(pwd1);
					$('#pwd2').append(pwd2);
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
	

	//회원가입 전송 
	function submit_go(){
		
		
	
		if(pwPass == false || pwPass2 == false){
			alert("변경하실 비밀번호를 정확히 입력 해주세요");
			return;
		}else{
			var form = $('form[role="form"]');
			alert("변경완료");
			form.submit();
		}
		
		
			
		
		
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