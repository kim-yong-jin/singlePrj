package action.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.NoticeVO;
import service.NoticeService;

public class NoticeModifyFormAction implements Action{
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/notice/modify";
		
		String nno = request.getParameter("nno");
		
		try {
			
			NoticeVO notice =  noticeService.getNotice(Integer.parseInt(nno));
			request.setAttribute("notice", notice);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return url;
	}
	

}
