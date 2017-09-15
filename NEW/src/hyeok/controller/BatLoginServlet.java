package hyeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyeok.dao.BatLoginDAO;
import hyeok.vo.MemberVO;

@WebServlet("/BatLoginServlet.do")
public class BatLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		RequestDispatcher rd;
		HttpSession session = req.getSession();
		
		BatLoginDAO dao = new BatLoginDAO();
		MemberVO mvo = 
		new MemberVO(req.getParameter("userId"),req.getParameter("userPw"));
		
		String userId = req.getParameter("userId");
		
		boolean result = false;
		try {
			result=dao.login(mvo);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		out.print("<html>");
		out.print("<head><title>/BatLoginServlet.do</title></head>");
		out.print("<body>");
		out.print("<h2>BatLoginServlet</h2>");
		
		if(result){
			session.setAttribute("userId", userId);
			if(userId.equals("admin")){
				ArrayList<MemberVO> list = new BatLoginDAO().getAllMember();
				req.setAttribute("list", list);
				rd = req.getRequestDispatcher("/BatMember/main.jsp");
				rd.forward(req, resp);
			}else{ 
				rd = req.getRequestDispatcher("/BatMember/main.jsp");
				rd.forward(req, resp);
			}
		}else{
			session.setAttribute("msg", "로그인 성공");
			resp.sendRedirect("/NEW/BatMember/login.jsp");
		}
		out.print("</body></html>");
		out.close();
}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
}

	}
