package action.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import action.Action;
import dao.ReplyDAO;
import request.DeleteReplyRequest;
import request.PageMaker;
import request.RegistReplyRequest;
import request.SearchCriteria;
import service.ReplyService;
import sun.security.mscapi.CKeyPairGenerator.RSA;

public class ReplyRemoveAction implements Action{
	private ReplyService replySerivce;
	public void setReplySerivce(ReplyService replySerivce) {
		this.replySerivce = replySerivce;
	}
	
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "";
		
		ObjectMapper mapper = new ObjectMapper();
		
		DeleteReplyRequest replyReq 
			=	mapper.readValue(request.getReader(), DeleteReplyRequest.class);
		
		try {
			replySerivce.removeReply(replyReq.getRno());
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(new SearchCriteria());
			pageMaker.setTotalCount(replyDAO.countReply(replyReq.getBno()));
			
			int realEndPAge =  pageMaker.getRealEndPage();
			int page = replyReq.getPage();
			
			if(page > realEndPAge) page = realEndPAge;
			
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print(page);
			out.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

		}
		return url;
	}

}
