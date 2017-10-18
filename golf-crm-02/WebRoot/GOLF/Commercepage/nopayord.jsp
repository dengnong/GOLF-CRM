<%@page import="callcenter.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="TborderMgr" class="callcenter.TborderMgr" scope="application"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../"/>
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
<div class="alert alert-info">当前位置<b class="tip"></b>业务中心<b class="tip"></b>订单详情</div>

<br/>
<form action="<%=path %>/servlet/TboServlet" name="serchTbo" method="post" >
    <input name="operation" type="hidden" id="operation" value="serch"/>
    <p>

        <select name="serchtbo"    >
            <option value="1" >场一 翠湖高尔夫球会</option>
            <option value="2" >场二 金多港高尔夫俱乐部</option>
            <option value="3" >场三 阳光高尔夫俱乐部</option>
            <option value="4" >场四 金银湖国际高尔夫俱乐部</option>
            <option value="5" >场五 东方巴黎高尔夫俱乐部</option>
            <option value="6" >场六 贵阳高尔夫球会</option>
            <option value="7" >场七 南京钟山国际高尔夫俱乐部</option>
        </select>

        <input type="submit" name="Submit" value="search">
    </p>
    </br>
</form>



<table width="100%" class="tb" id="top">
    <thead>

    <tr >
        <th width="4%" align="center">流水号</th>
        <th width="4%" align="center">会员电话</th>
        <th width="8%" align="center">产品代码</th>
        <th width="4%" align="center">场地号码</th>
        <th width="5%" align="center">配套服务编号</th>
        <th width="11%" align="center">订单生成日期</th>
        <th width="4%" align="center">会员到场信息</th>
        <th width="4%" align="center">权益状态</th>
        <th width="4%" align="center">结算状态</th>
        <th width="15%" align="center">订单价格</th>
        <th width="15%" align="center">应扣权益</th>
        <th width="15%" align="center">人数</th>


    </tr>
    </thead>

    <%
        java.util.ArrayList<TbOrder> tborderList = new java.util.ArrayList<TbOrder>();
        tborderList = TborderMgr.getTbOrderList();

        for(TbOrder tborder: tborderList){
        if(tborder.getOrd_State()==1&&tborder.getOrd_Pay()==0){
    %>
    <tr>


        <td align="center"><%=tborder.getOrd_Number()%></td>
        <td align="center"><%=tborder.getVip_Phone()%></td>
        <td align="center"><%=tborder.getPro_Number()%></td>
        <td align="center"><%=tborder.getCou_Number()%></td>
        <td align="center"><%=tborder.getSer_ServiceID()%></td>
        <td align="center"><%=tborder.getOrd_Date()%></td>
        <td align="center"><%=tborder.getOrd_ReDate()%></td>
        <td align="center">
            <%
                if(tborder.getOrd_State() ==1){
                    out.println("已扣除");
                }
                if(tborder.getOrd_State() ==0){
                    out.println("未扣除");
                }
            %>

            </td>
        <td align="center">
            <%
                if(tborder.getOrd_Pay() ==1){
                    out.println("已结算");
                }
                if(tborder.getOrd_Pay() ==0){
                    out.println("未结算");
                }
            %>

        </td>
        <td align="center"><%=tborder.getOrd_Price()%></td>
        <td align="center"><%=tborder.getOrd_Shouldequity()%></td>
        <td align="center"><%=tborder.getOrd_Member()%></td>



    </tr>
    <%
	}
        }
    %>
</table>




</body>
</html>