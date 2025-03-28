<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete user Data</title>
<style>

.container {
    text-align: center;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #df4881;
    margin-bottom: 20px;
}

.back-button {
    padding: 10px 20px;
    background-color: #df4881;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    display: inline-block;
}

.back-button:hover {
    background-color: #df4881;
}

</style>
</head>
<body>

<%
String delete = request.getParameter("delete");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
	System.out.println("Connected to MYSQL"+con);	
	String sql = "delete from user_register where username = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, delete);
	
	int k = ps.executeUpdate();
if(k>0){
	%>
	<div class="container">
        <h1>Deleted Successfully</h1>
        <a href="manage_user.jsp" class="back-button">Back</a>
    </div>
	<%
}
else{
	%>
	<div class="container">
    <h1>Something went Wrong...please try again!!!</h1>
    <a href="manage_user.jsp" class="back-button">Back</a>
</div>
	<%
}
}
catch(Exception e) {
	System.out.println("problem "+e);
}


%>


</body>
</html>