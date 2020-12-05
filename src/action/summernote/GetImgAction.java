package action.summernote;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import utils.GetUploadPath;

public class GetImgAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String fileName = request.getParameter("fileName");
		
		String savePath = GetUploadPath.getUploadPath("summernote.img");

		String filePath = savePath + File.separator + fileName;
		
		File sendFile = new File(filePath);
		
		FileInputStream inStream = new FileInputStream(sendFile);
		
		ServletContext context = request.getServletContext();
		
		String mimeType = context.getMimeType(filePath);
		
		response.setContentType(mimeType);
		response.setContentLength((int)sendFile.length());
		
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment;filename=\'%s=\'", fileName);
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
