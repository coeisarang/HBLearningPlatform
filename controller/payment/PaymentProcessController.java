package net.hb.controller.payment;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.CartDAO;
import net.hb.dao.PaymentDAO;

@WebServlet("/payment/paymentProcess")
public class PaymentProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		
		
		String[] data = req.getParameterValues("data");
		if(data == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('결제할 상품을 선택해주세요');history.back();</script>");
		}
		System.out.println(data.length);
		PaymentDAO dao = new PaymentDAO();
		String name = null;
		for(String i : data) {
			int idx = Integer.parseInt(i.split("/")[0]);
			name = dao.exists(memberId, idx);
			if(name != null) {
				dao.close();
				res.setContentType("text/html;charset=utf-8");
				res.getWriter().append("<script>alert('결제 불가 상품이 포함되어 있습니다.("+ name +") ');history.back();</script>");
				return;
			}
		}
		
		int result = dao.paymentRegist(data, memberId);
		dao.close();
		// [printWriter]
		
		
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8"); // 응답 콘텐츠 타입을 html로 지정
		PrintWriter out = res.getWriter();
		
		if(result <= 0) {
			//실패
			out.append("<script>");
			out.append("alert('결제 실패');");
			out.append("history.back();");
			out.append("</script>");
		} else {
			CartDAO cdao = new CartDAO();
			cdao.delete(memberId, data);
			cdao.close();
			res.sendRedirect("/mypage/paymentlist");
		}
		
		
		
	}

}
