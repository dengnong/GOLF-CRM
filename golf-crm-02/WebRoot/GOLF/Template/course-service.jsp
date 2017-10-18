<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="cou_serMgr" class="entity.Cou_serMgr"  scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%String Cou_Number=request.getParameter("Cou_Number"); %>
<%String Cou_Name=request.getParameter("Cou_Name"); %><!-- 这是从产品卡信息product-course.jsp传递过来的一个参数，这里表示的是产品名 -->
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
<div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>球场号：<%out.print(Cou_Number);%></div>
    <br/>
    <table width="107%" class="tb" id="top">
      <thead>
      
     
      	
      
        <tr >
          
          <th width="9%" align="center"><p >服务号</p></th>
          <th width="6%" align="center"><p >场地规格</p></th>
          <th width="7%" align="center"><p >球童数</p></th>
          <th width="7%" align="center"><p >球车数</p></th>
          <th width="7%" align="center"><p >餐饮服务</p></th>
          <th width="7%" align="center"><p >衣柜</p></th>
          <th width="7%" align="center"><p >休息室</p></th>
          <th width="1%" align="center"><p >&nbsp;</p></th>
        </tr>
      </thead>
      
      <%
	java.util.ArrayList<Cou_ser> cou_serList = new java.util.ArrayList<Cou_ser>();
	cou_serList = cou_serMgr.getCou_serList();
		
    for(Cou_ser cou_ser : cou_serList){
       
      if(cou_ser.getCou_Number() == Integer.parseInt(Cou_Number)){
       %>
      <tr>
    <td align="center"><%=cou_ser.getSer_ServiceID()%></td>
    <td align="center"><%=cou_ser.getSer_Green()%></td>
    <td align="center"><%=cou_ser.getSer_Caddie()%></td>
    <td align="center"><%=cou_ser.getSer_GolfCar()%></td>
    <td align="center"><%=cou_ser.getSer_Catering()%></td>
    <td align="center"><%=cou_ser.getSer_Wardrobe()%></td>
    <td align="center"><%=cou_ser.getSer_Lounge()%></td>

    
    
  </tr>
  <%
  }
  	}
  %>
    </table>  
   <button type="submit" href=”#” onclick="javascript :history.back(-1);">返回上页</button>         
    

</body>
</html>