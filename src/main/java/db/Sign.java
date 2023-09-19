 
package db;

import java.io.IOException;
import java.security.MessageDigest;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@SuppressWarnings("serial")
@WebServlet("/Sign")
public class Sign extends HttpServlet {
	private Connection con; 
	private PreparedStatement stmt;
	private void connDB() {
	    try {
	    	Class.forName(MemberDAO.driver);
			con = DriverManager.getConnection(MemberDAO.url, MemberDAO.user, MemberDAO.pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)
    throws ServletException, IOException {
		try {
			SHA256 sha = new SHA256();
		    response.setContentType("text/html;charset=utf-8");
		    PrintWriter out=response.getWriter();	
		    //DB 연결
		    connDB();
		    String id = request.getParameter("id");
		    String pw = request.getParameter("pw");
		    String name = request.getParameter("name");
		    String gender = request.getParameter("gender");
		    if (name.isEmpty())
		    	id = "player";
		    if (pw.isEmpty())
		    	pw = "123";
		    //DATABASE SQL 쿼리 (세미콜론 X)
		    String query = "INSERT INTO WRPG_USER_TABLE(ID,PWD,NAME,GENDER,WRPG_LEVEL,WRPG_EXP,WRPG_CAREER,WRPG_HP,WRPG_AD,WRPG_AP,WRPG_POSX,WRPG_POSY,WRPG_MAXHP,WRPG_INV,WRPG_SWORD,WRPG_ARMOR,WRPG_COIN) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";  
		    stmt = con.prepareStatement(query);
		    stmt.setString(1, id);
		    stmt.setString(2, sha.encrypt(pw));
		    stmt.setString(3, name);
		    System.out.println(gender);
		    if (gender.equals("male"))
		    	stmt.setString(4, "M");
		    else if (gender.equals("female"))
		    	stmt.setString(4, "F");
		    else
		    	stmt.setString(4, "M");
		    stmt.setInt(5, 1);
		    stmt.setInt(6, 0);
		    stmt.setString(7, "CIVILIAN");
		    stmt.setInt(8, 10);
		    stmt.setInt(9, 1);
		    stmt.setInt(10, 1);
		    stmt.setFloat(11, 25.3f);
		    stmt.setFloat(12, 6.2f);
		    stmt.setFloat(13, 10);
		    stmt.setString(14, "");
		    stmt.setString(15, "");
		    stmt.setString(16, "");
		    stmt.setInt(17, 10);
		    ResultSet rs = stmt.executeQuery(); //실행시켜서 반환값으로 ResultSet을 얻음 
		    rs.close();
		    stmt.close();
		    con.close();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
			requestDispatcher.forward(request, response);
		} catch(Exception e) { e.printStackTrace(); }
    }
}
    

