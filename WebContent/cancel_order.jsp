<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import ="java.sql.*" %>
<%
int n=Integer.parseInt(request.getParameter("orderid"));
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","anu123456");
	Statement st=con.createStatement();
	String sql ="SELECT * FROM orderinfo where orderid='"+n+"'";
	ResultSet rs= st.executeQuery(sql);
	String k="cancelled";
	System.out.println("4");
	if(rs.next()){
		
		if(rs.getString("status")==null){

			String s="update orderinfo set status='"+k+"'where orderid='"+n+"'";
			PreparedStatement ps=con.prepareStatement(s);
			ps.executeUpdate();
		    response.sendRedirect("cancel_order_result.html");

		}
		else{
			String p="Your order has been already "+rs.getString("status");
			session.setAttribute("msg",p);
			response.sendRedirect("customer_homepage.jsp");
		}
		
	}
	else{
		session.setAttribute("msg","WARNING! Order ID does not exists, please check your id and try again.");
		response.sendRedirect("customer_homepage.jsp");
	}
con.close();

} catch (Exception e) {
System.out.println(e);
}%>

