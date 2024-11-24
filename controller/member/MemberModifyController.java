package net.hb.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.MemberDAO;
import net.hb.dto.MemberDTO;

import java.io.IOException;

/**
 * Servlet implementation class MemberModifyController
 */
@WebServlet("/mypage/modify")
public class MemberModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberModifyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());


		String memberId = (String)request.getSession().getAttribute("sessionMemberId");

		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.view(memberId);
		dao.close();

		request.setAttribute("item", dto);

		request.getRequestDispatcher("/mypage/modify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);

		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String school = request.getParameter("grade1");
		String grade = request.getParameter("grade2");
		String pwd = request.getParameter("password");

		MemberDTO dto = new MemberDTO();
		dto.setMemberId(request.getSession().getAttribute("sessionMemberId").toString());
		dto.setPwd(pwd);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setSchool(school);
		dto.setGrade(Integer.parseInt(grade));

		MemberDAO dao = new MemberDAO();
		int result = dao.update(dto);
		dao.close();
		
		
		result = 1;

		if (result >= 0) {
			if(request.getSession().getAttribute("sessionType").equals("t")) {
				response.sendRedirect("/main");
			}
			else response.sendRedirect("/mypage");
			return;
		}
		// DB 수정 실패했을 경우
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
	}

}
