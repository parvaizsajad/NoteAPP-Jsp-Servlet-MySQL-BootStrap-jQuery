package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pojo.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public int updateUser(User user) throws SQLException {
		int i = 0;

		String sql = "update user set first_name=?, last_name=? , email=? , password=? where id=?";

		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, user.getFirst_name());
		statement.setString(2, user.getLast_name());
		statement.setString(3, user.getEmail());
		statement.setString(4, user.getPassword());
		statement.setInt(5, user.getId());

		i = statement.executeUpdate();

		return i;
	}

	public int saveUser(User user) throws SQLException {

		int i = 0;

		String sql = "insert into user (first_name,last_name,email,password,gender) values (?,?,?,?,?)";

		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, user.getFirst_name());
		statement.setString(2, user.getLast_name());
		statement.setString(3, user.getEmail());
		statement.setString(4, user.getPassword());
		statement.setString(5, user.getGender());

		i = statement.executeUpdate();

		return i;
	}

	public User getUser(String email, String password) throws SQLException {

		String sql = "select * from user where email=? and password=?";

		PreparedStatement statement = con.prepareStatement(sql);

		statement.setString(1, email);
		statement.setString(2, password);

		ResultSet resultSet = statement.executeQuery();
		User user = new User();

		if (resultSet.next()) {
			user.setId(resultSet.getInt("id"));
			user.setFirst_name(resultSet.getString("first_name"));
			user.setLast_name(resultSet.getString("last_name"));
			user.setEmail(resultSet.getString("email"));
			user.setPassword(resultSet.getString("password"));
			user.setGender(resultSet.getString("gender"));
			user.setImage(resultSet.getString("image"));

		}

		return user;
	}

	public User getUserById(int id) throws SQLException {
		String sql = "select * from user where id=?";

		PreparedStatement statement = con.prepareStatement(sql);

		statement.setInt(1, id);


		ResultSet resultSet = statement.executeQuery();
		User user = new User();

		if (resultSet.next()) {
			user.setId(resultSet.getInt("id"));
			user.setFirst_name(resultSet.getString("first_name"));
			user.setLast_name(resultSet.getString("last_name"));
			user.setEmail(resultSet.getString("email"));
			user.setPassword(resultSet.getString("password"));
			user.setGender(resultSet.getString("gender"));
			user.setImage(resultSet.getString("image"));

		}

		return user;
	}
	
	public int changeImage(String imageName, int id) throws SQLException {

		String sql = "update user set image=? where id=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, imageName);
		statement.setInt(2, id);

		int executeUpdate = statement.executeUpdate();

		return executeUpdate;
	}
}
