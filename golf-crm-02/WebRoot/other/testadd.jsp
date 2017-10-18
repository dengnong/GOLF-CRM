<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Golf-CRM系统登录</title>
    

    <link rel="shortcut icon" href="http://p3.so.qhmsg.com/t0107c5d943feda9e7d.png">
	<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<meta content="width=1080" name="viewport"/>

	<link href="style/cycode.css" rel="stylesheet"/>
	<style type="text/css">
	body {
	margin-left: 80px;
	margin-right: 80px;
}
    </style>
	<link href="style/base.css" rel="stylesheet" type="text/css" />
	<link href="style/login.css" rel="stylesheet" type="text/css" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
   <div class="alert alert-info">当前位置<b class="tip"></b>呼叫中心<b class="tip"></b>新增顾客</div>
  
  <form name="addproduct" action="/servlet/ProductServlet" method="post">
  <input name="operation" type="hidden" id="operation" value="addproduct"/>
    <p>
      <label for="productnumber">产品号:</label>
     <input type="text" value="输入产品号" name="productnumber" id="productnumber" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
    </p>

    <p>
      <label for="productname">产品名:</label>
      <input type="text" value="输入产品名" name="productname" id="productname"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
 	</p>
    <p>
      <label for="product-validitydate">有效期:</label>
     <input type="text" value="输入有效期(月)" name="product-validitydate" id="product-validitydate"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
    </p>
    
       <p>
      <label for="productequity"> 产品权益:</label> 
     <input type="text" value="输入产品权益" name="productequity" id="productequity"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
    </p>
    
       <p>
      <label for="productweekday">平日权益:</label>
     <input type="text" value="输入平日应扣权益" name="productweekday" id="productweekday"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
    </p>
    
       <p>
      <label for="productholiday">假日权益:</label>
     <input type="text" value="输入假日应扣权益" name="productholiday" is="productholiday"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
    </p>
    
      <p>
      <label for="productprice">产品价格:</label>
     <input type="text" value="输入价格(元)" name="productprice" id="productprice"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
    </p>
    
     <p>
      <label for="productpeoplelimit">允许携带人数:</label>
     <input type="text" value="输入人数" name="productpeoplelimit" id="productpeoplelimit"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
    </p>
      
    
    <td><label>
           <input type="submit" name="submit" value="submit"  >
         </label></td>
    
      
      
<!-- 
onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" 
    <p class="login-submitjt">
      <button type="submit" name="submit value=" class="login-button"></button>
    </p>

     -->
</form>
  </body>
</html>
