package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.dao.UserDao;
import com.helper.ConnectionManager;
import com.pojo.User;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		
		User user=new User(first_name, last_name, email, password, gender) ;
		System.out.println(user);
		UserDao userDto=new UserDao(ConnectionManager.getConnection());
		
		HttpSession session = request.getSession();
		try {
			 
			int saveUser = userDto.saveUser(user);
			
			if(saveUser==0) {
			session.setAttribute("message", "user not saved. something went wrong");
			}else {
				session.setAttribute("message", "user saved sucessfully.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			session.setAttribute("message", "user not saved. something went wrong");
			e.printStackTrace();
		}
		
		response.sendRedirect("info.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
