package com.netxs.demo;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Validations extends HttpServlet{
	public static boolean register(HttpServletRequest req) {
		String name = req.getParameter("name");
//		System.out.println("Name : "+name);
		String dob = req.getParameter("dob");
//		System.out.println("Dob : "+dob);
		String gender = req.getParameter("gender");
//		System.out.println("Gender : "+gender);
//		System.out.println("Started");
		if(name=="") {
			return true; 
		}
		if(dob == "") {
			return true;
		}
		if(gender == null) {
			return true;
		}
		return false;
	}
}