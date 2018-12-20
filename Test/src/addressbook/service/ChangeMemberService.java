package addressbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;
import addressbook.model.Member;
import addressbook.dao.MemberDao;
import addressbook.service.ServiceException;

public class ChangeMemberService {
	private static ChangeMemberService instance = new ChangeMemberService();

	public static ChangeMemberService getInstance() {
		return instance;
	}

	private ChangeMemberService() {
	}

	public void Change(Member member) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao membertDao = MemberDao.getInstance();
			membertDao.Change(conn, member);
		} catch (SQLException e) {
			throw new ServiceException(
					"ì£¼ì†Œë¡? ?“±ë¡? ?‹¤?Œ¨: " + e.getMessage(), e);
		} finally {
			jdbcUtil.close(conn);
		}
	}
	
}
