package action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.BoardVO;
import service.BoardService;

public class BoardModifyFormAction implements Action{
	
	private BoardService boardService; //= BoardServiceImpl.getInstance();
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="/board/modify";
		
		try{
			int bno = Integer.parseInt(request.getParameter("bno"));			
			
			BoardVO board=boardService.getBoardForModify(bno);
			
			request.setAttribute("board", board);
			
		}catch(Exception e){
			e.printStackTrace();
			url=null;
		}
		
		return url;
	}

}


