<%@page import="callcenter.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<jsp:useBean id="memberMgr" class="callcenter.MemberMgr" scope="application"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
int NO = Integer.parseInt(request.getParameter("NO"));
System.out.println("come in showmember ordnumber is "+NO);

 %>

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

    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body bgcolor='#586683'>
<div class="alert alert-info">当前位置<b class="tip"></b>订单信息<b class="tip"></b>成员信息</div>
<br/>


<table width="500" class="tb" id="top">
    <thead>
    <tr >
        <th width="250" align="center">成员姓名</th>
        <th width="250" align="center">成员电话</th>
        
        
    </tr>
    </thead>
   
    <%
        java.util.ArrayList<Member> memberList = new java.util.ArrayList<Member>();
        memberList = memberMgr.getMemberList();

        for(Member member : memberList){
			if(member.getOrd_Number() == NO){
    %>
		 <tr>
        <td align="center"><%=member.getOrd_Name()%></td>
        <td align="center"><%=member.getOrd_Phone()%></td>
      	</tr>
    <%}
        }
    %>
    
</table>




</body>
</html>