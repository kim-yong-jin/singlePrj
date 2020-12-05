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

public class MemberDetailAction implements Action{
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="/member/detail";
		MemberVO member = new MemberVO();
		String id = request.getParameter("id").trim();
		
		try {
			member = memberService.getMember(id);
			
			request.setAttribute("member", member);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ExceptionLoggerHelper.wrtie(request, e, memberService);
			url = null;
		}
		return url;
	}

}