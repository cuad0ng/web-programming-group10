package murach.email.data;

import java.sql.*;
import java.util.ArrayList;

import murach.email.business.User;

public class UserDB {

	/*
	 * public static int insert(User user) { ConnectionPool pool =
	 * ConnectionPool.getInstance(); Connection connection = pool.getConnection();
	 * PreparedStatement ps = null;
	 * 
	 * String query = "INSERT INTO User (Email, FirstName, LastName) " +
	 * "VALUES (?, ?, ?)"; try { ps = connection.prepareStatement(query);
	 * ps.setString(1, user.getEmail()); ps.setString(2, user.getFirstName());
	 * ps.setString(3, user.getLastName()); return ps.executeUpdate(); } catch
	 * (SQLException e) { System.out.println(e); return 0; } finally {
	 * DBUtil.closePreparedStatement(ps); pool.freeConnection(connection); } }
	 */
	private static String URL = "jdbc:mysql://remotemysql.com:3306/Yd10534PFF";
	private static String username = "Yd10534PFF";
	private static String password = "wVi7PVzoR0";

	protected static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(URL, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	private static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

	public static void insert(User user) {
		String query = "INSERT INTO User (Email, FirstName, LastName) " + "VALUES (?, ?, ?)";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getFirstName());
			preparedStatement.setString(3, user.getLastName());

			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public static int update(User user) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;

		String query = "UPDATE User SET " + "FirstName = ?, " + "LastName = ? " + "WHERE Email = ?";
		try {
			ps = connection.prepareStatement(query);
			ps.setString(1, user.getFirstName());
			ps.setString(2, user.getLastName());
			ps.setString(3, user.getEmail());

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}

	public static int delete(User user) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;

		String query = "DELETE FROM User " + "WHERE Email = ?";
		try {
			ps = connection.prepareStatement(query);
			ps.setString(1, user.getEmail());

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}

	public static boolean emailExists(String email) {
		ResultSet rs = null;
		
		String query = "SELECT Email FROM User " + "WHERE Email = ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setString(1, email);

			rs = preparedStatement.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			return false;
		} 
	}

	/*
	 * public static boolean emailExists(String email) { ConnectionPool pool =
	 * ConnectionPool.getInstance(); Connection connection = pool.getConnection();
	 * PreparedStatement ps = null; ResultSet rs = null;
	 * 
	 * String query = "SELECT Email FROM User " + "WHERE Email = ?"; try { ps =
	 * connection.prepareStatement(query); ps.setString(1, email); rs =
	 * ps.executeQuery(); return rs.next(); } catch (SQLException e) {
	 * System.out.println(e); return false; } finally { DBUtil.closeResultSet(rs);
	 * DBUtil.closePreparedStatement(ps); pool.freeConnection(connection); } }
	 */

	public static User selectUser(String email) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT * FROM User " + "WHERE Email = ?";
		try {
			ps = connection.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			User user = null;
			if (rs.next()) {
				user = new User();
				user.setFirstName(rs.getString("FirstName"));
				user.setLastName(rs.getString("LastName"));
				user.setEmail(rs.getString("Email"));
			}
			return user;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}

	public static ArrayList<User> selectUsers() {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT * FROM User";
		try {
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			ArrayList<User> users = new ArrayList<User>();
			while (rs.next()) {
				User user = new User();
				user.setFirstName(rs.getString("FirstName"));
				user.setLastName(rs.getString("LastName"));
				user.setEmail(rs.getString("Email"));
				users.add(user);
			}
			return users;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}
}