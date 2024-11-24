package net.hb.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.MemberDAO;
import net.hb.dto.MemberDTO;

import java.io.IOException;
import java.time.LocalDateTime;

/**
 * Servlet implementation class MemberRegistController
 */
@WebServlet("/join")
public class MemberRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberRegistController() {
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

		request.getRequestDispatcher("/login/join.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub		
		String name = request.getParameter("name");
		String memberId = request.getParameter("userid");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String school = request.getParameter("grade1");
		String grade = request.getParameter("grade2");
		String pwd = request.getParameter("password");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String gender = request.getParameter("gender");

		String memType = "p"; // 학생(일반회원)=p 선생님=t 관리자=a

		//필수정보
		if (name == null || memberId == null || pwd == null || year == null || month == null || day == null) {
			System.out.println("필수정보 없음 (history.back())");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().append("<script>alert('필수 정보를 입력하세요.');history.back();</script>");
			return;
		}

		MemberDTO dto = new MemberDTO();
		dto.setMemberId(memberId);
		dto.setName(name);
		dto.setPwd(pwd);
		dto.setMemType(memType);
		
		if (phone != null && phone.length() > 0)
			dto.setPhone(phone);
		if (school != null && school.length() > 0)
			dto.setSchool(school);
		if (grade != null && grade.length() > 0)
			dto.setGrade(Integer.parseInt(grade));
		if (year != null && month != null && day != null)
			dto.setBirthday(year + "-" + month + "-" + day);
		if(email != null && email.length() > 0)
			dto.setEmail(email);
		if(gender != null && gender.length() > 0)
			dto.setGender(gender);
		
		
		MemberDAO dao = new MemberDAO();
		int result = dao.regist(dto);
		dao.close();
		
		
		result = 1;
		//DB 저장 성공했을 경우
		if(result > 0) {
			response.sendRedirect("/main");
			return;
		}
		
		//DB 저장 실패했을 경우
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
	}

}
