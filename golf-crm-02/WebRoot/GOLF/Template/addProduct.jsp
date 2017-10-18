<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta charset="utf-8"></meta>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"></meta>
  <title>Add product</title>
    <link rel="stylesheet" href="<%=path %>/GOLF/Template/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script src="<%=path %>/GOLF/Scripts/check.js"></script>
</head>
<body>
<div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>新增产品</div>
  
  <form name="addproduct" action="<%=path %>/servlet/ProductServlet" method="post" onsubmit="return validate_channel_info(this);">
  <input name="operation" type="hidden" id="operation" value="addproduct"/>
    <p>&nbsp;</p>
    <p>
      <label for="productnumber">产品号: </label>
     <input type="text" value="输入产品号" name="productnumber" id="productnumber" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>

    <p>
      <label for="productname">产品名: </label>
      <input type="text" value="输入产品名" name="productname" id="productname"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
 	</p>
    <p>&nbsp;</p>
    <p>
      <label for="productvaliditydate">有效期: </label> 
     <input type="text" value="输入有效期(月)" name="productvaliditydate" id="productvaliditydate" 
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="productequity"> 产品权益: </label> 
     <input type="text" value="输入产品权益" name="productequity" id="productequity" 
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="productweekday">平日权益: </label>
     <input type="text" value="输入平日应扣权益" name="productweekday" id="productweekday" 
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="productholiday">假日权益: </label>
     <input type="text" value="输入假日应扣权益" name="productholiday" id="productholiday" 
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
      <p>
      <label for="productprice">产品价格:</label> 
     <input type="text" value="输入价格(元)" name="productprice" id="productprice" 
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
<table width="400" border="0">
        <tr>
          <td align="right">
          <button type="button" href=”#” onclick="javascript :history.back(-1);">返回上页</button></td>
          <td align="center"><button type="submit" class="" >绑定球场</button></td>
        </tr>
      </table>
    </p>
</form>
<script>

</script>



  
</body>
</html>