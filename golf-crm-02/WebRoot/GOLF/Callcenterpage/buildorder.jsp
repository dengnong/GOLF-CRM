<%@page import="callcenter.*" %>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="showorderMgr" class="callcenter.ShoworderMgr" scope="application"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println("come in buildorderpage");
int orderid = Integer.parseInt(String.valueOf(request.getAttribute("orderid")));
System.out.println("get orderid: "+orderid);
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta charset="utf-8"></meta>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"></meta>
  <title>build order</title>
  <link rel="stylesheet" href="<%=path %>/GOLF/Template/css/style.css"/>
   <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    </head>
   <div class="alert alert-info">当前位置<b class="tip"></b>呼叫中心<b class="tip"></b>订单信息</div>
  <body>
 	<%
    java.util.ArrayList<Showorder> showorderList = new java.util.ArrayList<Showorder>();
	showorderList = showorderMgr.getShoworderList();

    for(Showorder showorder : showorderList){
    	if(showorder.getOrd_Number()==orderid)
    	{
    	
    %>
    <p>
      <label for="ordernumber">订单号: </label>
     <input type="text" value="<%=showorder.getOrd_Number()%>" name="ordernumber" id="ordernumber" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="cusname">会员姓名: </label>
     <input type="text" value="<%=showorder.getCus_Name()%>" name="cusname" id="cusname" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="cusphone">会员电话: </label>
     <input type="text" value="<%=showorder.getCus_Phone() %>" name="cusphone" id="cusphone" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="proname">持卡类型: </label>
     <input type="text" value="<%=showorder.getPro_Name() %>" name="proname" id="proname" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="couname">预定场地: </label>
     <input type="text" value="<%=showorder.getCou_Name() %>" name="couname" id="couname" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="serviceid">预定服务: </label>
     <input type="text" value="<%=showorder.getSer_ServiceID() %>" name="serviceid" id="serviceid" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="redate">到场日期: </label>
     <input type="text" value="<%=showorder.getOrd_ReDate() %>" name="redate" id="redate" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="member">到场人数: </label>
     <input type="text" value="<%=showorder.getOrd_Member() %>" name="member" id="member" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    <a target="_blank" href="../GOLF/Callcenterpage/showmember.jsp?NO=<%=showorder.getOrd_Number()%>">查看成员</a></p>
    <p>
      <label for="price">消费金额: </label>
     <input type="text" value="<%=showorder.getOrd_Price()%>" name="price" id="price" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="equity">消费权益: </label>
     <input type="text" value="<%=showorder.getOrd_Shoulequity() %>" name="equity" id="equity" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>
      <label for="date">受理时间: </label>
     <input type="text" value="<%=showorder.getOrd_Date() %>" name="date" id="date" disabled="true" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    
    

    
    <%break; }}%>
 <p>&nbsp;</p>
   <form name="returnphonecall" action="<%=path %>/GOLF/Callcenterpage/phoneCall.jsp " method="post"> 
   <input name="submit" type="submit" value="返回来电等待">
  </body>
</html>
