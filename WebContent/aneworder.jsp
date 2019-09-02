<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

  <style>
    body {
      overflow: hidden;
      background-color: #F7F7F7;
    }

    /* right content (Navigation) */
    .left-body {
      background-color: #4DAB80;
      text-align: center;
      color: white;
      height: 100vh;
    }

    .left-body .nav-section .nav-header {
      padding: 30px;
      margin-bottom: 55px;
    }

    .left-body .nav-body .nav-items .items {
      padding: 4px 10px 4px 65px;
      margin-bottom: 30px;
    }

    .left-body .nav-body .nav-items .items a {
      text-decoration: none;
      color: white;
    }

    .left-body .nav-body .nav-items .items:hover {
      background-color: #52BA98;
    }

    .left-body .nav-body .nav-items {
      list-style-type: none;
      padding: 0%;
    }

    .left-body .nav-body .nav-items {
      text-align: left;
    }

    /* left content  card (shadow)*/
    .box {
      width: 100%;
      height: 100%;
      border: 1px solid transparent;
      border-radius: 0%;
      box-shadow: -1px 2px 17px 3px rgba(0, 0, 0, 0.32);

    }

    .right-body {
      position: relative;
      top: 25%;
      left: 50%;
      margin: auto;
      text-align: center;
      color: #52BA98;
      z-index: 1;
    }

    .input-item {
      width: 300px;
      border: none;
      border-bottom: 1px solid #52BA98;
      border-radius: 0%;
      margin-bottom: 8px
    }

    .text-item {
      width: 300px;
      border: 1px solid #52BA98;
      border-radius: 0%;
      margin-bottom: 8px
    }

    .input-item:focus {
      outline-width: 0;
    }

    .input-item::placeholder {
      color: #B7E4D5;
      font-size: 12px;
    }

    .btn-frm {
      border: 1px solid transparent;
      background-color: #4DAB80;
      border-radius: 18px;
      padding: 4px 28px;
      color: white;
      margin-right: 28px;
    }

    .right-content {
      text-align: center;
    }

    .right-heading {
      margin-top: 20px;
      margin-bottom: 25px;
    }

    .form-btn {
      margin-bottom: 20px;
      margin-top: 40px;
    }

    .image {
      transform: translate(5px, 290px);
      width: 45%;
      background-image: url(background.jpeg);
      background-repeat: no-repeat;
      background-size: 75%;
      z-index: 0;
    }
  </style>
  <title>Order Summary</title>
</head>

<body  overflow-y : auto;>


  <div class="fluid-container">
    <div class="wrapper">
      <div class="row">
        <div class="col-2">
          <section class="left-body">
            <div class="nav-section">
              <div class="nav-header">
                <h7>Friends & Corp</h7>
              </div>
              <div class="nav-body">
                <ul class="nav-items">
                  <li class="items"><a href="admin_homepage.jsp">Home</a></li>
                                  <li class="items"><a href="admin_profile.jsp">Profile</a></li>
                                  <li class="items"><a href="atrackid.html">Track Order</a></li>
                                  <li class="items"><a href="aneworder.jsp">New Orders</a></li>
                                  <li class="items"><a href="aneworder.jsp">Orders Summary</a></li>
                                  <li class="items"><a href="index.html">Log Out</a></li>
                </ul>
              </div>
            </div>
          </section>
        </div>
        <% try{
/*
int nn=(Integer)session.getAttribute("userid");
String sql1 ="SELECT * FROM admindata where admin_id='"+nn+"'";
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","anu123456");
Statement st=con.createStatement();
ResultSet rs1= st.executeQuery(sql1);
String n=rs1.getString("admin_Name");*/

String n=(String)session.getAttribute("acity");
//String n="Ghaziabad";
//System.out.println(n+"city");
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","anu123456");
Statement st=con.createStatement();
//String sql ="SELECT * FROM orderinfo where sender_city='"+n+"' and status IS NULL";
String sql ="SELECT * FROM orderinfo where sender_city IN('Ghaziabad','lko')";
ResultSet rs= st.executeQuery(sql);
if(rs.next()){%>

        <div class="col">
          <section class="right-body" >
            <div class="card box">
              <div class="right-heading">
                <h5>Order Summary</h5>
              </div>
              <div class="right-content">
                <form METHOD="POST" ACTION="http://localhost:8080/Project/WebContent/login_as_customer.jsp" Name="myForm">

                  <h5 style="align :center; "> --------------------------</h5>
<table>
<tr>
                 <td colspan="5"> <div class="form-group" align="center">
                    <h7 style=" margin-left: 10px;">Order-Id: </h7H>
                     
                  </div>
                 </td>

                 <td colspan="5"> <div class="form-group" align="center">
                    <h7 style=" margin-left: 10px;">Date: </h7H>
                    
                  </div>
                  </td>

                 <td colspan="5"> <div class="form-group" align="center">
                    <h7 style=" margin-left: 20px;">Sender's Address: </h7H>
                   
                  </div>
</td>

                <td colspan="5">  <div class="form-group" align="center">
                    <h7 style=" margin-left: 20px;">Receiver's Address: </h7H>
                    
                  </div>
             </td>
             <td colspan="5">
                  <div class="form-group" align="center">
                    <h7 style=" margin-left: 5px;">Total-Cost: </h7H>
                   
                  </div></td>
</tr>
<% 
do
{
%>
<tr>

<td colspan="5">
<div class="form-group" align="center">
<h7 style="color:black; margin-left: 0px;"><%=rs.getInt("orderid") %></h7H>
</div>
</td>
<td colspan="5">
<div class="form-group" align="center">
<h7 style="color:black; margin-left: 10px;"><%=rs.getString("date") %></h7H>
</div>
</td>
<td colspan="5">
<div class="form-group" align="center">
<h7 style="color:black; margin-left: 20px;"><%=rs.getString("sender_address") %></h7H>
</div>
</td>
<td colspan="5">
<div class="form-group" align="center">
<h7 style="color:black; margin-left: 20px;"><%=rs.getString("receiver_address") %></h7H>
</div>
</td>
<td colspan="5">
<div class="form-group" align="center">
<h7 style="color:black; margin-left:15px;"><%=rs.getInt("total_amount") %></h7H>
</div>
</td>

</tr>
<%}while(rs.next());%>
</table>
                  <h5 style="align :center; "> --------------------------</h5>


                </form>
              </div>
            </div>
          </section>

<%}
else{
	session.setAttribute("s","You don't have any new order.");
	response.sendRedirect("admin_homepage.jsp");
}
con.close();
} catch (Exception e) {
System.out.println(e);
}%>
    </div>
        <div class="image"></div>
      </div>
    </div>
  </div>

</body>

</html>
