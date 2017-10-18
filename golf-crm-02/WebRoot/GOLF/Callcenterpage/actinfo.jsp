<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="vipMgr" class="entity.VipMgr" scope="application"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String phone = request.getParameter("phonenumber");
System.out.println("come in actinfo phone is "+phone);

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
    </style>
</head>
<body bgcolor='#586683'>
<div class="alert alert-info">当前位置<b class="tip"></b>会员信息<b class="tip"></b>持卡状态</div>
<br/>
<form action="<%=path %>/servlet/VipServlet" name="actpro" method="post" >
    <input name="operation" type="hidden" id="operation" value="actprocard"/>
  
</form>

<table width="100%" class="tb" id="top">
    <thead>
    <tr >
        <th width="8%" align="center">产品代码</th>
        <th width="8%" align="center">激活时间</th>
        <th width="8%" align="center">剩余权益</th>
        <th width="8%" align="center">激活状态</th>

        <th width="8%" align="center">激活</th>
        <th width="1%" align="center"></th>
    </tr>
    </thead>
    <%
        java.util.ArrayList<Vip> vipList = new java.util.ArrayList<Vip>();
        vipList = vipMgr.getVipList();

        for(Vip vip: vipList){
			if(vip.getCus_Phone().equals(phone)){
    %>
    <tr>


        <td align="center"><%=vip.getPro_Number()%></td>
        <td align="center"><%=vip.getVip_Activationdate()%></td>
        <td align="center"><%=vip.getVip_Residualequity()%></td>
        <td align="center"><%=vip.getVip_Valid()%></td>
        <%if(vip.getVip_Activationdate()==null)
        {
         %>
        <td align="center"><a href="<%=path %>/servlet/VipServlet?operation=actproduct&phone=<%=vip.getCus_Phone()%>&card=<%=vip.getPro_Number() %>" onclick='return window.confirm("this vip will be active this card，\Are you sure?")'>激活</a></td>
</tr>
    <%
    }
    }
        }
    %>
</table>



</table>
</body>
</html>