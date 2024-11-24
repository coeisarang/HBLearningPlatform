package net.hb.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public DBConnPool() {
//		dbcp_hblp
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("dbcp_hblp");
			
			con = ds.getConnection();
			
			System.out.println("====================================");
			System.out.println("DB 커넥션풀 접속 성공(커넥션풀)");
			System.out.println("con1 String:" + con);
			System.out.println("====================================");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("====================================");
			System.out.println("DB 커넥션풀 접속 연결 실패(커넥션풀)");
			System.out.println(e.getMessage());
			System.out.println("====================================");
		}
	}
	
	
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
				System.out.println("rs 자원 해제");
			}
			if(psmt != null) {
				psmt.close();
				System.out.println("pstm 자원 해제");
			}
			if(stmt != null) {
				stmt.close();
				System.out.println("stmt 자원 해제");
			}
			if(con != null) {
				con.close();
				System.out.println("con 자원 해제");
			}
			
			System.out.println("====================================");
			System.out.println("DB 커넥션풀 자원 해제");
			System.out.println("====================================");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("====================================");
			System.out.println(e.getMessage());
			System.out.println("====================================");
		}
	}
}
