<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
    <!--Expression tag  -->
    
    <%@page import="java.sql.*" %>
    
    <% 
    	if(request.getParameter("submit")!=null){
    		
    		String name=request.getParameter("sname");
    		String course=request.getParameter("course");
    		String fee=request.getParameter("fee");
 			
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/College","root","vivek");
    		PreparedStatement pst=con.prepareStatement("insert into records(StudentName,Course,Fee)values(?,?,?)");
    		ResultSet rs;
    		
    		pst.setString(1,name);
    		pst.setString(2,course);
    		pst.setString(3,fee);
    		pst.executeUpdate();
    	%>
    	<script>
    		alert("Record Added Successfully");
    	</script>	
    		
    		
    <%	
    	}
    
    %>
    
<html>
<head>
<meta charset="ISO-8859-1">
<title>college</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body>
	<h1>Student Registration System CRUD using - JSP</h1>
	<div class="row">

		<div class="cool-sm-8" class="container">
            <form class="card" method="POST" action="#">

                <div alight="left"class="container">
                    <label class="form-label">Student Name</label>
                    <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required>
                </div>
                <div alight="left" class="container">
                    <label class="form-label">Course</label>
                    <input type="text" class="form-control" placeholder="Course" name="course" id="Course" required>
                </div>
                <div alight="left" class="container">
                    <label class="form-label">Fee</label>
                    <input type="text" class="form-control" placeholder="Fee" name="fee" id="Fee" required>
                </div>
					</br>
                <div alight="right" class="container">
                    <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                    <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                </div>
                

            </form>
        </div>

	        <div class="cool-sm-8">
                <div class="container">
                    <table id="tbl-student" class="table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            
          <% 
	        Class.forName("com.mysql.jdbc.Driver");
	  		
	  		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/College","root","vivek");
	  		PreparedStatement pst=con.prepareStatement("insert into records(StudentName,Course,Fee)values(?,?,?)");
	  		ResultSet rs;
  		
  			String query="select * from records";
  			Statement st=con.createStatement();
  			
  			rs=st.executeQuery(query);
  			
  			while(rs.next()){
  				String id=rs.getString("id");

          %>
                            
              <tr>
	              <td><%= rs.getString("StudentName") %></td>
				  <td><%= rs.getString("Course") %></td>
				  <td><%= rs.getString("Fee") %></td>
	              <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
	              <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
              </tr>
                            
			<%
  			}
			%>
                        </thead>
                    </table>
                </div>
	        </div>
		</div>
</body>
</html>