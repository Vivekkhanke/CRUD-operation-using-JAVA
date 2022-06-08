 <%@page import="java.sql.*" %>
    <%     		
    		String id=request.getParameter("id");
    		String name=request.getParameter("sname");
    		String course=request.getParameter("course");
    		String fee=request.getParameter("fee");
 			
    		Class.forName("com.mysql.jdbc.Driver");
    		ResultSet rs;
    		
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/College","root","vivek");
    		PreparedStatement pst=con.prepareStatement("delete from records where id=?");
    		    		
    		pst.setString(1,id);
    		pst.executeUpdate();
    	%>
    	<script>
    		alert("Record delete Successfully");
    	</script>	
    	<body  style="background-image: url('clgg.jpg');">
    	<div align="center">
					<p><a href="index.jsp" >Click back</a>
				</div>
    	</body>
    		
    