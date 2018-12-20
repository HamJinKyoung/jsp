package addressbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import addressbook.dao.MemberDao;
import jdbc.jdbcUtil;
import addressbook.model.Member;

public class GetMemberListService {
	private static GetMemberListService instance = new GetMemberListService();

	public static GetMemberListService getInstance() {
		return instance;
	}

	private GetMemberListService() {
	}

	private static final int Member_COUNT_PER_PAGE = 3;

	public MemberListView getMemberList(int pageNumber) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao memberDao = MemberDao.getInstance();

			int MemberTotalCount = memberDao.selectCount(conn);

			List<Member> MemberList = null;
			int firstRow = 0;
			int endRow = 0;
			if (MemberTotalCount > 0) {
				firstRow =
						(pageNumber - 1) * Member_COUNT_PER_PAGE + 1;
				endRow = firstRow + Member_COUNT_PER_PAGE - 1;
				MemberList =
						memberDao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				MemberList = Collections.emptyList();
			}
			return new MemberListView(MemberList,
					MemberTotalCount, currentPageNumber,
					Member_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException("Î™©Î°ù Íµ¨ÌïòÍ∏? ?ã§?å®: " + e.getMessage(), e);
		} finally {
			jdbcUtil.close(conn);
		}
	}

	//?ï¥?ãπ?ù¥Î¶ÑÏúºÎ°úÏ∞æÍ∏?
	public MemberListView getMemberListbyname(int pageNumber, String name) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao memberDao = MemberDao.getInstance();

			int MemberTotalCount = memberDao.selectCountByName(conn,name);

			List<Member> MemberList = null;
			int firstRow = 0;
			int endRow = 0;
			if (MemberTotalCount > 0) {
				firstRow =
						(pageNumber - 1) * Member_COUNT_PER_PAGE + 1;
				endRow = firstRow + Member_COUNT_PER_PAGE - 1;
				MemberList =
						memberDao.selectByname(conn, firstRow, endRow, name);
			} else {
				currentPageNumber = 0;
				MemberList = Collections.emptyList();
			}
			return new MemberListView(MemberList,
					MemberTotalCount, currentPageNumber,
					Member_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException("Î™©Î°ù Íµ¨ÌïòÍ∏? ?ã§?å®: " + e.getMessage(), e);
		} finally {
			jdbcUtil.close(conn);
		}
	}

	public Member getMemberListbyid(String id) {
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			MemberDao memberDao = MemberDao.getInstance();

			Member member = memberDao.select(conn, id);
			return  member;

		} catch (SQLException e) {
			throw new ServiceException("Î™©Î°ù Íµ¨ÌïòÍ∏? ?ã§?å®: " + e.getMessage(), e);
		} finally {
			jdbcUtil.close(conn);
		}
	}
}
