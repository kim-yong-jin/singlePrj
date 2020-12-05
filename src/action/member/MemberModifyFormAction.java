package action.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.MemberVO;
import service.MemberService;
import utils.ExceptionLoggerHelper;


public class MemberModifyFormAction implements Action {
	private MemberService service;
	
	public void setService(MemberService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/member/modify";
		
		String id = request.getParameter("id");
		
		
		
		
		try {
			MemberVO member = service.getMember(id);
			request.setAttribute("member", member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			ExceptionLoggerHelper.wrtie(request, e, service);
		}
		
		
		return url;
	}

}
