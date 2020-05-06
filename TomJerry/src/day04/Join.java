package day04;
/**
 * 이 클래스는 회원가입 폼 요청을 처리할 클래스
 * @author 전은석
 * @since 2020.05.06
 */
import javax.servlet.http.*;

public class Join extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("######### 회원가입 폼 요청 ############");
	}
}
