<%@page import="businesscenter.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="TborderMgr" class="callcenter.TborderMgr" scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
 	<base href="<%=basePath%>"><%@page import="businesscenter.*" import="callcenter.TbOrder" import="callcenter.TborderMgr"%></base>
  <meta charset="utf-8"></meta>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"></meta>
  <title>SandFax</title>
  <link rel="stylesheet" href="<%=path %>/GOLF/Template/css/style.css"/>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
   <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    </head>
<body>
    
    <div class="alert alert-info">当前位置<b class="tip"></b>商务中心<b class="tip"></b>发送传真</div>
  
  <form name="sandfax" action="<%=path %>/businesscenter/UntreatedorderList" method="post">
  <input name="operation" type="hidden" id="operation" value="sandfax"/>
  <% 
  int ord_number = Integer.parseInt(String.valueOf(request.getAttribute("ord_Number")));
	 System.out.println("ord_Number:"+"    "+ord_number+ "come in dealorder.jsp");
		 %>
	<input name="ord_Number" type="hidden" id="ord_Number" value=<%=ord_number%> />
 
 <% 
 	java.util.ArrayList<TbOrder> tborderlist = new java.util.ArrayList<TbOrder>();
 	tborderlist = TborderMgr.getTbOrderList();
 	for(TbOrder tborder : tborderlist)
 	{
 		if(tborder.getOrd_Number()==ord_number){
 %>
	<table width="95%%" border="0" >
  <tbody>
    <tr>
      <td width="60%">&nbsp;</td>
      <td width="2%">&nbsp;</td>
      <td width="2%">&nbsp;</td>
    </tr>
    <tr>
      <td height="82"><table width="30%%" border="0" class="tb" id="top">
  	<tbody>
    <tr>
      <td width="30%" align="right">订单号：</td>
      <td width="70%" align="left"><%=tborder.getOrd_Number()%></td>
    </tr>
    <tr>
      <td align="right">电话：</td>
      <td><%=tborder.getVip_Phone()%></td>
    </tr>
    <tr>
      <td align="right" >会员卡号：</td>
      <td><%=tborder.getPro_Number() %></td>
    </tr>
    <tr>
      <td align="right">球场编号：</td>
      <td><%=tborder.getCou_Number() %></td>
    </tr>
    <tr>
      <td align="right">配套服务编号：</td>
      <td><%=tborder.getSer_ServiceID() %></td>
    </tr>
    <tr>
      <td align="right">订单预定时间：</td>
      <td><%=tborder.getOrd_Date() %></td>
    </tr>
    <tr>
      <td align="right">订单消费时间：</td>
      <td><%=tborder.getOrd_ReDate() %></td>
    </tr>
    <tr>
      <td align="right">消费价格：</td>
      <td><%=tborder.getOrd_Price() %></td>
    </tr>
    <tr>
      <td align="right" >权益消耗：</td>
      <td><%=tborder.getSer_ServiceID() %></td>
    </tr>
    <tr>
      <td align="right">球友数量：</td>
      <td><%=tborder.getOrd_Member() %></td>
    </tr>
    <tr>
      <td align="right">订单状态：</td>
      <td><%=tborder.getOrd_State()%></td>
    </tr>
  </tbody>
</table></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<%} 
 		}%>

      <!-- <p class="login-submitjt">
      <button type="submit" name="submit value=" class="login-button"></button>-->
    <input type="submit" name="submit" value="发送传真" />
     <p>&nbsp;</p>
     <p>&nbsp;</p>
    <td>&nbsp;</td>
    </p>
</form>

  
</body>
</html>