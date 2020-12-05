package service;

import java.sql.SQLException;
import java.util.Map;

import dto.BoardVO;
import request.SearchCriteria;

public interface BoardService {

	
	//목록조회
	Map<String,Object> getBoardList(SearchCriteria cri) throws SQLException;
	
	//상세보기
	BoardVO getBoard(int bno) throws SQLException;
	
	BoardVO getBoardForModify(int bno) throws SQLException;
	
	//등록
	void write(BoardVO board) throws SQLException;
	
	//수정
	void modify(BoardVO board) throws SQLException;
	
	//삭제
	void remove(int bno) throws SQLException;
}
