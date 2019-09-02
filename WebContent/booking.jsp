<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%

int id=(Integer)session.getAttribute("userid");

String name=request.getParameter("s2");
String address=request.getParameter("s3");
String city=request.getParameter("s5");
String postal=request.getParameter("s6");
String mobile=request.getParameter("s7");
String ty=request.getParameter("t");
int wt=Integer.parseInt(request.getParameter("g2"));
String rname=request.getParameter("r2");
String raddress=request.getParameter("r3");
String rcity=request.getParameter("r5");
String rpostal=request.getParameter("r6");
String rmobile=request.getParameter("r7");
String n="1000";
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","anu123456");
       String sql="insert into orderinfo(customer_id,sender_name,sender_address,sender_city,sender_postal,sender_phone,receiver_name,receiver_address,receiver_city,receiver_postal,receiver_phone,product_type,product_weight,total_amount) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
       PreparedStatement ps=con.prepareStatement(sql);
      
       ps.setInt(1,id);
       ps.setString(2,name); 
       ps.setString(3,address);
       ps.setString(4,city);
       ps.setString(5,postal);
       ps.setString(6,mobile);
       ps.setString(7,rname);
       ps.setString(8,raddress);
       ps.setString(9,rcity);
       ps.setString(10,rpostal);
       ps.setString(11,rmobile);
       ps.setString(12,ty);
       ps.setInt(13,wt);
       
       ps.setString(14,n);
      
       ps.executeUpdate();
       
       con.close();
       response.sendRedirect("billing.jsp");

}
catch(Exception ex)
{
//System.out.println("Error :"+ ex.getMessage());
out.println("Error :"+ ex + "Wrong input details");
}
%>