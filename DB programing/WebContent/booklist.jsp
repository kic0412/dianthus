<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
 Class.forName("oracle.jdbc.driver.OracleDriver");
 String url="jdbc:oracle:thin:@localhost:1521:xe"; 
	
	/* 오라클 XE 버전이 아닌 정식버전은 orcl을 입력한다. */
 Connection dbconn=DriverManager.getConnection(url, "c##madang", "madang");
 Statement stmt = dbconn.createStatement();
 ResultSet myResultSet=stmt.executeQuery("SELECT * FROM Book");
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** BOOK LIST **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7" bordercolordark="white" bordercolorlight="#B9E0FA">
    <tr>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>BOOKNAME</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>PUBLISHER</b></span></p>
        </td>
        <td width="50" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>PRICE</b></span></p>
        </td>
    </tr>
 <%
 if(myResultSet!=null){
  while(myResultSet.next()){
     String W_BOOKID=myResultSet.getString("bookid");
     String W_BOOKNAME=myResultSet.getString("bookname");
     String W_PUBLISHER=myResultSet.getString("publisher");
     String W_PRICE=myResultSet.getString("price");
 %>   
    <tr>
	    <td width="150" height="20">
             <p><span style="font-size:9pt;">
             <a href="bookview.jsp?bookid=<%=W_BOOKID%>">
             <font face="돋움체" color="black">
             <%=W_BOOKNAME%></font></a></span></p>
         </td>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=W_PUBLISHER%></font></span></p>
        </td>

        <td width="50" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=W_PRICE%></font></span></p>
        </td>
    </tr>
 <%
    }
   }
   stmt.close();
   dbconn.close();
 %>    
</table>
<table cellpadding="0" cellspacing="0" width="400" height="23">
    <tr>
        <td width="1350">
            <p align="right"><b><a href="booklist.jsp">
            <font size="1" face="돋움체" color="black">LIST</font></a></b></p>
        </td>
    </tr>
</table>
</body>
</html>