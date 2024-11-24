package net.hb.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.MemberDAO;

import java.io.IOException;
import java.io.PrintWriter;

/**s
 * Servlet implementation class CheckIdController
 */
@WebServlet("/join/checkid")
public class CheckIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
        String idn = request.getParameter("idn");
        
        System.out.println(">>>>" + idn);
        
        String result = "available";
        
        MemberDAO dao = new MemberDAO();
        if(dao.exists(idn))
        	result = "exist";
        dao.close();
        
        
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.write(result);
        out.close();
	}

}
