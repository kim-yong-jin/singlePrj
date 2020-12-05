package action.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import action.Action;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MemberSendPhoneNumAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="";
		
		String api_key = "NCSSZ8SXQT0IE1T6";
	    String api_secret = "XHKAHKDR5EW3CHDEFWBZPOTWJRGDVEDB";
	    Message coolsms = new Message(api_key, api_secret);
	    String tophone = request.getParameter("phone");
	    String num = "";
    	System.out.println("tophone: "+tophone);
	    for (int i = 0; i < 6; i++) {
			int random = (int) (Math.random() * 10);

			num += String.valueOf(random);
		}	   
	    
	    
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", tophone);	// 수신전화번호
	    params.put("from", "01096574281");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "안녕하세요 WebKy 가입을 감사드립니다 인증 문자를 정확히 입력 해주세요 " +num);
	    params.put("app_version", "test app 1.2"); // application name and version
	    
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("num", num);
	    
	    
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    
	    }
		return url;
	}

}
