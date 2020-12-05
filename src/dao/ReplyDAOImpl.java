package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ReplyVO;
import request.SearchCriteria;

public class ReplyDAOImpl implements ReplyDAO{
	

	private SqlSessionFactory sqlSessionFactory;
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	
	@Override
	public int selectReplySeqNextValue() throws SQLException {
		SqlSession sqlSession =  sqlSessionFactory.openSession();
		int seq = (Integer)sqlSession.selectOne("Reply-Mapper.selectReplySeqNextValue");
		sqlSession.close();
		
		return seq;
	}

	@Override
	public List<ReplyVO> selectReplyList(int bno,SearchCriteria cri) throws SQLException {
		SqlSession sqlSession =  sqlSessionFactory.openSession();
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<ReplyVO> replyList = sqlSession.selectList("Reply-Mapper.selectReplyList", bno, rowBounds);
		sqlSession.close();
		return replyList;
	}

	@Override
	public int countReply(int bno) throws SQLException {
		SqlSession sqlSession =  sqlSessionFactory.openSession();
		int count = (Integer)sqlSession.selectOne("Reply-Mapper.countReply", bno);
		sqlSession.close();
		
		return count;
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		SqlSession sqlSession =  sqlSessionFactory.openSession(true);
		sqlSession.selectOne("Reply-Mapper.insertReply", reply);
		sqlSession.close();
		
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		SqlSession sqlSession =  sqlSessionFactory.openSession(true);
		sqlSession.selectOne("Reply-Mapper.updateReply", reply);
		sqlSession.close();
		
	}

	@Override
	public void deleteReply(int rno) throws SQLException {
		SqlSession sqlSession =  sqlSessionFactory.openSession(true);
		sqlSession.selectOne("Reply-Mapper.deleteReply", rno);
		sqlSession.close();
		
	}

}
