package action.member;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dto.MemberVO;
import service.MemberService;
import utils.CryptoUtil;
import utils.GetUploadPath;

public class MemberDeleteAction implements Action {
	
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/member/removeSuccess";
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		try {
			pwd = CryptoUtil.sha256(pwd);
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		MemberVO member;
		
		try {
			
			member = memberService.getMember(id);
			String pwd2 = member.getPwd();
			
			
			request.setAttribute("member", member);
			System.out.println("pwd : " + pwd);
			System.out.println("vopwd: " + pwd2);
			if(!(member.getPwd().equals(pwd))) {
				 url = "/member/removefail";
				 return url;
			}
		
			String savePath = GetUploadPath.getUploadPath("member.picture.upload");
			File imageFile = new File(savePath, member.getPicture());
			
			if(imageFile.exists()) imageFile.delete();
			
			MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
			
			if(loginUser.getId().equals(member.getId())) {
				request.getSession().invalidate();
			}
			
			
			
			memberService.remove(id);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}

}
