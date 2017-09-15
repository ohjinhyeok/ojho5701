package hyeok.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BatLogout.do")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession log = request.getSession();
		log.invalidate();
		
		out.print("<html>");
		out.print("<head><title>/BatLogout.do</title></head>");
		out.print("<body>");
		out.print("<h2>Logout</h2>");
		out.print("로그아웃 완료");
		out.print("<br><br><a href='../NEW/BatMember/login.jsp'>로그인 페이지 가기</a>");
		out.print("</body></html>");
		out.close();
	}
}
