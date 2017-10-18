<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="customerMgr" class="entity.CustomerMgr" scope="application"/>
 <%@ page   errorPage="/errorPage.jsp" %>
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
    <script src="<%=path %>/GOLF/Scripts/check.js"></script>
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
    <div class="alert alert-info">当前位置<b class="tip"></b>顾客信息<b class="tip"></b>编辑信息</div>
    <br/>
    
     <form action="<%=path %>/servlet/CustomerServlet" method="post" name="editcustomer" onsubmit="return confirmAct(this)" >
  <input name="operation" type="hidden" id="operation" value="editcustomer"/>
    <p>&nbsp;</p>
    
     <%String phonenumber = String.valueOf(request.getParameter("phonenumber")); %>
    
	<input type="hidden" value="<%=phonenumber %>" name="customerphone" id="customerphone" />

    <p>
      <label for="customerphone">电话:</label>
      <input type="text" value="<%=phonenumber %> " name="callphone" id="callphone" disabled="disabled"
      onFocus="if(value==defaultValue){value='';}" 
      onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
 	</p>
 	<p>&nbsp;</p>
    
    <%
	java.util.ArrayList<Customer> customerList = new java.util.ArrayList<Customer>();
	customerList = customerMgr.getCustomerList();

    for(Customer customer : customerList){
    	if(phonenumber.equals(customer.getCus_Phone())){
    %>
    <p>
      <label for="customername">姓名:</label>
     <input type="text" value="<%=customer.getCus_Name() %>" name="customername" id="customername"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp; </p>
    <p>
     <label for="customerbithday">出生年月:</label>
     <script src="<%=path %>/GOLF/Scripts/laydate.js" type="text/javascript" language="javascript"></script>
     <input type="text" value="<%=customer.getCus_Birthday() %>" name="customerbirthday" id="customerbirthday" 
     onclick="laydate()"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
       <p>
      <label for="customeremail">电子邮箱:</label>
     <input type="text" value="<%=customer.getCus_Email() %>" name="customeremail" id="customeremail"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customeraddress">住址:</label>
     <input type="text" value="<%=customer.getCus_Address() %>" name="customeraddress" id="customeraddress" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customerpostcode">邮编:</label>
     <input type="text" value="<%=customer.getCus_Postcode() %>" name="customerpostcode" id="customerpostcode" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customernationallity">国籍:</label>
     <input type="text" value="<%=customer.getCus_Nationallity() %>" name="customernationallity" id="customernationallity" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
	<p>
      <label for="customerprouince">省份:</label>
     <input type="text" value="<%=customer.getCus_Prouince() %>" name="customerprouince" id="customerprouince"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
	<p>
      <label for="customercity">城市:</label>
     <input type="text" value="<%=customer.getCus_City() %>" name="customercity" id="customercity" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>    
     <p>&nbsp;</p>   
       <p>
      <label for="customernativeplace">籍贯:</label>
     <input type="text" value="<%=customer.getCus_Nativeplace() %>" name="customernativeplace" id="customernativeplace"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customerposition">职务:</label>
     <input type="text" value="<%=customer.getCus_Position() %>"  name="customerposition" id="customerposition"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>  
    <p>&nbsp;</p>
    <p>
      <label for="customercardtype">证件类型:</label>
     <input type="text" value="<%=customer.getCus_Cardtype() %>" name="customercardtype" id="customercardtype"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customerpostnumber">证件号码:</label>
     <input type="text" value="<%=customer.getCus_Postnumber() %>" name="customerpostnumber" id="customerpostnumber" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    <p>
      <label for="customerintrest">兴趣:</label>
     <input type="text" value="<%=customer.getCus_interest() %>" name="customerinterest" id="customerinterest"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    
      <table width="400" border="0">
        <tr>
          <td align="right"><%} }%>
          <button type="" href=”#” onclick="javascript :history.back(-1);">返回上页</button></td>
          <td align="center"><button type="submit" class="" >确认提交</button></td>
        </tr>
      </table>
      <p></p>

    
</form>
<script>
function confirmAct(){
    if(confirm("提交前请再次确认信息无误哦！")){
    	
    	return true;
    }else{
       return false;
    }
}
</script>
</body>
</html>