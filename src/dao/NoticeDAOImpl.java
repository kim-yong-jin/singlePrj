package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.NoticeVO;
import request.SearchCriteria;

public class NoticeDAOImpl implements NoticeDAO{
	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<NoticeVO> selectSearchNoticeList(SearchCriteria cri) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<NoticeVO> noticeList=
				sqlSession.selectList("Notice-Mapper.selectSearchNoticeList",cri,rowBounds);
		sqlSession.close();
		
		return noticeList;
	}

	@Override
	public int selectSearchNoticeListCount(SearchCriteria cri) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int count=sqlSession.selectOne("Notice-Mapper.selectSearchNoticeListCount",cri);
		sqlSession.close();
		return count;
	}

	@Override
	public NoticeVO selectNoticeByNno(int nno) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession();		
		NoticeVO notice=
				sqlSession.selectOne("Notice-Mapper.selectNoticeByNno",nno);
		sqlSession.close();
		return notice;
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);		
		sqlSession.update("Notice-Mapper.insertNotice",notice);
		sqlSession.close();

	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);		
		sqlSession.update("Notice-Mapper.updateNotice",notice);
		sqlSession.close();
	}

	@Override
	public void deleteNotice(int nno) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);		
		sqlSession.update("Notice-Mapper.deleteNotice",nno);
		sqlSession.close();

	}

	@Override
	public void increaseViewCount(int nno) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);		
		sqlSession.update("Notice-Mapper.increaseViewCount",nno);
		sqlSession.close();

	}

	@Override
	public int selectNoticeSequenceNextValue() throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int seq_num=
				sqlSession.selectOne("Notice-Mapper.selectNoticeSequenceNextValue");
		sqlSession.close();
		return seq_num;
	}

}
