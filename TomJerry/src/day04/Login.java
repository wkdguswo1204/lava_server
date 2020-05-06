package day04;

/**
 * 이 클래스는 로그인 폼 요청을 하면 로그인 화면을 보여주는 처리를 할 클래스
 *@author 임서진
 *@since 2020/05/06
 */
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

public class Login extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		// 보여줄 폼 jsp 경로
		String url = "/day04/Login.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(url);
		try {
			rd.forward(req,  resp);
		} catch (Exception e) { e.printStackTrace();}
	}
}
