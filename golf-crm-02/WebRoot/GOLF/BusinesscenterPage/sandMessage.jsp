<%@page import="businesscenter.*"%>
<%@page import="callcenter.*"%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="TborderMgr" class="callcenter.TborderMgr" scope="application"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"><%@page import="businesscenter.*" import="callcenter.*"%>
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
    <div class="alert alert-info">当前位置<b class="tip"></b>商务中心<b class="tip"></b>发送短信</div>
    <form name="sandSms" action="<%=path %>/businesscenter/UntreatedorderList" method="post">
  	<input name="operation" type="hidden" id="operation" value="sandmes"/>
    <br/>
    <p>&nbsp;</p>
    <table width="100%" class="tb" id="top">
      <thead>
        <tr >
          <th width="10%" align="center">身份</th>
          <th width="20%" align="center">电话</th>
          <th width="6%" align="center">球场号</th>
          <th width="10%" align="center">服务编号</th>
          <th width="20%" align="center">预定时间</th>
          <th width="20%" align="center">消费时间</th>
          <th width="6%" align="center">发送状态</th>
        </tr>
      </thead>
      <tbody>
      <%
      int ord_number = Integer.parseInt(String.valueOf(request.getAttribute("ord_Number")));
      System.out.println(ord_number);
  	   //request.setAttribute("ord_Number", ord_number);
      TborderMgr tborderMgr = new TborderMgr();
      TbOrder tborder = tborderMgr.getTborder(ord_number);
      %>
       <input name="ord_Number" type="hidden" id="ord_Number" value=<%=ord_number%>  >
      <tr>
        <td align="center">主人</td>
      	<td align="center"><%=tborder.getVip_Phone()%></td>
      	<td align="center"><%=tborder.getCou_Number()%></td>
      	<td align="center"><%=tborder.getSer_ServiceID()%></td>
      	<td align="center"><%=tborder.getOrd_Date()%></td>
      	<td align="center"><%=tborder.getOrd_ReDate()%></td>
      	<td align="center"><%=MessageMgr.getVipstate(ord_number)%></td>
      </tr>
       <%
       if(tborder.getOrd_Member()>1)
		{
			java.util.ArrayList<Member> memberList = new java.util.ArrayList<Member>();
			memberList = MemberMgr.getMemberList();
		    for(Member member : memberList){
				if(member.getOrd_Number()==ord_number){
			
				/*MemberMgr memberMgr = new MemberMgr();
				Member member = memberMgr.getMember(ord_number);
				if(member.getOrd_Number() == ord_number)
				{*/
       %>
      <tr>
        <td align="center">同行球友</td>
        <td align="center"><%=member.getOrd_Phone() %></td>
      	<td align="center"><%=tborder.getCou_Number()%></td>
      	<td align="center"><%=tborder.getSer_ServiceID()%></td>
      	<td align="center"><%=tborder.getOrd_Date()%></td>
      	<td align="center"><%=tborder.getOrd_ReDate()%></td>
      	<td align="center"><%=member.getOrd_Message()%></td>
   	   	<!-- <td align="center"><a href="<%=path %>/businesscenter/UntreatedorderList?operation=deal&ord_Number=<%=tborder.getOrd_Number()%>">OK</a></td> -->   
     </tr>
  <%
  }
			}
				}
  %>
    </tbody>
    </table>
    <input type="submit" name="submit" value="发送短信" />
    <p></p>
  	<p></p>
  	<p></p>

    
    </form>
  </body>
</html>
