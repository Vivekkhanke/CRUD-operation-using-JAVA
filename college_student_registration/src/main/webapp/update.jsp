<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*" %>
    <% 
    	if(request.getParameter("submit")!=null){
    		
    		String id=request.getParameter("id");
    		String name=request.getParameter("sname");
    		String course=request.getParameter("course");
    		String fee=request.getParameter("fee");
 			
    		Class.forName("com.mysql.jdbc.Driver");
    		ResultSet rs;
    		
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/College","root","vivek");
    		PreparedStatement pst=con.prepareStatement("update records set StudentName=?,Course=?,Fee=? where id=?");
    		    		
    		pst.setString(1,name);
    		pst.setString(2,course);
    		pst.setString(3,fee);
    		pst.setString(4,id);
    		
    		pst.executeUpdate();
    	%>
    	<script>
    		alert("Record update Successfully");
    	</script>	
    		
    		
    <%	
    	}
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update data</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body>
	<h1>Student Update</h1>
	<div class="row">
		<div class="cool-sm-8" class="container">
            <form class="card" method="POST" action="#">
			
			<% 
			Class.forName("com.mysql.jdbc.Driver");
	  		
	  		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/College","root","vivek");
	  		PreparedStatement pst=con.prepareStatement("select * from records where id=?");
	  		ResultSet rs;
	  		
	  		String id=request.getParameter("id");
	  		pst.setString(1,id);
	  		rs=pst.executeQuery();
	  		
	  		while(rs.next())
	  		{	
								
			%>
                <div alight="left"class="container">
                    <label class="form-label">Student Name</label>
                    <input type="text" class="form-control" placeholder="Student Name" value="<%=rs.getString("StudentName") %>" name="sname" id="sname" required>
                </div>
                <div alight="left" class="container">
                    <label class="form-label">Course</label>
                    <input type="text" class="form-control" placeholder="Course" value="<%=rs.getString("Course") %>" name="course" id="Course" required>
                </div>
                <div alight="left" class="container">
                    <label class="form-label">Fee</label>
                    <input type="text" class="form-control" placeholder="Fee" value="<%=rs.getString("Fee") %>" name="fee" id="Fee" required>
                </div>
                <%
                  }
                %>
					</br>
                <div alight="right" class="container">
                    <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                    <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                </div>          
				<div align="right">
					<p><a href="index.jsp" >Click back</a>
				</div>
            </form>
        </div>
	</div>
</body>
</html>