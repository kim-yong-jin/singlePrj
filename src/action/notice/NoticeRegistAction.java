package action.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.NoticeVO;
import service.NoticeService;

public class NoticeRegistAction implements Action{
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		NoticeVO vo = new NoticeVO();
		
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			noticeService.write(vo);
			out.print("<script>");
			out.print("location.href='" + request.getContextPath() + "/notice/list.do';");
			out.print("</script>");
			
		} catch (SQLException e) {
			out.print("<script>");
			out.print("history.go(-1)");
			out.print("</script>");
		}
		
		return url;
	}

}
