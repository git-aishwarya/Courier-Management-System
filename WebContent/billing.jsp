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
      overflow-y: auto;
    }

    /* right content (Navigation) */
    .left-body {
      background-color: #4DAB80;
      text-align: center;
      color: white;
      height: 120vh;
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
      top: 2%;
      left: 8%;
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

    .text-item:focus {
      outline-width: 0;
      margin-left=20px;
    }

    .input-item::placeholder {
      color: #B7E4D5;
      font-size: 12px;
    }

    .text-item::placeholder {
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
      margin-top: 50px;
      margin-bottom: 55px;
    }

    .form-btn {
      margin-bottom: 20px;
      margin-top: 40px;
    }

    .image {
      transform: translate(-10px, 280px);
      width: 45%;
      background-image: url(background.jpeg);
      background-repeat: no-repeat;
      z-index: 0;
    }
  </style>
  <title>Information Page</title>
</head>

<body onload="init();" style="background-image:url('image.jpeg');">

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
                  <li class="items"><a href="customer_homepage.jsp">Home</a></li>
                  <li class="items"><a href="customer_profile.jsp">Profile</a></li>
                  <li class="items"><a href="booking.html">Book Order</a></li>
                  <li class="items"><a href="trackid.html">Track Order</a></li>
                  <li class="items"><a href="cancel_order.html">Cancel Order</a></li>
                  <li class="items"><a href="ordersummary.jsp">Order Summary</a></li>
                </ul>
              </div>
            </div>
          </section>
        </div>
<%

try{
int n=(Integer)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","anu123456");
Statement st=con.createStatement();
String sql ="SELECT * FROM orderinfo where customer_id='"+n+"'ORDER BY date DESC LIMIT 1";
ResultSet rs= st.executeQuery(sql);
if(rs.next()){
	
%>
        <div class="col-8">
          <section class="right-body">
            <div class="card box">
              <div>
              </br>
                <h5 align="center">Billing Information</h5>
              </div>

              <div class="right-content row">
                <div class="col-6 px-5">
                  <div class="right-heading">
                    <h5>Sender Information</h5>
                  </div>
              
                    <div class="form-group">
                      <h6 align="left">User Id	&nbsp		:		&nbsp	<%=rs.getInt("customer_id") %></h6>
                      <h6 style="color:black; margin-left: 0px;"></h6H>
                    </div>
                    <div class="form-group">
                      <h6 align="left">Receiver Name	&nbsp		:		&nbsp	<%=rs.getString("sender_name") %></h6>
                      
                    </div>
                    <div class="form-group">
                      <h6 align="left">Address	&nbsp		:	&nbsp		<%=rs.getString("sender_address") %></h6>
                      
                    </div>
                    <div class="form-group">
                      <h6 align="left">City		&nbsp	:		&nbsp	<%=rs.getString("sender_city") %></h6>
                      
                    </div>
                    <div class="form-group">
                      <h6 align="left">Postal No.		&nbsp	:	&nbsp		<%=rs.getString("sender_postal") %></h6>
                      <h6 style="color:black; margin-left: 0px;"></h6H>
                    </div>
                    <div class="form-group">
                      <h6 align="left">Phone No.	&nbsp	:		&nbsp	<%=rs.getString("sender_phone") %></h6>
                      <h6 style="color:black; margin-left: 0px;"></h6H>
                    </div>
                    <div class="right-heading">
                      <h5>Product Details</h5>
                      <div class="form-group">
                        <h6 align="left">Order Id	&nbsp		:		&nbsp	<%=rs.getInt("orderid") %></h6>
                        <h6 style="color:black; margin-left: 0px;"></h6H>
                      </div>
                      <div class="form-group">
                        <h6 align="left">Weight		&nbsp:	&nbsp		<%=rs.getInt("product_weight") %></h6>
                        <h6 style="color:black; margin-left: 0px;"></h6H>
                      </div>

                      <div class="form-group">
                        <h6 align="left">Total Amount	&nbsp		:	&nbsp		<%=rs.getString("total_amount") %></h6>
                        <h6 style="color:black; margin-left: 0px;"></h6H>
                      </div>
                    </div>

                </div>
                <div class="col-6">
                  <div class="right-heading">
                    <h5>Receiver Information</h5>
                  </div>

                  <div class="form-group">
                    <h6 align="left">Receiver Name		&nbsp	:		&nbsp	<%=rs.getString("receiver_name") %></h6>
                    <h6 style="color:black; margin-left: 0px;"></h6H>
                  </div>
                  <div class="form-group">
                    <h6 align="left">Address	&nbsp		:	&nbsp	<%=rs.getString("receiver_address") %></h6>
                    <h6 style="color:black; margin-left: 0px;"></h6H>
                  </div>
                  <div class="form-group">
                    <h6 align="left">City		&nbsp	:	&nbsp		<%=rs.getString("receiver_city") %></h6>
                    <h6 style="color:black; margin-left: 0px;"></h6H>
                  </div>
                 <div class="form-group">
                    <h6 align="left">Postal N0.			:			<%=rs.getString("receiver_postal") %></h6>
                    <h6 style="color:black; margin-left: 0px;"></h6H>
                  </div>
                  <div class="form-group">
                    <h6 align="left">Phone No.	&nbsp		:		&nbsp	<%=rs.getString("receiver_phone") %></h6>
                    <h6 style="color:black; margin-left: 0px;"></h6H>
                  </div>

                </div>
                <%}
con.close();
} catch (Exception e) {
System.out.println(e);
}
%><form action="payment.html" method="post">
 

                <div class="form-btn col-12" align="center">
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="submit" class="btn-frm" value="Proceed to payment" >
                </div>
              </div>
              
            </div>
          </section>
</form>
        </div>
        <div class="image"></div>
      </div>
    </div>
  </div>

</body>

</html>
