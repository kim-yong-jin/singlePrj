package action.summernote;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import action.Action;
import exception.NotMultipartFormDataException;
import utils.GetUploadPath;
import utils.MakeFileName;
import utils.ServletFileUploadBuilder;

public class UploadImgAction implements Action {
	
	private static final int MEMORY_THRESHOLD = 1024 * 500;     // 500KB
	private static final int MAX_FILE_SIZE    = 1024 * 1024 * 5;// 5MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 10;// 10MB
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		String url = "";
		
		ServletFileUpload upload = null;
		
		try {
			upload = ServletFileUploadBuilder.build(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
		} catch (NotMultipartFormDataException e) {
			System.out.println(e.getMessage());
		}
		
		
		String uploadPath = GetUploadPath.getUploadPath("summernote.img");
		
		File file = new File(uploadPath);
		if(!file.mkdirs()) {
			System.out.println(uploadPath + "가 이미 존재하거나 실패했습니다.");
		}
		try {
			List<FileItem> formItems = upload.parseRequest(request);
			
			//파일 개수 확인
			if(formItems != null && formItems.size() > 0) {
				for(FileItem item : formItems) { //form items 반복하여 꺼내는 구문
					if(!item.isFormField()) { // 파일일 경우 해당
						// uuid + 구분자 + 파일명
						String fileName = MakeFileName.toUUIDFileName(".jpg", "");
						
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						
						// local HDD에 저장
						item.write(storeFile);
						
						PrintWriter out = response.getWriter();
						
						String outStr = request.getContextPath() + "/getImg.do?fileName=" + fileName;
						out.print(outStr);
						System.out.println(outStr);
						
						out.close();
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
						
		return url;
	}

}
