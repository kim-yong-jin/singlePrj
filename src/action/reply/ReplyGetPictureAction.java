package action.reply;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.MemberVO;
import service.MemberService;
import utils.GetUploadPath;

public class ReplyGetPictureAction implements Action{
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String picture = "";
		
		
		try {
			MemberVO member = memberService.getMember(id);
		
			picture = member.getPicture();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url = "";
		
		String fileName = picture;
		String savePath = GetUploadPath.getUploadPath("member.picture.upload");
		
		String filepath = savePath + File.separator + fileName;
		
		File downloadFile = new File(filepath);
		FileInputStream inStream = new FileInputStream(downloadFile);
		
		ServletContext context = request.getServletContext();
		
		String mimeType = context.getMimeType(filepath);
		
		if(mimeType == null) {
			mimeType = "application/octet-stream";
		}
		
		
		response.setContentType(mimeType);
		response.setContentLength((int)downloadFile.length());
		
		
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
		response.setHeader(headerKey, headerValue);
		
		
		OutputStream outStream = response.getOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead = -1;
		
		while((bytesRead = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}
		
		
		inStream.close();
		outStream.close();
		
		
		return url;
	}

}
