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
import utils.ExceptionLoggerHelper;

public class MemberRegistAction implements Action{
	private MemberService memberservice;
	
	public void setMemberservice(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="";

		MemberVO vo = new MemberVO();
	
	
		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("pwd").trim();
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email1").trim();
		String phone = request.getParameter("phone1").trim();
		
		try {
			pwd = CryptoUtil.sha256(pwd);
		} catch (Exception e) {
		}
		
		
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		try {
			//if(true)throw new SQLException("테스트 ExceptionLoggerHelper");
			memberservice.regist(vo);
			
			out.print("<script>");
			out.println("alert('회원가입을 축하드립니다')");
			out.print("location.href = '" + request.getContextPath() + "/index.do';");
			out.print("</script>");
			
			
		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('회원가입 실패')");
			out.println("history.go(-1);");
			out.println("</script>");
			e.printStackTrace();
			
			ExceptionLoggerHelper.wrtie(request, e, memberservice);
		}finally {
			if(out != null) out.close();
		}
		return url;
	}

}
