<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WRPG Test 1</title>
</head>
<body>
<h1>WRPG</h1>
<img src="https://i.imgur.com/aInqu99.png" width=600 height=400>
<form action="MemberServlet">
ID   : <input type="text" name = "id"/><br />
PW   : <input type="password" name = "pwd"/><br/>
     <input type="hidden" name = "gubun" value="login"/>
<input type="submit" value = "�α���"/>
</form>
������ ������ ȸ�������� ���� �Ͻ� �� �α��� ���ּ���</br>
<form action="MemberServlet">
  <input type="hidden" name = "gubun" value="join"/>
  <input type="submit" value = "ȸ������"/>
</form>
</body>
</html>
