package action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;

public class MemberGetEmailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		String mailinput = request.getParameter("mailinput");
		
		
		HttpSession msession = request.getSession();
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter out = response.getWriter();
		
		
		String mailnum2 = (String)msession.getAttribute("auth");
		
		
		
		if(mailnum2.equals(mailinput)){
			out.write("인증완료");
			
		}else {
			out.write("인증 번호를 정확히 입력 해주세요");
		}
		return url;
	}

}
