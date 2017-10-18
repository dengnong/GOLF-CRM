<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%/* String phonenumber = String.valueOf(session.getAttribute("phonenumber"));
 System.out.println("come menu "+phonenumber);  */
 
 String phonenumber=request.getParameter("phonenumber");
 System.out.println("come menu "+phonenumber);
 
//String vipname = String.valueOf(request.getAttribute("vipname"));
//String vipsex = String.valueOf(request.getAttribute("vipsex"));
//System.out.println(vipname+" "+vipsex);
 %>
 <%@ page   errorPage="/errorPage.jsp" %> 
<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Dark Login Form</title>
    <link rel="stylesheet" href="<%=path %>/GOLF/Template/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <style type="text/css">
    a:link {
	color: #FFF;
}
a:visited {
	color: #FFC;
}
    </style>
<title>级联菜单</title>
</head>
<%
	//连接到derby数据库，并且得到一个List，作为第一个select控件的数据源
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/golf-crm?"
			+ "useUnicode=true&characterEncoding=gbk&zeroDateTimeBehavior=convertToNull";
	String user = "root";
	String password = "dengnong1";
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	List items1=new ArrayList();
	
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(url, user, password);
			st = conn.createStatement();
			rs = st.executeQuery("select view_pro_Number from view_vip03 where view_cus_Phone='"+phonenumber
					+"' and view_vip_Enabled= 1 ");
			while(rs.next()){
				items1.add(rs.getString(1));
				
			}
			rs.close();
			st.close();
			conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(!conn.isClosed())
			System.out.println("Succeeded connecting to the Database!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
%>
<body>
<div class="alert alert-info">当前位置<b class="tip"></b>呼叫中心<b class="tip"></b>新增顾客</div>
<script language="javascript">
var XMLHttpReq;//这个例子里面只用到一个XMLHttpRequest对象，用于获取服务端返回的XML序列
 	//创建XMLHttpRequest对象
    function createXMLHttpRequest() {
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			XMLHttpReq = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
	}
	//发送请求函数
	function sendRequest1(url) {
		createXMLHttpRequest();
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse1;//指定响应函数
		XMLHttpReq.send(null);  // 发送请求
	}
	// 处理返回信息函数
    function processResponse1() {
    	if (XMLHttpReq.readyState == 4) { // 判断对象状态
        	if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
        		updateList1();
				
		    } else { //页面不正常
		    }
        }
    }
	//更新菜单函数
	function updateList1() {
	    var country=XMLHttpReq.responseXML.getElementsByTagName("country");
	    var list = document.all.list1;
        for(var i=0;i<country.length;i++){
        	list.add(new Option(country[i].firstChild.data,country[i].firstChild.data));
        }
	}

	//发送请求函数
	function sendRequest2(url) {
		createXMLHttpRequest();
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse2;//指定响应函数
		XMLHttpReq.send(null);  // 发送请求
	}
	// 处理返回信息函数
    function processResponse2() {
    	if (XMLHttpReq.readyState == 4) { // 判断对象状态
        	if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
				updateList2();
		    } else { //页面不正常
		    }
        }
    }

	function updateList2() {
        var city=XMLHttpReq.responseXML.getElementsByTagName("city");
       	var list = document.all.list2;
        for(var i=0;i<city.length;i++){
        	list.add(new Option(city[i].firstChild.data,city[i].firstChild.data));
        }
	}
	// 创建级联菜单函数
	function showList1(obj) {
		clearList1();
    	//clearList2();
		sendRequest1("menujsp.jsp?region=" + obj);
	}
	function showList2(obj) {
		clearList2();
		sendRequest2("menujsp.jsp?country="+obj);
	}

	function clearList1()
	{
		var list = document.all.list1;
		list.options.length=0;
    	list.add(new Option("---请选择场地---",""));
	}

	function clearList2()
	{
		var list = document.all.list2;
		list.options.length=0;
        list.add(new Option("---请选择服务---",""));
	}

</script>
<form name="selectservice" action="<%=path %>/servlet/OrderServlet " method="post">
<input name="operation" type="hidden" id="operation" value="selectservice"/>
 <input type="hidden" value="<%=phonenumber%>" name="phonenumber" id="phonenumber"/>
 <p>
<p>&nbsp;</p>
<table width="536" border="0">
  <tr>
    <td width="366"><select onChange="showList1(this.options[this.options.selectedIndex].value)" name="mli"  style="width:300px">
      <option value=''>---请选择会员卡类型---</option>
      <%
	for(int i=0;i<items1.size();i++)
	{
		out.println("<option value='"+items1.get(i)+"'>"+items1.get(i)+"</option>");
	}
%>
    </select> 
    <a target="_blank" href="<%=path %>/GOLF/Callcenterpage/actinfo.jsp?phonenumber=<%=phonenumber%>" >持卡状态</a></td>
    <td width="150" align="center" valign="middle"><a href="javascript:location.reload();">更改后请刷新页面</a></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>

<select name="list1" onChange="showList2(this.options[this.options.selectedIndex].value)" style="width:300px">
<option name="">---请选择场地编号---</option>
</select>
</p>
<p>&nbsp;</p>
<p>

<select  name="list2" onChange="if(this.selectedIndex)" style="width:300px">
<option name="">---请选择服务编号---</option>
</select>
</p>
<p>&nbsp;</p>
<p>

<script src="<%=path %>/GOLF/Scripts/laydate.js" type="text/javascript" language="javascript"></script>
<input type="text" value="选择到场日期" name="redate" id="redate" onClick="laydate()">
</p>
<p>&nbsp;</p>

<p>&nbsp;</p>

    <script> 
//用户数量 
var userNumber = 0; 
addUser = function() 
{ 
userNumber++; 
var users = document.getElementById('users'); 
//创建一个节点 
var node = document.createElement('div'); 
var user = ' <p>&nbsp;</p>姓名'+userNumber+'：<input type="text" name="username"><p>&nbsp;</p>' 
+'电话'+userNumber+'：<input type="text" name="password">'; 
node.innerHTML = user; 

users.insertBefore(node,null); 
} 
</script> 

<form action="<%=path %>/servlet/servlet" method="post" > 
<input type="button" value="点击添加成员信息" onClick="return fn()" /> 
<div id="users" > 
</div>
<p>&nbsp;</p>

<table width="300" border="0">
        <tr>
          <td align="center">
          <button type="button" href=”#” onclick="javascript :history.back(-1);">返回上页</button></td>
          <td align="center"><input name="submit" type="submit" value="确认提交" onClick="return confirmAct2()"/></td>
        </tr>
      </table>
</form> 


<p>&nbsp;</p>
<script>
function fn(){
    if(confirm("确定添加到场人数")){
    	addUser();
    	return true;
    }else{
       return false;
    }
}
</script>
<script>
function confirmAct2(){
    if(confirm("确定信息填写无误")){
    	
    	return true;
    }else{
       return false;
    }
}
</script>

</form>
</body>
</html>