package action.notice;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.NoticeVO;
import service.NoticeService;

public class NoticeRemoveAction implements Action{
	private NoticeService noticeService;
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/notice/removeSuccess";
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO vo = new NoticeVO();
		
		try {
			vo = noticeService.getNotice(nno);
			
			request.setAttribute("vo", vo);
			
			noticeService.remove(nno);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}

}
