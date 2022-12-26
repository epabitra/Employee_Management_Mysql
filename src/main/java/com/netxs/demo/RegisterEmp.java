package com.netxs.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterEmp extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		System.out.println("Executed");
//		System.out.println(req.getParameter("name")+req.getParameter("salary")+req.getParameter("dob")+req.getParameter("gender")+req.getParameter("address"));
		boolean flag = Validations.register(req);
		PrintWriter pw = res.getWriter();
		
		if(flag) {
			pw.print("fill");
			return;
		}else {

			ServletContext sc = getServletContext();
			String driverClass = sc.getInitParameter("driverClass");
			String dburl = sc.getInitParameter("dburl");
			String dbun = sc.getInitParameter("dbun");
			String dbpwd = sc.getInitParameter("dbpwd");
			
			String name = req.getParameter("name");
			int salary = 0;
			String address = "not-applicable";
			if(req.getParameter("salary").length()!=0)
				salary = Integer.parseInt(req.getParameter("salary"));
			String dob = req.getParameter("dob");
			int gender = Integer.parseInt(req.getParameter("gender"));
//			System.out.println("Gender = "+gender);
			if(req.getParameter("address").length()!=0)
				address = req.getParameter("address");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date ud = null;
			Connection con = null;
			PreparedStatement ps = null;
			try {
				ud = sdf.parse(dob);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			java.sql.Date sqd= new java.sql.Date(ud.getTime());
			try {
				Class.forName(driverClass);
				con = DriverManager.getConnection(dburl,dbun,dbpwd);
				ps = con.prepareStatement("INSERT INTO EMPLOYEE (NAME, SALARY, BIRTHDATE, GENDER, ADDRESS) VALUES(?,?,?,?,?)");
				if(ps!=null) {
					ps.setString(1, name);
					ps.setInt(2, salary);
					ps.setDate(3, sqd);
					ps.setInt(4, gender);
					ps.setString(5, address);;
				}
				int result = ps.executeUpdate();
				if(result == 1) 
					pw.print("success");
//				System.out.println("Result = "+result);				
			}catch(SQLException se) {
				pw.print("error");
				se.printStackTrace();
			}
			catch(ClassNotFoundException cnfe) {
				pw.print("error");
				cnfe.printStackTrace();
			}finally {
				if(pw!=null)
					pw.close();
				if(con!=null) {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(ps!=null) {
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}