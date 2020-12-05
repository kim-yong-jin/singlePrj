package dao;


import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MenuVO;
import mybatis.OracleMyBatisSqlSessionFactory;

public class MenuDAOImpl implements MenuDAO {
	
	
	private SqlSessionFactory sqlSessionFactory;// = OracleMyBatisSqlSessionFactory.getInstance();
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	@Override
	public List<MenuVO> selectMainMenu() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectMainMenu");
		session.close();
		return menuList;
	}

	@Override
	public List<MenuVO> selectSubMenu(String mCode) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectSubMenu",mCode);
		session.close();
		return menuList;
	}

	@Override
	public MenuVO selectMenuByMcode(String mCode) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMcode",mCode);
		session.close();
		return menu;
	}

}