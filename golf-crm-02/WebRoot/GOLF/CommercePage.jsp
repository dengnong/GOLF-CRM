<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@ page   errorPage="path/errorPage.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>Golf-CRM管理系统</title>
    <link rel="stylesheet" type="text/css" href="../GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="../GOLF/Styles/base.css" />
    <link rel="stylesheet" type="text/css" href="../GOLF/Styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="../GOLF/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="../GOLF/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="../GOLF/Scripts/index.js"></script>
</head>
<body>
    <div class="warp">
        <!--头部开始-->
        <div class="top_yw">
            
            <div class="top-nav"><a href="#"></a></div>
        </div>
        <!--头部结束-->
        <!--左边菜单开始-->
        <div class="left_c left">
            <h1>业务中心</h1>
          <div class="acc">
                <div>
                    <a class="one" target="Conframe" href="../GOLF/Commercepage/Allorder.jsp">订单详情</a>
                    </div>
                     <div>
                    <a class="one" target="Conframe" href="../GOLF/Commercepage/nopayord.jsp">未结算订单</a>
                    
                </div>
                    
                <div id="datepicker"></div>
            </div>

        </div>
        <!--左边菜单结束-->
        <!--右边框架开始-->
        <div class="right_c">
            <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

        </div>
        <div class="Conframe" style="background:#586683">
            <iframe name="Conframe" id="Conframe"></iframe>
        </div>
        <!--右边框架结束-->

        <!--底部开始-->
        <div class="bottom_c">Copyright &copy;2016 湖南大学  软件联合（1401）一组</div>
        <!--底部结束-->
    </div>
</body>
</html>
