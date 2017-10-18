<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta charset="utf-8"></meta>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"></meta>
  <title>Add product</title>
    <link rel="stylesheet" href="<%=path %>/GOLF/Template/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script src="<%=path %>/GOLF/Scripts/check.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
  </head>
  
  <body>
  <div class="alert alert-info">当前位置<b class="tip"></b>呼叫中心<b class="tip"></b>新增会员</div>
  
  <form action="<%=path %>/servlet/VipServlet" method="post" name="addvip" onsubmit="return validate_channel_info_addvip()" >
  <input name="operation" type="hidden" id="operation" value="addvip" />
    <%String vipphone = String.valueOf(request.getAttribute("vipphone")); %>
     <input type="hidden" value="<%=vipphone %>" name="vipphone" id="vipphone"/>
     
    <p>&nbsp;</p>
    <p>
      <label for="vipphone">电话: </label>
     <input type="text" value="<%=vipphone %>" name="lookvipphone" id="lookvipphone" disabled="disabled"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <%String customername = String.valueOf(request.getAttribute("customername"));
    System.out.println("customername"); %>
     <input type="hidden" value="<%=customername %>" name="customername" id="customername"/>
	<p>&nbsp;</p>
    <p>
      <label for="productnumber">卡号：</label>
      <input type="text" value="输入产品卡号" name="productnumber" id="productnumber"
      onFocus="if(value==defaultValue){value='';}" 
      onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
 	</p>
 	<p>&nbsp;</p>
      <table width="400" border="0">
        <tr>
          <td align="right">
          <button type="button" href=”#” onclick="javascript :history.back(-1);">返回上页</button></td>
          <td align="center"><button type="submit" class="">确认提交</button></td>
        </tr>
      </table>
</form>


  </body>
</html>
