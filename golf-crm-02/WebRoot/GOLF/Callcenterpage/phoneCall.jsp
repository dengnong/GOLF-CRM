<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page   errorPage="/errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Dark Login Form</title>
    <link rel="stylesheet" href="<%=path %>/GOLF/Template/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/formui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/base.css"/>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=path %>/GOLF/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    
 


</head>
<body>
<div class="alert alert-info">当前位置<b class="tip"></b>呼叫中心<b class="tip"></b>接听来电</div>
  
  <form action="<%=path %>/servlet/CustomerServlet" name="inputnumber" onsubmit="return validate_channel_info(this);" method="post" class="login">
  <input name="operation" type="hidden" id="operation" value="phonecall"/>
    <p>&nbsp;</p>

    <p>
      <label for="number">电话:</label>
      <input type="text" value="输入顾客电话" name="phonenumber" id="phonenumber" 
      onFocus="if(value==defaultValue){value='';}" 
      onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
                                       
    <p>&nbsp;</p>
    <script type="text/javascript">  
                    function validate_channel_info(inputnumber)  
                    {  
                        if(inputnumber.phonenumber.value=="")  
                        {  
                            alert("请输入正确的号码");  
                            return false;  
                        }  
                        else if(!isNumber(inputnumber.phonenumber.value))  
                        {  
                            alert("请输入合法ID");  
                            return false;  
                        }  
                        return true;  
                    }   
                      
                    function isNumber(str)          // 判断是否为非负整数  
                    {  
                        var rx = /^[0-9]+$/;  
                        return rx.test(str);  
                    }  
                      
                </script>  
    
    
      
      

    <p class="login-submitjt">
      <button type="submit" class="login-button">Login</button>
    </p>

    
</form>

  
</body>
</html>