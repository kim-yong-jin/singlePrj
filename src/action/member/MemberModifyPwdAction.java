package action.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.MemberVO;
import service.MemberService;
import utils.CryptoUtil;

public class MemberModifyPwdAction implements Action{
	private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/member/passwordpass";
		
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("id");
	
		try {
			pwd = CryptoUtil.sha256(pwd);
		} catch (Exception e) {
		}
		
		
		System.out.println("pwdpwd : " + pwd);
		System.out.println("idid : " + id );
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPwd(pwd);
		try {
			request.setAttribute("member", member);
			service.modify2(member);
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

}
