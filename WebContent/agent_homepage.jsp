<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


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
	top: 15%;
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
<title>CourierBoy Homepage</title>
</head>

<body>


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
									<li class="items"><a href="agent_homepage.jsp">Home</a></li>
									<li class="items"><a href="agent_profile.jsp">Profile</a></li>
									<li class="items"><a href="update.html">Update Status</a></li>
								    <li class="items"><a href="neworder.jsp">New Orders</a></li>
									<li class="items"><a href="cordersummary.jsp">Order Summary</a></li>
									<li class="items"><a href="index.html">Log Out</a></li>
								</ul>
							</div>
						</div>
					</section>
				</div>
				<%
				String city=(String)session.getAttribute("city");
				String k="cancelled";
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms", "root", "anu123456");
						Statement st = con.createStatement();
						String sql1 = "SELECT COUNT(*)AS rowcount from orderinfo WHERE sender_city='"+city+"' and status is null ";
						ResultSet rs = st.executeQuery(sql1);
						rs.next();
						int count = rs.getInt("rowcount");
						//System.out.println(count);
				%>


				<div class="col">
				<%if(session.getAttribute("cn")!=null){%>
                    <h5 style="color:red;"><%=session.getAttribute("cn")%></h5>
                    <%session.setAttribute("cn",null);} %>
					<section class="right-body">
						<div class="card box">
							<div class="right-heading">
								<h5>Current Status</h5>
							</div>
							<div class="right-content">
								<form METHOD="POST"
									ACTION="http://localhost:8080/myapp/contactservlet"
									Name="myForm" action="#"
									onSubmit="return checkemail(this.f2.value)">

									<div class="form-group">
										<h6 >Today's Orders</h6>
										<p style="color:black"><%=rs.getString("rowcount")%></p>
									</div>

									<%
										con.close();
										} catch (Exception e) {
											System.out.println(e);
										}
									%>

									<%
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms", "root", "anu123456");
											String sql2 = "SELECT COUNT(orderid)AS panding_order from orderinfo WHERE Status IS NULL and sender_city='"+city+"'";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(sql2);
											rs.next();
									%>

									<div class="form-group">
										<h6>Pending Orders</h6>
										<p style="color:black"><%=rs.getString("panding_order")%></p>
									</div>
									<%
										con.close();
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
									<%
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms", "root", "anu123456");
											String sql3 = "SELECT COUNT(orderid)AS totalorder from orderinfo WHERE sender_city='"+city+"'and (status !='"+k+"'or status is null)";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(sql3);
											rs.next();
									%>



									<div class="form-group">
										<h6>Total order</h6>
										<p style="color:black"><%=rs.getString("totalorder")%></p>
									</div>
									<%
										con.close();
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
									<%
										try {
											Class.forName("com.mysql.jdbc.Driver");
											Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms", "root", "anu123456");
											String sql3 = "select count(distinct customer_id) As totalcustomer  from orderinfo where sender_city='"+city+"'";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(sql3);
											rs.next();
									%>


									<div class="form-group">
										<h6 >Total No. of Customer</h6>
										<p style="color:black"><%=rs.getString("totalcustomer")%></p>
									</div>



								</form>
							</div>
						</div>
					</section>

				</div>
				<%
					con.close();
					} catch (Exception e) {
						System.out.println(e);
					}
				%>
				<div class="image"></div>
			</div>
		</div>
	</div>

</body>

</html>
