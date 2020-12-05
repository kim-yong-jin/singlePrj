package action.board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.BoardVO;
import service.BoardService;

public class BoardDetailAction implements Action{
	private BoardService service;
	
	public void setService(BoardService service) {
		this.service = service;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/board/detail";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		try {
			BoardVO board = service.getBoard(bno);
			
			request.setAttribute("board", board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			url=null;
		}
		return url;
	}

}
