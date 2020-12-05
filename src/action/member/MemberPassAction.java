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

public class MemberPassAction implements Action{
	private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/common/login";
		MemberVO vo = new MemberVO();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pass1");
		PrintWriter out = response.getWriter();
		try {
			pwd = CryptoUtil.sha256(pwd);
		} catch (Exception e) {
		}
		vo.setPwd(pwd);
		vo.setId(id);
		
		try {
			service.modify2(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}

}
