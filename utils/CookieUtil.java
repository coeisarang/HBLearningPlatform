package net.hb.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieUtil {
	
	public static void makeCookie(HttpServletResponse res, String cName, String cValue, int maxAge) {
		
		Cookie cookie = new Cookie(cName, cValue);
		cookie.setPath("/");
		cookie.setMaxAge(maxAge);
		res.addCookie(cookie);
		
	}
	
	public static String readCookie(HttpServletRequest req, String cName) {
		
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cName)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
	}
	
	public static void deleteCookie(HttpServletResponse response, String cName) {

		Cookie cookie = new Cookie(cName, "");
        cookie.setMaxAge(0); 
        cookie.setPath("/");
        response.addCookie(cookie);
        
    }
}
