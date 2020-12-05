package dao;

import java.sql.SQLException;
import java.util.List;

import dto.ReplyVO;
import request.SearchCriteria;

public interface ReplyDAO {

	int selectReplySeqNextValue() throws SQLException;
	
	List<ReplyVO> selectReplyList(int bno, SearchCriteria cri) throws SQLException;
	
	int countReply(int bno) throws SQLException;
	
	void insertReply(ReplyVO reply) throws SQLException;
	
	void updateReply(ReplyVO reply) throws SQLException;
	
	void deleteReply(int rno) throws SQLException;
	
	
}
