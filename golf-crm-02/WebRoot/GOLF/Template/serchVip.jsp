<%@page import="entity.*"%>
 <%@ page   errorPage="/errorPage.jsp" %>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="vipMgr" class="entity.VipMgr" scope="application"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%String serchVip = String.valueOf(request.getAttribute("serchVip"));
    System.out.println("serchVip: "+serchVip);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
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
<div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>顾客信息<b class="tip"></b>查找顾客</div>
<br/>
<table width="100%" class="tb" id="top">
    <thead>
    <tr >
        <th width="4%" align="center">姓名</th>
        <th width="4%" align="center">电话</th>
        <th width="8%" align="center">产品代码</th>
        <th width="4%" align="center">激活时间</th>
        <th width="5%" align="center">到期时间</th>
        <th width="11%" align="center">剩余权益</th>
        <th width="4%" align="center">激活状态</th>


        <th width="15%" align="center">删除</th>
        <th width="1%" align="center"></th>
    </tr>
    </thead>

    <%
        java.util.ArrayList<Vip> vipList = new java.util.ArrayList<Vip>();
        vipList = vipMgr.getVipList();


        for(Vip vip : vipList){
            if(vip.getVip_Enabled()!=0 && (serchVip.equals(vip.getCus_Phone()) || serchVip.equals(vip.getCus_Name())))
            {
    %>

    <tr>
        <td align="center"><%=vip.getCus_Name()%></td>
        <td align="center"><%=vip.getCus_Phone()%></td>
        <td align="center"><%=vip.getPro_Number()%></td>
        <td align="center"><%=vip.getVip_Activationdate()%></td>
        <td align="center"><%=vip.getVip_Expirydate()%></td>
        <td align="center"><%=vip.getVip_Residualequity()%></td>
        <td align="center"><%=vip.getVip_Valid()%></td>
        <td align="center"><a href="<%=path %>/servlet/VipServlet?operation=del&vipPhone=<%=vip.getCus_Phone()%>" onclick='return window.confirm("this vip will be deleted，\Are you sure?")'>delete</a></td>
    </tr>
    <%
        }
        }
    %>
</table>

<button type="" href=”#” onclick="javascript :history.back(-1);">返回上页</button>
</body>
</html>