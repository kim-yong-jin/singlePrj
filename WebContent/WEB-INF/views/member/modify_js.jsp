<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true" %>    


<script>

var pwPass= false;
var pwPass2 = false;
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
				alert(pwd1);
			}
			else{ 
				regfail2(this,"일치하지 않습니다");
				pwPass2 = false;
			}
		});
		
		
		
	}
	
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
	window.onload=function(){
		var imageURL = "getPicture.do?picture=${member.picture}";
		var pwd1 = $("#pwd1").val();
		
		$('div#pictureView').css({
				'background-image' : 'url(' + imageURL + ')',
				'background-position' : 'center',
				'background-size':'cover',
				'background-repeat' : 'no-repeat'
			});
	
		$('#modifyBtn').on('click',function(e){
			var form = $('form[role="form"]');
			form.submit();
		});
		
		$('#modifypwdBtn').on('click',function(e){
			
			if(pwPass != true || pwPass2 != true){
				alert("비밀 번호가 다릅니다 다시 확인 해주세요!");
				return;
			}
			var form = $('form[role="form"]');
			form.submit();
		});
		
		$('#cancelBtn').on('click',function(e){
			history.go(-1);
		});
		
		
	}
	
	function imageChange_go(){
		
		var inputImage = $('input#inputFile')[0];
		preViewPicture(inputImage,$('div#pictureView'));
		
		$('input[name="uploadPicture"]').val(inputImage.files[0].name);
	}
</script>