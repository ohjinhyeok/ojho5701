package hyeok.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.apache.catalina.servlet4preview.ServletContext;

import hyeok.dao.BatLoginDAO;
import hyeok.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.*;

@WebServlet("/BatMember.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		ServletContext sc = (ServletContext)this.getServletContext();
		BatLoginDAO dao = new BatLoginDAO();
		MemberVO user;
		String flag = request.getParameter("flag");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userNm = request.getParameter("userNm");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String photo = request.getParameter("photo");
		String mouserPw=(String)session.getAttribute("userPw");
		ArrayList<MemberVO> list = new BatLoginDAO().getAllMember();
		System.out.println(flag);
		
		System.out.println("멤버서블릿");
	
		switch (flag) {
		case "1"://개인 조회
			System.out.println("개인 조회");
			user = dao.getOneMember(userId);
			request.setAttribute("user", user);
			rd = request.getRequestDispatcher("/BatMember/detail.jsp");
			rd.forward(request, response);
			break;
			
		case "2"://수정
			System.out.println("수정");
			int rm = dao.modify(userId, userPw, email);
			if(rm==1){
				user = dao.getOneMember(userId);
				request.setAttribute("user", user);
				request.setAttribute("msgmo", "회원 수정 완료");
			}else{
				request.setAttribute("msgmo", "회원 수정 실패");
			}
			rd = request.getRequestDispatcher("/BatMember/detail.jsp");
			rd.forward(request, response);
			break;
			
		case "3"://목록 보기???
			System.out.println("목록보기?");
			if(session.getAttribute("userId").equals("admin")){
				request.setAttribute("list", list);
			}
			rd = request.getRequestDispatcher("/BatMember/main.jsp");
			rd.forward(request, response);
			break;
			
		case "4"://회원 삭제
			System.out.println("회원 삭제");
			int re = dao.delete(userId);
			if(re==1){
				ArrayList<MemberVO> list2 = new BatLoginDAO().getAllMember();
				request.setAttribute("msgr", "회원 삭제 완료");
				request.setAttribute("list", list2);
				session.setAttribute("userId","admin");
			}else{
				request.setAttribute("msgr", "회원 삭제 실패");
			}
			rd = request.getRequestDispatcher("/BatMember/main.jsp");
			rd.forward(request, response);
			break;
			
		case "5"://회원 가입
			System.out.println("들어옴 회원가입");
			String nuserId = request.getParameter("userIdNew");
			String nuserPw = request.getParameter("userPwNew");
			String nuserNm = request.getParameter("userNmNew");
			String nemail = request.getParameter("emailNew");
			String ngender = request.getParameter("genderNew");
			String nphoto = request.getParameter("photoNew");
			int ra = dao.join(nuserId, nuserPw, nuserNm, nemail, ngender, nphoto);
			int rs = dao.crate(nuserId);
			    if(ra==1){
			    	session.setAttribute("msg", "회원 가입 완료");
				}else{
					session.setAttribute("msg", "회원 가입 실패");
				}	
			response.sendRedirect("/NEW/BatMember/login.jsp");
			
			break;
			
		default:
			break;
		}
		
		
		
	}

	

}
