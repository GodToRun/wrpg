<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
function getCookieValue(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
</script>
<body>
<script>
var xmlhttp = new XMLHttpRequest();
var pindex = Number(getCookieValue("pindex"));
xmlhttp.open("GET", "MemberServlet?gubun=pinfo", false);

xmlhttp.send(null);
document.write("<h1>" + getCookieValue("pname") + "���� ����</h1>");
document.write("����: " + getCookieValue("plevel") + "<br>");
document.write("EXP: " + getCookieValue("pexp") + "<br>");
document.write("ü��: " + getCookieValue("php") + "<br>");
document.write("���ݷ�: " + getCookieValue("pad") + "<br>");
document.write("������: " + getCookieValue("pap") + "<br>");

</script>
</body>
</html>