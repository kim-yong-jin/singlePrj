package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberVO;
import request.SearchCriteria;

public class MemberDAOImpl implements MemberDAO{
	// SqlSessionFactory
	private SqlSessionFactory sqlSessionFactory;// = OracleMyBatisSqlSessionFactory.getInstance();

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public MemberVO selectMemberById(String id) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO member = session.selectOne("Member-Mapper.selectMemberById", id);
		session.close();
		return member;
	}
	
	@Override
	public List<MemberVO> selectMemberList(SearchCriteria cri) throws SQLException {
		SqlSession session=sqlSessionFactory.openSession();
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<MemberVO> memberList = null;

		
		memberList=session.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);
		System.out.println(memberList);
		session.close();
		return memberList;
	}
	@Override
	public MemberVO selectMemberByIDandEmail(String id) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO member = session.selectOne("Member-Mapper.selectMemberByIDandEmail",id);
		session.close();
		return member;
	}
	@Override
	public int selectMemberListCount(SearchCriteria cri) throws SQLException {
		int count=0;		
		SqlSession session=sqlSessionFactory.openSession();
		count=session.selectOne("Member-Mapper.selectSearchMemberListCount",cri);
		
		session.close();
		
		return count;
	}
	
	

	@Override
	public void insertMember(MemberVO member) throws SQLException {
		SqlSession session=sqlSessionFactory.openSession(true);
		session.update("Member-Mapper.insertMember",member);
		session.close();

	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		SqlSession session=sqlSessionFactory.openSession(true);
		session.update("Member-Mapper.updateMember",member);
		session.close();

	}
	@Override
	public void updateMember2(MemberVO member) throws SQLException {
		SqlSession session=sqlSessionFactory.openSession(true);
		session.update("Member-Mapper.updateMember2",member);
		session.close();
		
	}

	@Override
	public void deleteMember(String id) throws SQLException {
		SqlSession session=sqlSessionFactory.openSession(true);
		session.update("Member-Mapper.deleteMember",id);
		session.close();

	}
	@Override
	public void disabledMember(String id) throws SQLException {
		SqlSession session=sqlSessionFactory.openSession(true);
		session.update("Member-Mapper.disabledMember",id);
		session.close();
		
	}
	@Override
	public void enabledMember(String id) throws SQLException {
		SqlSession session=sqlSessionFactory.openSession(true);
		session.update("Member-Mapper.enabledMember",id);
		session.close();
	}




	
}








