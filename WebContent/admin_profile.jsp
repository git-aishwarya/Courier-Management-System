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
      width: 60%;
      height: 100%;
      border: 1px solid transparent;
      border-radius: 0%;
      box-shadow: -1px 2px 17px 3px rgba(0, 0, 0, 0.32);

    }

    .right-body {
      position: relative;
      top: 10%;
      left: 20%;
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

    .form-group {
      margin-left: 10px color: white;

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
  <title>Admin Profile</title>
</head>

<body style="background-image:url('image.jpeg');">


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
                                  <li class="items"><a href="aordersummary.jsp">Orders Summary</a></li>
                                  <li class="items"><a href="index.html">Log Out</a></li>
                </ul>
              </div>
            </div>
          </section>
        </div>
        <div class="col">
          <section class="right-body">
            <div class="card box">
              <div class="right-heading">
                <h5>Profile</h5>
              </div>
              <div class="right-content">
 <% try{
int n=(Integer)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","anu123456");
Statement st=con.createStatement();
String sql ="SELECT * FROM admindata where admin_id='"+n+"'";
ResultSet rs= st.executeQuery(sql);
while(rs.next())
{
%>
                <form METHOD="POST" ACTION="http://localhost:8080/myapp/contactservlet" Name="myForm" action="#" onSubmit="return checkemail(this.f2.value)">

                  <div class="form-group">
                    <h6>Admin ID</h6>
                    <p style="color:black;"><%=n%><p>
                  </div>


                  <div class="form-group">
                    <h6> Admin Name</h6>
                    <p style="color:black;"><%=rs.getString("admin_Name") %></p>
                  </div>

                  

                  <div class="form-group">
                    <h6>Email Id </h6>
                    <p style="color:black;"><%=rs.getString("email_id") %></p>
                  </div>
                  <div class="form-group">
                    <h6>Address</h6>
                    <p style="color:black;"><%=rs.getString("address") %></p>
                  </div>

                  <div class="form-group">
                    <h6>City</h6>
                    <p style="color:black;"><%=rs.getString("city") %></p>
                  </div>


                  <div class="form-group">
                    <h6>Postal Code</h6>
                    <p style="color:black;"><%=rs.getInt("postal") %></p>
                  </div>


                  <div class="form-group">
                    <h6 >Phone No.</h6>
                    <p style="color:black;"><%=rs.getString("phone") %></p>
                  </div>


                </form>
              </div>
            </div>
          </section>
<%}
con.close();
} catch (Exception e) {
System.out.println(e);
}
%>
        </div>
        <div class="image"></div>
      </div>
    </div>
  </div>

</body>

</html>
