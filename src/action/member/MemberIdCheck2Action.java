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

public class MemberIdCheck2Action implements Action{
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		MemberVO vo = new MemberVO();
		
		String value = "";
		
		PrintWriter out = response.getWriter();

		try {
			vo = memberService.getMember(id);
			if(vo == null) {
				out.print(vo = null);
				return url;
			}
			value = vo.getEmail();
			if(value.equals(email)) {
				out.print(id = "");
			}else {
				out.print(vo = null);
				return url;
			}
			System.out.println("vo : " + vo);
		} catch (SQLException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

		}finally {
			if(out != null) out.close();
		}
		
		
		
		return url;
	}

}
