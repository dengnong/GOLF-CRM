<%@page import="entity.*"%>
 <%@ page   errorPage="/errorPage.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="productMgr" class="entity.ProductMgr" scope="application"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%String serchProduct = String.valueOf(request.getAttribute("serchProduct"));
System.out.println("serchProduct: "+serchProduct);
;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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
    <div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>产品信息<b class="tip"></b>查找产品</div>
    <br/>
    
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
          <th width="7%" align="center"><p >允许携带人数</p></th>
          <th width="7%" align="center"><p >编辑</p></th>
          <th width="7%" align="center"><p >删除</p></th>
          <th width="34%" align="center"><p >&nbsp;</p></th>
        </tr>
      </thead>
      
      <%
	java.util.ArrayList<Product> productList = new java.util.ArrayList<Product>();
	productList = productMgr.getProductList();
	
    for(Product product : productList){
    	System.out.println(serchProduct+" "+product.getPro_Number()+" "+product.getPro_Name());
    	if(product.getPro_Enabled()!=0 && (serchProduct.equals(product.getPro_Name())|| serchProduct.equals(String.valueOf(product.getPro_Number()))))
       {
      	
       %>
      <tr>
    <td align="center"><a href="../GOLF/Template/product-course.jsp?Pro_Number=<%=product.getPro_Number()%>&Pro_Name=<%=product.getPro_Name()%>"><%=product.getPro_Number()%></td>
    <td align="center"><a href="../GOLF/Template/product-course.jsp?Pro_Number=<%=product.getPro_Number()%>&Pro_Name=<%=product.getPro_Name()%>"><%=product.getPro_Name()%></td>
    <td align="center"><%=product.getPro_Validitydate()%></td>
    <td align="center"><%=product.getPro_Equity()%></td>
    <td align="center"><%=product.getPro_Weekdays_times()%></td>
    <td align="center"><%=product.getPro_Holiday_times()%></td>
    <td align="center"><%=product.getPro_Price()%></td>
    <td align="center"><%=product.getPro_Peoplelimit()%></td>
    
    <td align="center">编辑</td>
    <td align="center"><a href="<%=path %>/servlet/ProductServlet?operation=del&productnumber=<%=product.getPro_Number()%>" onclick='return window.confirm("this product will be deleted，\Are you sure?")'>delete</a></td>
    
    
  </tr>
  <%
  }
  	}
  %>
    </table>
    
   <button type="submit" href=”#” onclick="javascript :history.back(-1);">返回上页</button>
</body>
</html>