<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script src="<%=path %>/GOLF/Scripts/check.js"></script>
    <title>My JSP 'noenough.jsp' starting page</title>


  </head>
  
  <body>
   <table width="100%" border="0" align="center">
  <tr>
    <td width="661" height="84" align="center"><p><h1 style="color:#999">此会员卡权益不足以支付订单</h1></p></td>
  </tr>
  <tr>
    <td height="44" align="center"><input type="button" name="Submit" onClick="javascript:history.back(-1);" value="返回上一页"></td>
  </tr>
</table>
  </body>
</html>
