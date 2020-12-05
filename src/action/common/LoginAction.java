package action.common;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

import exception.InvalidPasswordException;
import exception.NotFoundIDException;
import service.MemberService;
import utils.CryptoUtil;

public class LoginAction implements Action {
	
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="redirect:/index.do";
		
		//로그인처리
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");	
		
		try {
			pwd = CryptoUtil.sha256(pwd);
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			
			memberService.login(id, pwd, request.getSession());
			
		}catch (SQLException e) {
			e.printStackTrace();			
		} catch (NotFoundIDException | InvalidPasswordException e) {
			url="/common/login";
			request.getSession().setAttribute("msg", e.getMessage());
		} 
		return url;
	}

}