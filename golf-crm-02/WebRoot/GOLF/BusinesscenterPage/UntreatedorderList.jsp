<%@page import="businesscenter.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="TborderMgr" class="callcenter.TborderMgr" scope="application"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"><%@page import="businesscenter.*" import="callcenter.TbOrder" import="callcenter.TborderMgr "%>
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
    </style>
</head>
<body bgcolor='#586683'>
    <div class="alert alert-info">当前位置<b class="tip"></b>商务中心<b class="tip"></b>订单信息</div>
    <br/>
  
    <table width="100%" class="tb" id="top">
      <thead>
        <tr >
          <th width="6%" align="center">订单号</th>
          <th width="15%" align="center">电话</th>
          <th width="8%" align="center">会员卡号</th>
          <th width="6%" align="center">球场号</th>
          <th width="6%" align="center">球场服务号</th>
          <th width="15%" align="center">订单生成时间</th>
          <th width="15%" align="center">订单消费时间</th>
          <th width="6%" align="center">价格</th>
          <th width="6%" align="center">消费权益</th>
          <th width="6%" align="center">预定人数</th>
          <th width="6%" align="center">订单状态</th>
          <th width="6%" align="center">结算权益</th>
        </tr>
      </thead>
       <%
	java.util.ArrayList<TbOrder> tborderList = new java.util.ArrayList<TbOrder>();
	tborderList = TborderMgr.getTbOrderList();

    for(TbOrder tborder : tborderList){
		if(tborder.getOrd_State()==0){
       %>
      <tr>
    <td align="center"><%=tborder.getOrd_Number()%></td>
    <td align="center"><%=tborder.getVip_Phone()%></td>
    <td align="center"><%=tborder.getPro_Number()%></td>
    <td align="center"><%=tborder.getCou_Number()%></td>
    <td align="center"><%=tborder.getSer_ServiceID()%></td>
    <td align="center"><%=tborder.getOrd_Date()%></td>
    <td align="center"><%=tborder.getOrd_ReDate()%></td>
    <td align="center"><%=tborder.getOrd_Price()%></td>
    <td align="center"><%=tborder.getOrd_Shouldequity()%></td>
    <td align="center"><%=tborder.getOrd_Member()%></td>
    <td align="center"><%=tborder.getOrd_State()%></td>
   <td align="center"><a href="<%=path %>/businesscenter/UntreatedorderList?operation=deal&ord_Number=<%=tborder.getOrd_Number()%>">OK</a></td>   
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
