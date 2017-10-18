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
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
   <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script src="<%=path %>/GOLF/Scripts/check.js"></script>
    <style type="text/css">
    a:link {
	color: #FFF;
}
a:visited {
	color: #FFC;
}
a:active {
	color: #CCC;
}
    </style>
    
</head>
<body>
    
    <div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>新增场地</div>
  
  <form name="addcourse" action="<%=path %>/servlet/ProductServlet" method="post" onsubmit="return validate_channel_info_addcourse(this);">
  <input name="operation" type="hidden" id="operation" value="addcourse"/>
 <%String productnumber = String.valueOf(request.getAttribute("productnumber")); %>
 
     <input type="hidden" value="<%=productnumber %>" name="productnumber" id="productnumber"/> 

    <p>&nbsp;</p>
    <p>
      <label for="productnumber">产品号: </label>
     <input type="text" value="<%=productnumber %>" name="lookproductnumber" id="lookproductnumber" disabled="disabled"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>

    <p>
      <label for="coursenumber">场地号: </label>
      <input type="text" value="输入场地号" name="coursenumber" id="coursenumber"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
 	</p>
    <p>&nbsp;</p>
    <p>
      <label for="coursecountry">场地名称: </label>
     <input type="text" value="场地名称" name="coursename" id="coursename"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    <p>
      <label for="coursecountry">国家: </label>
     <input type="text" value="场地所在国家" name="coursecountry" id="coursecountry"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="courseprovince">省份: </label> 
     <input type="text" value="场地所在省份" name="courseprovince" id="courseprovince"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="coursecity">城市: </label>
     <input type="text" value="场地所在城市" name="coursecity" id="coursecity"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="courseprice">场地收费: </label>
     <input type="text" value="场地收费标准" name="courseprice" id="courseprice"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    
    
     
      <!-- <p class="login-submitjt">
      <button type="submit" name="submit value=" class="login-button"></button>-->
    </p> 
   <table width="400" border="0">
        <tr>
          <td align="right">
          <button type="button" href=”#” onclick="javascript :history.back(-1);">返回上页</button></td>
          <td align="center"><button type="submit" class="" >绑定服务</button></td>
        </tr>
      </table>
     <p>&nbsp;</p>
     <p>&nbsp;</p>
    <td>&nbsp;</td>
    </p>
</form>
<script>
function confirmAct2(){
    if(confirm("确定信息填写无误")){
    	
    	return true;
    }else{
       return false;
    }
}
</script>
  
</body>
</html>