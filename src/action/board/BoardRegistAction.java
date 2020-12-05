package action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.BoardVO;
import service.BoardService;

public class BoardRegistAction implements Action{
	private BoardService service;
	public void setService(BoardService service) {
		this.service = service;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		BoardVO member = new BoardVO();
		
		member.setTitle(title);
		member.setContent(content);
		member.setWriter(writer);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			service.write(member);
			out.print("<script>");
			out.print("location.href='" + request.getContextPath() + "/board/list.do';");
			out.print("</script>");
		} catch (SQLException e) {
			out.print("<script>");
			out.print("history.go(-1)");
			out.print("</script>");
		}
		
		return url;
	}
}
