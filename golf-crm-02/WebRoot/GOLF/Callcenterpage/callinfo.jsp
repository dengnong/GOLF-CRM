<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="customerMgr" class="entity.CustomerMgr" scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
     <%String phonenumber = String.valueOf(request.getAttribute("phonenumber"));
 System.out.println(phonenumber); %>
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
<body>
    
    <div class="alert alert-info">当前位置<b class="tip"></b>呼叫中心<b class="tip"></b>来电信息</div>
  
    <form name="showinfo" action="../GOLF/Callcenterpage/menu.jsp?phonenumber=<%=phonenumber%>" method="post">
	  
    <input name="operation" type="hidden" id="operation" value="showinfo"/>
    <input type="hidden" value="<%=phonenumber%>" name="phonenumber" id="phonenumber"/>
    
    <p>&nbsp;</p>
    <p>
      <label for="phonenumber">来电识别: </label>
     <input type="text" value="<%=phonenumber%>" name="phone" id="phone" readOnly="true"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    <%
    java.util.ArrayList<Customer> customerList = new java.util.ArrayList<Customer>();
	customerList = customerMgr.getCustomerList();

    for(Customer customer : customerList){
    	if(customer.getCus_Phone().equals(phonenumber)){
    	
    %>
    <p>
      <label for="vipname">姓名: </label>
     <input type="text" value="<%=customer.getCus_Name()%>" name="vipname" id="vipname" readOnly="true"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    
    <p>
      <label for="vipsex">性别: </label>
     <input type="text" value="<%=customer.getCus_Sex() %>" name="vipsex" id="vipsex" readOnly="true"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    
    <p>
      <label for="vipstatus">身份: </label>
     <input type="text" value="<%
        if(customer.getCus_Status() ==1){
            out.println("会员");
        }
        if(customer.getCus_Status() ==0){
            out.println("普通顾客");
        }
     %>" name="vipstatus" id="vipstatus" readOnly="true"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    
    <% }}%>
    <p>&nbsp;</p>
    <%session.setAttribute("phonenumber",phonenumber); 
    %>

    <table width="400" border="0">
      <tr>
        <td width="394" align="center"><input type="submit" name="submit" value="预定业务"  onclick="return confirmAct()"  /></td>
      </tr>
      <tr>
        <td align="left"><a href="javascript:history.back(-1)">《《《---返回上一页</a></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp; </p>
    <p>&nbsp;</p>
     <p>&nbsp;</p>
</form>
<script>
function confirmAct()
{
if(confirm('请确认会员身份再进入业务操作'))
{ 
return true;
}else
return false;
}
</script>
<script>
function confirmAct3(){
    if(confirm("放弃操作？")){
    	
    	return true;
    }else{
       return false;
    }
}
</script>
  
</body>
</html>