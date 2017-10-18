<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="pro_cou_serMgr" class="entity.Pro_couMgr" scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%String Pro_Number=request.getParameter("Pro_Number"); %>
<%String Pro_Name=request.getParameter("Pro_Name"); %><!-- 这是从产品chanpinxinxi.jsp传递过来的一个参数，这里表示的是产品号 -->
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>ProductList</title>
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
<div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>卡种：<%out.print(Pro_Number);%></div>
    <br/>
    <table width="107%" class="tb" id="top">
      <thead>
      
     
      	
      
        <tr >
          
          <th width="9%" align="center"><p >球场号</p></th>
          <th width="6%" align="center"><p >球场名</p></th>
          <th width="7%" align="center"><p >所在国家</p></th>
          <th width="7%" align="center"><p >所在省份</p></th>
          <th width="7%" align="center"><p >所在城市</p></th>
          <th width="7%" align="center"><p >价格</p></th>
          <th width="1%" align="center"><p >&nbsp;</p></th>
        </tr>
      </thead>
      
      <%
            	java.util.ArrayList<Pro_cou> pro_cou_serList = new java.util.ArrayList<Pro_cou>();
            	pro_cou_serList = pro_cou_serMgr.getPro_cou_serList();
            		
                for(Pro_cou pro_cou_ser : pro_cou_serList){
                   
                  if(pro_cou_ser.getPro_Number() == Integer.parseInt(Pro_Number)){
            %>
      <tr>
    <td align="center"><a href="course-service.jsp?Cou_Number=<%=pro_cou_ser.getCou_Number()%>&Cou_Name=<%=pro_cou_ser.getCou_Name()%>"><%=pro_cou_ser.getCou_Number()%></td>
    <td align="center"><a href="course-service.jsp?Cou_Number=<%=pro_cou_ser.getCou_Number()%>&Cou_Name=<%=pro_cou_ser.getCou_Name()%>"><%=pro_cou_ser.getCou_Name()%></td>
    <td align="center"><%=pro_cou_ser.getCou_Country()%></td>
    <td align="center"><%=pro_cou_ser.getCou_Province()%></td>
    <td align="center"><%=pro_cou_ser.getCou_City()%></td>
    <td align="center"><%=pro_cou_ser.getCou_Price()%></td>

    
    
  </tr>
  <%
  }
  	}
  %>
    </table>
   <button type="submit" href=”#” onclick="javascript :history.back(-1);">返回上页</button>         
</body>
</html>