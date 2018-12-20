package addressbook.service;

import java.sql.Connection;


import java.sql.Connection;
import java.sql.SQLException;
import jdbc.jdbcUtil;
import jdbc.ConnectionProvider;

import addressbook.dao.MemberDao;
import addressbook.model.Member;

public class DeleteMemberService {
private static DeleteMemberService instance = new DeleteMemberService();
	
	public static DeleteMemberService getInstance() {
		return instance;
	}

	private DeleteMemberService() {
	}
	
	public void deleteMember(String MemberId) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			MemberDao memberDao = MemberDao.getInstance();
			//Member member = memberDao.select(conn, MemberId);
			/*if (member == null) {
				throw new MemberNotFoundException("Î©îÏãúÏß? ?óÜ?ùå");
			}
			if (!member.matchPassword(password)) {
				throw new InvalidPasswordException("bad password");
			}*/
			memberDao.delete(conn, MemberId);

			conn.commit();
		} catch (SQLException ex) {
			jdbcUtil.rollback(conn);
			throw new ServiceException("?Ç≠?†ú ?ã§?å®:" + ex.getMessage(), ex);
		} /*catch (InvalidPasswordException | MemberNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex; 
		} */ 
		finally {
			jdbcUtil.close(conn);
		}
	}
}
