package request;

import java.util.Date;

import dto.ReplyVO;

public class ModifyReplyRequest {
	
	private int rno;
	
	private String replytext;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	
	public ReplyVO toReplyVO() {
		ReplyVO reply = new ReplyVO();
		reply.setRno(rno);
		reply.setReplytext(replytext);
		reply.setUpdatedate(new Date());
		
		
		return reply;
	}
}
