package com.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;
import com.dao.NoteDao;
import com.helper.ConnectionManager;
import com.pojo.Note;
import com.pojo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Ajax
 */
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		
		
	
		

	NoteDao noteDao=new NoteDao(ConnectionManager.getConnection());
	HttpSession session = request.getSession();
	User user = (User)session.getAttribute("user");
	List<Note> notes = null;
	try {
		notes = noteDao.getPost(user.getId());
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	List<Note> list = notes.stream().filter(i->i.getTitle().toLowerCase().contains(name.toLowerCase())).collect(Collectors.toList());
	
		PrintWriter out = response.getWriter();
		
		for(Note us: list) {

	
		
out.print("<table class=\"table table-striped\">\n"
		+ "  <tbody>\n"
		+ "    <tr>\n"
		+ "<td>"+us.getTitle()+"</td>\n"
	
		+ "    </tr>\n"
		+ "  </tbody>\n"
		+ "</table>");
		
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
