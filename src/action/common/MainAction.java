package action.common;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.BoardVO;
import dto.NoticeVO;
import request.SearchCriteria;
import service.BoardService;
import service.NoticeService;

public class MainAction implements Action {
	private NoticeService noticeService;
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	private BoardService boardservice;
	
	public void setService(BoardService boardservice) {
		this.boardservice = boardservice;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/common/main";
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
		SearchCriteria cri = new SearchCriteria();
		
		try {
			List<NoticeVO> noticeList = (List<NoticeVO>)noticeService.getNoticeList(cri).get("noticeList");
			List<BoardVO> boardList=(List<BoardVO>)boardservice.getBoardList(cri).get("boardList");
			
			dataMap.put("noticeList", noticeList);
			dataMap.put("boardList", boardList);
			
			request.setAttribute("dataMap", dataMap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
		return url;
	}

}










