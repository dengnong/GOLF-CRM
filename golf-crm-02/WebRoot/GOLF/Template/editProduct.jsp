<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="productMgr" class="entity.ProductMgr" scope="application"/>
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
  
  <form name="addproduct" action="<%=path %>/servlet/ProductServlet" method="post" onsubmit="return validate_channel_info_editproduct(this);">
  <input name="operation" type="hidden" id="operation" value="editproduct"/>
    <p>&nbsp;</p>
    
    
  <%   
  	int productnum = Integer.parseInt(request.getParameter("productnumber"));
  	System.out.println("come in editpro get pronum: "+productnum);
  	
  	
  
    java.util.ArrayList<Product> productList = new java.util.ArrayList<Product>();
	productList = productMgr.getProductList();
    
    for(Product product : productList){
        if(product.getPro_Number()==productnum){
   %> 
   
   <input type="hidden" value="<%=product.getPro_Number() %>" name="pronumber" id="pronumber" />
    <p>
      <label for="productnumber">产品号: </label>
     <input type="text" value="<%=product.getPro_Number()%>" name="productnumber" id="productnumber" disabled="disabled"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
	
    <p>
      <label for="productname">产品名: </label>
      <input type="text" value="<%=product.getPro_Name()%>" name="productname" id="productname" disabled="disabled"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
 	</p>
    <p>&nbsp;</p>
    <p>
      <label for="productvaliditydate">有效期: </label> 
     <input type="text" value="<%=product.getPro_Validitydate()%>" name="productvaliditydate" id="productvaliditydate" disabled="disabled"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="productequity"> 产品权益: </label> 
     <input type="text" value="<%=product.getPro_Equity()%>" name="productequity" id="productequity" disabled="disabled"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="productweekday">平日权益: </label>
     <input type="text" value="<%=product.getPro_Weekdays_times()%>" name="productweekday" id="productweekday" disabled="disabled"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="productholiday">假日权益: </label>
     <input type="text" value="<%=product.getPro_Holiday_times()%>" name="productholiday" id="productholiday" disabled="disabled"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
      <p>
      <label for="productprice">产品价格:</label> 
     <input type="text" value="<%=product.getPro_Price()%>" name="productprice" id="productprice" 
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />可更改
    </p>
    <p>&nbsp;</p>
    
    <%
  }
  	}
  %>
    
<table width="400" border="0">
        <tr>
          <td align="right">
          <td align="center"><button type="submit" class="" >确认提交</button></td>
        </tr>
      </table>
    </p>
</form>
<script>

</script>



  
</body>
</html>