<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires","0");
	if(session == null || session.getAttribute("un") == null || session.getAttribute("pw") == null){
		response.sendRedirect("error.html");	
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Profile</title>
<link rel='stylesheet' href='styles.css'>
<style>
	h2{
		color:green;
		font-family: monospace;
	}
	table{
		width: 100%;
		height: 100%;
	}
	table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	}
	th, td {
	padding: 5px;
	text-align: left;
	}
	a{
		text-decoration:none;
	}
</style>
</head>
<body>
<div class="sidebar">
         <a class='active' >Menu</a>
        <a  href="admindash.jsp">Admin Dashboard</a>
      <a  href="a_1_addElection.jsp">Add Election</a>
        <a  href="a_2_addCandidate.jsp">Add Candidate</a>
        <a  href="a_3_view.jsp">View</a>
        <a href='AdminLogOut'>Logout</a>
    </div>
    
    <div class='content'>
        <div id='topnav'>
            <p style='text-align: center; color:white; font-family: monospace; font-size: x-large;'>College Election System</p>
        </div>
        <h2>Update User Profile</h2>
        <form method='post' action='a_3_3_updateUser_dba.jsp'>
        <table>
        <% 
 
		try {
			
		     String username = request.getParameter("username"); 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","epproject","project123");
			
			String sql = "select * from registeruser where username = ? ";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
		%>
        	<tr>
				<th>UserName</th>
				<td><input type="text" name="uname" value="<%= rs.getString(1) %>" readonly="readonly"/></td>
			</tr>
			<tr>
					<th>Email</th>
					<td><input type="text" name="email" value="<%= rs.getString(2) %>"></td>
			</tr>
			<tr>
					<th>Phone Number</th>
					<td><input type="text" name="phnum" value="<%= rs.getString(3) %>" ></td>
			</tr>
			<tr>
					<th>Branch</th>
					<td><input type="text" name="branch" value="<%= rs.getString(4) %>" ></td>
			</tr>
			<tr>
					<th>Gender</th>
					<td><input type="text" name="gender" value="<%= rs.getString(5) %>" ></td>
			</tr>
			<tr>
					<th>Password</th>
					<td><input type="text" name="pword" value="<%= rs.getString(6) %>" ></td>
			</tr>
			
		<%	
		
			}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
	</table>
	<input type="submit" value="Update">
	</form>
    </div>
</body>
</html>