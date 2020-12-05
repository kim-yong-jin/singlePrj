package action.board;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.BoardVO;
import service.BoardService;

public class BoardDeleteAction implements Action{

	private BoardService boardService;//=BoardServiceImpl.getInstance();
	public void setBoardService(BoardService boardService) {
		this.boardService=boardService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="/board/removeSuccess";
		System.out.println("sdjahskjdsa1");
		int bno=Integer.parseInt(request.getParameter("bno"));
		
		try {
			BoardVO board=boardService.getBoard(bno);
			request.setAttribute("board", board);
			
			boardService.remove(bno);
		} catch (SQLException e) {
			e.printStackTrace();
			url=null; 
		}
		
		return url;
	}
}
