<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Oracle_Test.EXE</title>
</head>
<body>
<%

// String url = "jdbc:oracle:thin:@localhost:1521:XE";
// 	String user = "system", pwd = "manager"; // ���� DB �н����� �Է�

// // 1. ����Ŭ ����̹� �ε�
// Class.forName("oracle.jdbc.driver.OracleDriver");
// 	System.out.println("Driver Loading Success!!"); // ���� �ƴ��� �ֿܼ� ���
// // 2. DB�� ����
// con = DriverManager.getConnection(url, user, pwd);
// --------------------

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pass = "manager";
	Connection conn = null;
	Statement  stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	pstmt=conn.prepareStatement("SELECT NAME FROM USER_TABLE");
	rs=pstmt.executeQuery();
	out.println("<table border=\"1\">");
	while(rs.next()){
		out.println("<tr>");
        out.println("<td>NAME�� ==> "+rs.getString("name")+"</td>");
        out.println("</tr>");
	}
	out.println("</table>");
	
	conn.close();
%>
</body>
</html>
