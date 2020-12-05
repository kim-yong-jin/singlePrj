package action.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import action.Action;
import dto.MenuVO;
import service.MenuService;

public class SubMenuAction implements Action{
	
	private MenuService menuService;
	
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String mCode = request.getParameter("mCode");
		
		List<MenuVO> subMenu = null;
		
		try {
			subMenu = menuService.getSubMenuList(mCode);
			
			ObjectMapper mapper = new ObjectMapper();  	//JSON data String
			String jsonData = mapper.writeValueAsString(subMenu); //JSON data String
			
			response.setContentType("application/json;charset=utf-8");
			
			PrintWriter out = response.getWriter();
			
			
			out.println(jsonData);
			out.close();
		} catch (SQLException e) {
			e.printStackTrace();
			url = null;
		}
		
		return url;
	}

}