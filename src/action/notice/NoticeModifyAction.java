package action.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.NoticeVO;
import service.NoticeService;

public class NoticeModifyAction implements Action {

	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(1);
		String url = "redirect:/notice/detail.do?nno=";
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		NoticeVO notice = new NoticeVO();
		
		notice.setNno(nno);
		notice.setContent(content);
		notice.setTitle(title);
		notice.setWriter(writer);
		System.out.println(1);
		try {
			noticeService.modify(notice);
			url = url + nno;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}

}
