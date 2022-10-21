package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.NoteDao;
import com.helper.ConnectionManager;
import com.pojo.Note;

/**
 * Servlet implementation class updateNote
 */
public class updateNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		int noteId = Integer.parseInt(id.trim());
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String description = request.getParameter("description");
		String userId=request.getParameter("userId");
		int parseInt = Integer.parseInt(userId.trim());
		
		Note note=new Note(noteId, title, date, description, parseInt);
		
		System.out.println(note);
		NoteDao noteDao=new NoteDao(ConnectionManager.getConnection());
		int updateNote = noteDao.updateNote(noteId, note);
		response.sendRedirect("home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
