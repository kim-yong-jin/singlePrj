package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import dto.MemberVO;
import exception.InvalidPasswordException;
import exception.NotFoundIDException;
import request.SearchCriteria;

public interface MemberService {

	// 로그인
	void login(String id, String pwd, HttpSession session) throws SQLException, NotFoundIDException, InvalidPasswordException;

	// 회원리스트조회	
	List<MemberVO> getMemberList(SearchCriteria cri) throws SQLException;

	Map<String, Object> getSearchMemberList(SearchCriteria cri) throws SQLException;

	// 회원정보조회
	MemberVO getMember(String id) throws SQLException;
	
	
	//회원정보조회(email)
	MemberVO getMember2(String id) throws SQLException;
	// 회원등록
	void regist(MemberVO member) throws SQLException;

	// 회원수정
	void modify(MemberVO member) throws SQLException;
	
	void modify2(MemberVO member) throws SQLException;
	// 회원삭제
	void remove(String id) throws SQLException;

	// 회원정지
	void disabled(String id) throws SQLException;

	// 회원활성
	void enabled(String id) throws SQLException;
}
