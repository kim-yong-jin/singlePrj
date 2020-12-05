package action.board;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.BoardVO;
import request.ModifyBoardRequest;
import service.BoardService;

public class BoardModifyAction implements Action {
	
	private BoardService boardService;
	public void setBoardService(BoardService boardService) {
		this.boardService=boardService;
	}
	
	
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 파라메터 저장
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		// 화면결정
		String url = "redirect:/board/detail.do?bno="+bno;
		
		
		BoardVO board = new ModifyBoardRequest(bno, title, content, writer).toBoardVO();
		

		// 서비스를 의뢰 (결과 할당)
		try {
			boardService.modify(board);
		} catch (SQLException e) {
			e.printStackTrace();
			url=null;
		}
		// request.setAttribut() 없음.
		
		// 화면리턴		
		return url;
	}

}
