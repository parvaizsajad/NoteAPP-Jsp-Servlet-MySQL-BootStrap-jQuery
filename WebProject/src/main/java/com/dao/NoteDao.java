package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pojo.Note;

public class NoteDao {

	private Connection con;

	public NoteDao(Connection con) {
		super();
		this.con = con;
	}

	public int saveNote(Note note, int userId) throws SQLException {

		int result = 0;

		String str = "insert into note (title,date,description,userId) values (?,?,?,?)";

		PreparedStatement statement = con.prepareStatement(str);

		statement.setString(1, note.getTitle());
		statement.setString(2, note.getDate());
		statement.setString(3, note.getDesc());
		statement.setInt(4, userId);

		result = statement.executeUpdate();

		return result;

	}

	public List<Note> getPost(int userId) throws SQLException {

		
		
		List<Note> noteList=new ArrayList<>();
		

		String str = "select * from note where userId=?";

		PreparedStatement statement = con.prepareStatement(str);

		statement.setInt(1, userId);

		 ResultSet set = statement.executeQuery();
		 
		 while(set.next()) {
			 Note note = new Note();
			note.setId(set.getInt(1));
			note.setTitle(set.getString(2));
			note.setDate(set.getString(3));
			note.setDesc(set.getString(4));
			note.setUserId(set.getInt(5));
			noteList.add(note);
		 }

		return noteList;

	}
	
	public Note getNoteById(int noteId) throws SQLException {

		


		String str = "select * from note where id=?";

		PreparedStatement statement = con.prepareStatement(str);

		statement.setInt(1, noteId);

		 ResultSet set = statement.executeQuery();
		 Note note = new Note();
		 if(set.next()) {
		
			note.setId(set.getInt(1));
			note.setTitle(set.getString(2));
			note.setDate(set.getString(3));
			note.setDesc(set.getString(4));
			note.setUserId(set.getInt(5));
		 }

		return note;

	}
	
	 public int updateNote(int id,Note note) {

	        int f = 0;
	
	        try {
	        
	            String query = "update note set title=? , date=? , description=?  where  id =? ";
	            PreparedStatement p = con.prepareStatement(query);
	            p.setString(1,note.getTitle());
	            p.setString(2, note.getDate());
	            p.setString(3, note.getDesc());
	            p.setInt(4, id);
	            
	   f= p.executeUpdate();
	         
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return f;
	    }


	 public boolean deleteNote(int id) {

	        boolean f = true;
	
	        try {
	        
	            String query = "delete from note where  id =?";
	            PreparedStatement p = con.prepareStatement(query);
	            p.setInt(1, id);
	            
	   f= p.execute();
	         
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return f;
	    }


}
