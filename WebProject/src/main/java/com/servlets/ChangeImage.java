package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import com.dao.UserDao;
import com.helper.ConnectionManager;
import com.helper.Helper;

/**
 * Servlet implementation class ChangeImage
 */

@MultipartConfig
public class ChangeImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	Part part=	request.getPart("image");
	
	String idstr=request.getParameter("id");
	int id = Integer.parseInt(idstr);
	
	String imageName = part.getSubmittedFileName();

	UserDao userDao=new UserDao(ConnectionManager.getConnection());
	try {
		
		int changeImage = userDao.changeImage(imageName, id);
		Helper helper=new Helper();
		String path = request.getRealPath("/") + "img" + File.separator + imageName;
		System.out.println(path);
		boolean saveFile = helper.saveFile(part.getInputStream(), path);
		if(!saveFile) {
			System.out.println("not updated");
		}else {
			System.out.println(" updated");
			response.sendRedirect("home.jsp");
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
