package service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberVO;
import exception.InvalidPasswordException;
import exception.NotFoundIDException;
import request.PageMaker;
import request.SearchCriteria;

public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;// =MemberDAOImpl.getInstance();
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public void login(String id, String pwd, HttpSession session) throws SQLException, 
																		 NotFoundIDException, 
																		 InvalidPasswordException {
		MemberVO member = memberDAO.selectMemberById(id);
		System.out.println("??? " + id);
		if (member == null)
			throw new NotFoundIDException();
		if (!pwd.equals(member.getPwd()))
			throw new InvalidPasswordException();
		
		System.out.println("??? " + member.getId());
		session.setAttribute("loginUser", member);
		session.setMaxInactiveInterval(6*60);

		
		
	}
	

	@Override
	public List<MemberVO> getMemberList(SearchCriteria cri) throws SQLException {
		
		return null;
	}

	@Override
	public Map<String, Object> getSearchMemberList(SearchCriteria cri) throws SQLException {
		List<MemberVO> memberList = memberDAO.selectMemberList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("memberList", memberList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public MemberVO getMember(String id) throws SQLException {
		
		return memberDAO.selectMemberById(id);
	}
	
	@Override
	public MemberVO getMember2(String id) throws SQLException {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberByIDandEmail(id);
	}
	@Override
	public void regist(MemberVO member) throws SQLException {

		memberDAO.insertMember(member);

	}

	@Override
	public void modify(MemberVO member) throws SQLException {
		memberDAO.updateMember(member);

	}
	@Override
	public void modify2(MemberVO member) throws SQLException {
		memberDAO.updateMember2(member);
		
	}
	@Override
	public void remove(String id) throws SQLException {
		memberDAO.deleteMember(id);
	}

	@Override
	public void disabled(String id) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void enabled(String id) throws SQLException {
		// TODO Auto-generated method stub

	}

	

	

}
