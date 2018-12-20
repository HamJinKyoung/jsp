package addressbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import addressbook.dao.MemberDao;
import jdbc.jdbcUtil;
import addressbook.model.Member;

public class WriteMemberService {
	private static WriteMemberService instance = new WriteMemberService();

	public static WriteMemberService getInstance() {
		return instance;
	}

	private WriteMemberService() {
	}

	public void write(Member Member) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao memberDao = MemberDao.getInstance();
			memberDao.insert(conn, Member);
		} catch (SQLException e) {
			throw new ServiceException(
					"ë©”ì‹œì§? ?“±ë¡? ?‹¤?Œ¨: " + e.getMessage(), e);
		} finally {
			jdbcUtil.close(conn);
		}
	}

}
