package action.common;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.MenuVO;
import service.MenuService;

public class IndexAction implements Action {

	
	private MenuService menuService;
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/common/indexPage";
		
		String mCode = request.getParameter("mCode");
		String bno = request.getParameter("bno");
		if(mCode == null) mCode = "M000000";
		
		if(bno != null) request.setAttribute("bno", bno);
		try {
			
			List<MenuVO> menuList = menuService.getMainMenuList();
			MenuVO menu = menuService.getMenuByMcode(mCode);
			
			request.setAttribute("menuList", menuList);
			request.setAttribute("menu", menu);
			
		} catch (SQLException e) {
			e.printStackTrace();
			url = null;
		}
		
		return url;
	}

}