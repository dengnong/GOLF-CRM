<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="customerMgr" class="entity.CustomerMgr" scope="application"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1FFF/xhtml">
<head>
	
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>  
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
</head>
<body bgcolor='#586683'>
<div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>新增会员<b class="tip"></b>查找顾客</div>
<br/>

<form action="<%=path %>/servlet/VipServlet" name="serchVip" method="post" >
    <input name="operation" type="hidden" id="operation" value="serchaddvip"/>
    <p>
      <label for="serchvip"> </label>
     <input type="text" value="通过会员电话或姓名查询" name="serch" id="serch" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
	   <input type="submit" name="Submit" value="search">
	</p>
</form>
<p>&nbsp;</p>
<table width="100%" class="tb" id="top">
    <thead>
    <tr >
        <th width="40%" align="center">姓名</th>
        <th width="40%" align="center">电话</th>
        <th width="20%" align="center">升级会员</th>
    </tr>
    </thead>

    <%
        java.util.ArrayList<Customer> customerList = new java.util.ArrayList<Customer>();
        customerList = customerMgr.getCustomerList();


        for(Customer customer : customerList){
            if(customer.getCus_Enabled()!=0 )
            {
    %> 

    <tr>
    	
        <td align="center"><%=customer.getCus_Name()%></td>
        <td align="center"><%=customer.getCus_Phone()%></td>
        
        <td align="center"><a href="<%=path %>/servlet/VipServlet?operation=addvip1&vipphone=<%=customer.getCus_Phone()%>" onclick='return window.confirm("Upgrade to Premium，\Are you sure?")'>关联产品卡</a></td>
    </tr>
    <%
        }
        }
    %>
</table>


</tbody>
</table>
</body>
</html>