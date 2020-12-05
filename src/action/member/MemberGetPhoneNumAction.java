package action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;

public class MemberGetPhoneNumAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String phone2 = request.getParameter("phone2");
		
		
		
		HttpSession msession = request.getSession();
		
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter out = response.getWriter();
	    
	   
	    String phonenum2 = (String)msession.getAttribute("num");
		
		request.setAttribute("phonenum2", phonenum2);
		
		
		if(phonenum2.equals(phone2)){
			out.write("인증완료");
			
			
		}else {
			out.write("인증 번호를 정확히 입력 해주세요");
		}
		return url;
	}

}
