<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>

<%

    String name = request.getParameter("uname");

    String pass = request.getParameter("upass");

    try {

        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@mcndesktop07:1521:XE", "sandeep", "welcome");

        PreparedStatement ps = con.prepareStatement("select * from emp where uname=? and upass=?");

        ps.setString(1, name);

        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();

        int x = 0;

        while (rs.next()) {

            if (rs.getString(1).equals(name) && rs.getString(3).equals(pass)) {

                x = 1;

            } else {

                x = 2;

            }

        }

        if (x == 1) {

 

%>

<jsp:include page="logout.html"/>

<%                HttpSession s = request.getSession();

    out.println("<center><h1>Welcome: " + name + "</h1>");

    out.println("<br/><b>You are successfully login........ ");

} else {

    out.println("<center>" + "<b>Either You Enter Wrong UserName or Password</b>");

%>

<jsp:include page="home.jsp"/>

<%}

 

    } catch (Exception ex) {

        out.println(ex);

    } 

%>