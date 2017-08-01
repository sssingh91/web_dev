<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%@page import="javax.sql.*" %>
	<%@page import="java.sql.Connection" %>
	<%
		String SStart = request.getParameter("statstation");
		String SEnd = request.getParameter("endstation");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lmrg","root","mirza123");
		Statement st=con.createStatement();
	%>
	
	<%	
		
		
		//while(rsStart.next()){
		//String SStartName = rsStart.getString("StationName").toString();
		//String SEndName = rsStart.getString(1).toString();
		//}
	%>
		<center>
		<div class="row">
			<div class="col-1-1">
				<div class="row post">
					<div class="col-1-12">
						<div class="wrap-col">
							<table style="border-style: solid; border-width: 3px; bordater-color:red;">
								
								<caption style='background-color:red; padding:5px;'><h1>List of Stations  From
								<%ResultSet rsStart = st.executeQuery("SELECT * FROM stations where S_ID='"+SStart+"'");
									while(rsStart.next()){ %>
								 <%=rsStart.getString(2)%><%}%> To 
								 <%ResultSet rsEnd = st.executeQuery("SELECT * FROM stations where S_ID='"+SEnd+"'");
									while(rsEnd.next()){ %>
								 <%=rsEnd.getString(2)%><%}%>
								 </h1></caption>
								
								<tr>
									<th style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;" rowspan='1'>S.No.</th>
									<th style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;" rowspan='1'>Station Name</th>
									<th style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"  colspan='1'>Distance(m)</th>
									<th style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"  colspan='1'>Contact No</th>
									<th style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"  colspan='1'>Near By Places</th>
								</tr>
									<center>
									<%
										ResultSet rs=st.executeQuery("SELECT * FROM stations where S_ID between '"+SStart+"' and '"+SEnd+"'");
										int i = 0;
										while(rs.next()){
											i++;
									%>
									<tr>
										<td style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"><%=i%></td>
										<td style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"><%=rs.getString(2)%>(<%=rs.getString(3)%>)</td>
										
										<% if(i==1){%>
											<td style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;">0.00</td>
										 <% } else { %>
											<td style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"><%=rs.getString(5)%></td>
										<%} %>
										
										<td style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"><%=rs.getString(6)%></td>
										<td style="border:1px solid red; align:left; margin-left:5px; margin-right:5px; padding:5px;"><%=rs.getString(8)%></td>
									</tr>
									<%} %>
									
							</table>
							<br/>
							<form action="index.jsp" method="post">
								<input type="submit" value="Return" style="width:170px;height:40px;color:white;background-color:red;border-radius:5px;font-family:max-height;font-size:15px;" href="index.jsp">
							</form>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</center>
</body>
</html>