package com.netxs.demo;

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/emplist")
public class EmpList extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ServletContext sc = getServletContext();
		String driverClass = sc.getInitParameter("driverClass");
		String dburl = sc.getInitParameter("dburl");
		String dbun = sc.getInitParameter("dbun");
		String dbpwd = sc.getInitParameter("dbpwd");
		
		try {
			Class.forName(driverClass);
		}catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();
		}
		try(Connection con = DriverManager.getConnection(dburl,dbun,dbpwd);
				PrintWriter pw = res.getWriter();){
			java.sql.Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT EMPLOYEEID,NAME,GENDER FROM EMPLOYEE");
			pw.println("<tr><th>Employee Id</th><th>Name</th><th>Gender</th><th></th></tr>");
			
			while(rs.next()) {
				String gender = null;
//				System.out.println("Gender = " +rs.getInt(3));
				if(rs.getInt(3)==1) {
					gender = "Male";
				}else {
					gender = "Female";
				}
				pw.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+gender+"</td><td><button id='submit-btn' onclick='submit(this)' value='"+rs.getInt(1)+"'>delete</button></tr>");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}
}