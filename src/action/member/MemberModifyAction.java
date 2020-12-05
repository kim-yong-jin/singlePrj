package action.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import action.Action;
import dto.MemberVO;
import request.MemberModifyRequest;
import service.MemberService;
import utils.ExceptionLoggerHelper;
import utils.GetUploadPath;
import utils.MakeFileName;
import utils.ServletFileUploadBuilder;

public class MemberModifyAction implements Action{
	private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "redirect:/member/detail.do?id=";
		
		try {
			MemberVO member = modifyFile(request, response);
			
			url = url + member.getId();
			
			service.modify(member);
			//로그인 사용자 수정 여부 확인
			
			HttpSession session = request.getSession();
			
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if(member.getId().equals(loginUser.getId())) {
				member = service.getMember(member.getId());
				session.setAttribute("loginUser", member);
				
				url = "";
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("location.href='detail.do?id="+member.getId()+"';");
				out.println("window.opener.parent.location.reload();");
				out.println("</script>");
				out.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ExceptionLoggerHelper.wrtie(request, e, service);
		}catch (Exception e) {
			url = null;
			e.printStackTrace();
		}
		
		
		return url;
	}
	//업로드 파일 환경 설정
	private static final int MEMORY_THRESHOLD = 1024 * 500; //500KB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1;// 1MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2;//2MB
	
	private MemberVO modifyFile(HttpServletRequest request,HttpServletResponse response)
			throws Exception{
		
		MemberVO member = null;
		
		MemberModifyRequest modifyReq = new MemberModifyRequest();
		
		ServletFileUpload upload 
		= ServletFileUploadBuilder.build(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
		
		//저장경로
		
		String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
		
		File file = new File(uploadPath);
		
		if(!file.mkdirs()) {
			System.out.println(uploadPath + "가 이미 존재하거나 생성을 실패했습니다.");
		}
		
		List<FileItem>formItems= upload.parseRequest(request);
		
		if(formItems != null && formItems.size() > 0) {
			for(FileItem item : formItems) { //form items 반복하여 꺼내는 구문
				if(!item.isFormField()) {//파일일 경우해당
					//uuid+구분자+파일명
					String fileName = MakeFileName.toUUIDFileName(".jpg", "");
					String filePath = uploadPath + File.separator + fileName;
					File storeFile =new File(filePath);
					
					//local HDD에 저장
					item.write(storeFile);
					
					modifyReq.setPicture(storeFile);//저장된 사진 파일
				}else { //텍스트 파라미터
					Class<?> cls = modifyReq.getClass();
					Method[] methods = cls.getMethods();
					
					for(Method method : methods) {
						if(method.getName().contains("set")) {
							String setFiledName = ((method.getName().replace("set","")).charAt(0) +"").toLowerCase()
									+ method.getName().substring(4);
							if(setFiledName.equals(item.getFieldName())) {
								method.invoke(modifyReq, item.getString("utf-8"));
							}
						}
					}
				}
			}
		}
		//기존파일 삭제
		
		if(modifyReq.getUploadPicture()!= null && !modifyReq.getUploadPicture().isEmpty()) {
			File deleteFile = new File(uploadPath,modifyReq.getOldPicture());
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
		return modifyReq.toParseMember();
	}
}
