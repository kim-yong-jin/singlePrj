package dao;

import java.sql.SQLException;
import java.util.List;

import dto.MenuVO;

public interface MenuDAO {
	
	
	List<MenuVO> selectMainMenu()throws SQLException;
	List<MenuVO> selectSubMenu(String mCode)throws SQLException;
	MenuVO selectMenuByMcode(String mCode)throws SQLException;
}
