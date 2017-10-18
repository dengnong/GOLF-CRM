<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<%
System.out.println("comemenujsp");
String region=request.getParameter("region");
System.out.println(region);
String country = request.getParameter("country");
//int country = Integer.parseInt(request.getParameter("country"));

System.out.println(country);
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/golf-crm?"
		+ "useUnicode=true&characterEncoding=gbk&zeroDateTimeBehavior=convertToNull";
String user = "root";
String password = "dengnong1";
Connection conn = null;
Statement st = null;
ResultSet rs = null;
List countries = new ArrayList();
List cities = new ArrayList();

	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	try {
		conn = DriverManager.getConnection(url, user, password);
		st = conn.createStatement();
		if(region != null)
		{
			System.out.println("select cou");
			rs=st.executeQuery("SELECT cou_Number FROM tb_course where pro_Number='"+region+"'");
			while (rs.next())
			{
				countries.add(rs.getString(1));
				System.out.println(countries);
			}
		}
		if(country != null)
		{
			System.out.println("select ser");
			rs=st.executeQuery("SELECT ser_ServiceID FROM tb_service where cou_Number='"+country+"'");
			while (rs.next())
			{
				cities.add(rs.getString(1));
				System.out.println(cities);
			}
		}
		rs.close();
		st.close();
		conn.close();
	}  catch (Exception e)  {   
		e.printStackTrace();
	}
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
	out.println("<response>");
	for(int i=0;i<countries.size();i++)
	{
		System.out.println(countries.get(i));
		out.println("<country>" + countries.get(i).toString() + "</country>");
	}
	for(int i=0;i<cities.size();i++)
	{
		out.println("<city>" + cities.get(i).toString() + "</city>");
	}
	out.println("</response>");
	//out.close();
	//out.clear();
	//out = pageContext.pushBody();
%>