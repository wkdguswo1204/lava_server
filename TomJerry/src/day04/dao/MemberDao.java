package day04.dao;

/**
 * 이 클래스는 회원에 관련된 데이터베이스 작업을 처리할 클래스이다.
 * @author 임서진
 * @since 2020.05.06
 */
import java.sql.*;
import DB.*;
import day04.sql.*;
public class MemberDao {
	ORCLJDBC db = null;
	MemberSQL mSQL = null;
	public MemberDao() {
		// 이 클래스에서는 데이터베이스 작업을 반드시 할 것이므로
		// 데이터베이스를 관리할 클래스를 초기화 해둔다.
		db = new ORCLJDBC();
		// 데이터베이스 작업에는 반드시 질의 명령이 필요하므로 전담 클래스도 초기화 해 둔다..
		mSQL = new MemberSQL();
		/*
		 * 데이터베이스 테이블이 준비 안된 사람은 내일까지 반드시 준비하고
		 * 오늘은 주소를
		 * 			192.168.0.21:1521:orcl
		 * 를 사용해서 처리하세요.
		 */
	}
	
	// 로그인 데이터베이스 작업 전담 처리함수
	public int getCnt(String id, String pw) {
		// 반환값 데이터를 저장할 변수를 만들고
		int cnt = 0;
		
		// 할일
		// 1. 커넥션 얻어오고
		Connection con = db.getCon();
		// 2. 질의명령 얻어오고
		String sql = mSQL.getSQL(mSQL.SEL_LOGIN);
		// 3. PreparedStatement 얻어오고
		PreparedStatement pstmt = db.getPSTMT(con, sql);
		ResultSet rs = null;
		try {
		// 4. 질의명령 완성하고
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
		// 5. 질의명령 보내고 결과 받고https://github.com/wkdguswo1204/lava_server.git
			rs = pstmt.executeQuery();
			rs.next(); // 한줄 내리고
			// 변수에 결과 꺼내서 담고
			cnt = rs.getInt("cnt");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		// 데이터 전달하고
		return cnt;
	}
}
