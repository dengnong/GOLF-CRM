<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="productMgr" class="entity.ProductMgr" scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>产品信息</div>
    <br/>
    
 <form action="<%=path %>/servlet/ProductServlet" name="serchProduct" method="post">
 <input name="operation" type="hidden" id="operation" value="serch"/>
    <p>
      <label for="productnumber"> </label>
     <input type="text" value="查询产品号或产品名" name="serchproductinfo" id="serchproductinfo" 
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" />
	   <input type="submit" name="Submit" value="search">
	
	</p>
</form>

	<p>&nbsp;</p>
    <table width="107%" class="tb" id="top">
      <thead>
        <tr >
          <th width="9%">产品号</th>
          <th width="%10" align="center">产品名</th>
          <th width="9%" align="center"><p >产品有效期（月）</p></th>
          <th width="6%" align="center"><p >产品权益</p></th>
          <th width="7%" align="center"><p >平日应扣权益</p></th>
          <th width="7%" align="center"><p >假日应扣权益</p></th>
          <th width="7%" align="center"><p >产品价格(元)</p></th>
          <th width="7%" align="center"><p >编辑</p></th>
          <th width="7%" align="center"><p >删除</p></th>
          <th width="34%" align="center"><p >&nbsp;</p></th>
        </tr>
      </thead>
      
      <%
	java.util.ArrayList<Product> productList = new java.util.ArrayList<Product>();
	productList = productMgr.getProductList();
		
    for(Product product : productList){
        if(product.getPro_Enabled()!=0){
       %>
      <tr>
    <td align="center"><a href="<%=path %>/GOLF/Template/product-course.jsp?Pro_Number=<%=product.getPro_Number()%>&Pro_Name=<%=product.getPro_Name()%>"><%=product.getPro_Number()%></td>
    <td align="center"><a href="<%=path %>/GOLF/Template/product-course.jsp?Pro_Number=<%=product.getPro_Number()%>&Pro_Name=<%=product.getPro_Name()%>"><%=product.getPro_Name()%></td>
    <td align="center"><%=product.getPro_Validitydate()%></td>
    <td align="center"><%=product.getPro_Equity()%></td>
    <td align="center"><%=product.getPro_Weekdays_times()%></td>
    <td align="center"><%=product.getPro_Holiday_times()%></td>
    <td align="center"><%=product.getPro_Price()%></td>
    <td align="center"><a href="<%=path %>/GOLF/Template/editProduct.jsp?productnumber=<%=product.getPro_Number()%>" onclick='return window.confirm("eidit this customerinfo，\Are you sure?")'>edit</a></td>
    <td align="center"><a href="<%=path %>/servlet/ProductServlet?operation=del&productnumber=<%=product.getPro_Number()%>" onclick='return window.confirm("this product will be deleted，\Are you sure?")'>delete</a></td>
    
    
  </tr>
  <%
  }
  	}
  %>
    </table>
    
           
        </tbody>
    </table>
</body>
</html>