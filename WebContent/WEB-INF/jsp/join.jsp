<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WRPG ȸ������</title>
</head>
<body>
* �̸��� �������� ������ player�� �˴ϴ�<br>* ��й�ȣ�� �������� ������ 123���� �˴ϴ�<br><br>
<form action="Sign">
���̵� : <input type="text" name="id"/>
<br><br>
�̸� : <input type="text" name="name"/>
<br><br>
��й�ȣ : <input type="password" name="pw"/>
<br><br>
<input type='radio'
       name='gender' 
       value='male'/>��
<input type='radio' 
       name='gender' 
       value='female'/>��
<br>
<input type="submit" value="ȸ������"/>
</form>
</body>
</html>
