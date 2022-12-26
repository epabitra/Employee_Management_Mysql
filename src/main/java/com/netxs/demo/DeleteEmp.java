package com.netxs.demo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/deleteemp")
public class DeleteEmp extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ServletContext sc = getServletContext();
		String driverClass = sc.getInitParameter("driverClass");
		String dburl = sc.getInitParameter("dburl");
		String dbun = sc.getInitParameter("dbun");
		String dbpwd = sc.getInitParameter("dbpwd");
		
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try(Connection con = DriverManager.getConnection(dburl,dbun,dbpwd);
				PrintWriter pw = res.getWriter();
				PreparedStatement ps = con.prepareStatement("DELETE FROM EMPLOYEE WHERE EMPLOYEEID = ?");){
			ps.setInt(1, Integer.parseInt(req.getParameter("employeeid")));
			int result = ps.executeUpdate();
			if(result==1)
				pw.println("deleted");
			else
				pw.println("error");
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
}
