<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="customerMgr" class="entity.CustomerMgr" scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    
    <link rel="stylesheet" href="<%=path %>/GOLF/Template/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    
    <script type="text/javascript">
        $(function () {
            $('#center').hide();
            $('#bottom').hide();
            $('.top-next').click(function () {
                $('#top').hide();
                $('#center').show();
            })
            $('.center-next').click(function () {
                $('#center').hide();
                $('#bottom').show();
            })
            $('.center-prev').click(function () {
                $('#center').hide();
                $('#top').show();
            })
            $('.bottom-prev').click(function () {
                $('#bottom').hide();
                $('#center').show();
            })
        })
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    a:link {
	color: #FFF;
}
    a:visited {
	color: #FFC;
}
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body bgcolor='#586683'>
    <div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>顾客信息</div>
    
     <form action="<%=path %>/servlet/CustomerServlet" name="serchCustomer" method="post">
 <input name="operation" type="hidden" id="operation" value="serch"/><br />
    <p>
      <label for="productnumber"> </label>
     <input type="text" value="通过号码或姓名查询" name="serchcustomerinfo" id="serchcustomerinfo" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
	   <input type="submit" name="Submit" value="search">
	</p>
</form>
    <p>&nbsp;</p>
    <table width="100%" class="tb" id="top">
      <thead>
        <tr >
          <th width="4%" align="center">姓名</th>
          <th width="4%" align="center">性别</th>
          <th width="8%" align="center">电话</th>
          <th width="4%" align="center">身份</th>
          <th width="5%" align="center">出生年月</th>
          <th width="11%" align="center">电子邮箱</th>
          <th width="4%" align="center">住址</th>
          <th width="4%" align="center">职务</th>
          <th width="6%" align="center">证件类型</th>
          <th width="11%" align="center">证件号码</th>
          <th width="15%" align="center">兴趣</th>
          <th width="15%" align="center">编辑</th>
          <th width="15%" align="center">删除</th>
          <th width="1%" align="center"></th> 
        </tr>
      </thead>
       <%
	java.util.ArrayList<Customer> customerList = new java.util.ArrayList<Customer>();
	customerList = customerMgr.getCustomerList();

    for(Customer customer : customerList){
		if(customer.getCus_Enabled()!=0){
       %>
      <tr>
    <td align="center"><%=customer.getCus_Name()%></td>
    <td align="center"><%=customer.getCus_Sex()%></td>
    <td align="center"><%=customer.getCus_Phone()%></td>
    <td align="center">
     <%
        if(customer.getCus_Status() ==1){
            out.println("会员");
        }
        if(customer.getCus_Status() ==0){
            out.println("普通顾客");
        }
     %>
     </td>
    <td align="center"><%=customer.getCus_Birthday()%></td>
    <td align="center"><%=customer.getCus_Email()%></td>
    <td align="center"><%=customer.getCus_Address()%></td>
    <td align="center"><%=customer.getCus_Position()%></td>
    <td align="center"><%=customer.getCus_Cardtype()%></td>
    <td align="center"><%=customer.getCus_Postnumber()%></td>
    <td align="center"><%=customer.getCus_interest()%></td>
    <td align="center"><a href="<%=path %>/GOLF/Template/editCustomer.jsp?phonenumber=<%=customer.getCus_Phone()%>" onclick='return window.confirm("eidit this customerinfo，\Are you sure?")'>edit</a></td>
    <td align="center"><a href="<%=path %>/servlet/CustomerServlet?operation=del&customerphone=<%=customer.getCus_Phone()%>" onclick='return window.confirm("this customer will be deleted，\Are you sure?")'>delete</a></td>
    
    
    
  </tr>
  <%
  }
  	}
  %>
    </table>
    
   
</body>
</html>