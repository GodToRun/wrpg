<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WRPG 회원가입</title>
</head>
<body>
* 이름을 설정하지 않으면 player로 됩니다<br>* 비밀번호를 설정하지 않으면 123으로 됩니다<br><br>
<form action="Sign">
아이디 : <input type="text" name="id"/>
<br><br>
이름 : <input type="text" name="name"/>
<br><br>
비밀번호 : <input type="password" name="pw"/>
<br><br>
<input type='radio'
       name='gender' 
       value='male'/>남
<input type='radio' 
       name='gender' 
       value='female'/>여
<br>
<input type="submit" value="회원가입"/>
</form>
</body>
</html>
