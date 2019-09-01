<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%

int n=Integer.parseInt(request.getParameter("id"));
String s=request.getParameter("status");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","anu123456");
	Statement st=con.createStatement();
	String sql ="update orderinfo set status='"+s+"' where orderid='"+n+"'";
    st.executeUpdate(sql);
	
     con.close();
     session.setAttribute("cn","Status has been updated.");
     response.sendRedirect("agent_homepage.jsp");

} catch (Exception e) {
System.out.println(e);
}%>

