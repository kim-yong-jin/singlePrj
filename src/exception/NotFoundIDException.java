package exception;

public class NotFoundIDException extends Exception {
	
	public NotFoundIDException() {
		super("아이디를 찾을 수가 없습니다.");
	}
	
}
