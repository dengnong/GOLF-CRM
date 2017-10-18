<%@page import="java.text.SimpleDateFormat"%>
<%@page import="businesscenter.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="birthdayMgr" class="businesscenter.BirthdayMgr" scope="application"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<div class="alert alert-info">当前位置<b class="tip"></b>商务中心<b class="tip"></b>生日提醒</div>
<br/>


<table width="100%" class="tb" id="top">
    <thead>
    <tr >
        <th width="8%" align="center">姓名</th>
        <th width="8%" align="center">电话</th>
        <th width="8%" align="center">地址</th>
        <th width="8%" align="center">邮箱</th>
        <th width="8%" align="center">兴趣</th>
        <th width="8%" align="center">会员等级</th>
        <th width="1%" align="center"></th>
    </tr>
    </thead>
    <%
    	
    	SimpleDateFormat sd = new SimpleDateFormat("MM-dd");
        
        java.util.ArrayList<Birthday> birthdayList = new java.util.ArrayList<Birthday>();
        birthdayList = birthdayMgr.getBirthdayList();
		int count = 0;
        for(Birthday birthday: birthdayList){
			if(birthday.getCus_Birthday().equals(sd.format(new Date()))){
			
    %>
    <tr>


        <td align="center"><%=birthday.getCus_Name()%></td>
        <td align="center"><%=birthday.getCus_Phone()%></td>
        <td align="center"><%=birthday.getCus_Address()%></td>
        <td align="center"><%=birthday.getCus_Email()%></td>
        <td align="center"><%=birthday.getCus_Interest()%></td>
        <td align="center"><%=birthday.getGrade()%></td>
       	
</tr>
    <%
    }
      }  
    %>
</table>



</table>
</body>
</html>