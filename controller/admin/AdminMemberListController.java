package net.hb.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.MemberDAO;
import net.hb.dto.MemberDTO;

@WebServlet("/admin/member")
public class AdminMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int pageNo = req.getParameter("pageNo") != null ? Integer.parseInt(req.getParameter("pageNo")) : 1;
		String memType = req.getParameter("memType") != null ? req.getParameter("memType") : "p";
		
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.list(memType, pageNo);
		int count = dao.count(memType);
		dao.close();
		
		String query = "";
		if(req.getQueryString() != null) {
			query = req.getQueryString().replace("pageNo="+pageNo, "").replace("?&", "?");
		}
		
		if(query.endsWith("&&")) query.replace("&&", "&");
		if(query.length() > 0 && !query.endsWith("&")) query += "&";
		
		req.setAttribute("count", count);
		req.setAttribute("url", req.getRequestURI()+"?"+query);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/admin/memberlist.jsp").forward(req, res);
	}

}
