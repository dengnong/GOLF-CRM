<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<script>
(function(w){if(!("WebSocket"in w&&2===w.WebSocket.CLOSING))
{var d=document.createElement("div");
d.className="browsehappy";
d.innerHTML='<div style="width:100%;height:100px;font-size:20px;line-height:100px;text-align:center;background-color:#E90D24;color:#fff;margin-bottom:40px;">\u4f60\u7684\u6d4f\u89c8\u5668\u5b9e\u5728<strong>\u592a\u592a\u65e7\u4e86<strong>\uff0c\u592a\u592a\u65e7\u4e86 <a target="_blank" href="http://browsehappy.osfipin.com/" style="background-color:#31b0d5;border-color: #269abc;text-decoration: none;padding: 6px 12px;background-image: none;border: 1px solid transparent;border-radius: 4px;color:#FFEB3B;">\u7acb\u5373\u5347\u7ea7</a></div>';
var f=function(){var s=document.getElementsByTagName("body")[0];
if("undefined"==typeof(s)){setTimeout(f,10)}
else{s.insertBefore(d,s.firstChild)}};f()}}(window));
</script>
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
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
  </head>
  
  <body>
    <div>
	  <table width="100%" border="0">
	   <noscript><meta   http-equiv="refresh"   content="0;   URL=http://jingyan.baidu.com/article/6d704a13ef102c28db51cac8.html"/></noscript>    
      </table>
	  <div>
    <br/>
    <font color=#32A5E7 size="+3"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Golf-CRM</font>
    </div>
		<form id="mainForm" name="loginform" method="post" action="servlet/LoginServlet"
		onsubmit="return validate_channel_info(this);" enctype="application/x-www-form-urlencoded">
			<div class="number">
				<a class="linkABlue" id="toAccountLogin" href="javascript:void(0);">管理员登陆</a>
				
				</div>
			<div class='normalInput cycode-box fieldInput' id="cycode-box">
                <div class="cycode-selectbox">
                   
                    <input type="text" name="username" id="username" 
                     maxlength="50" placeholder="Golf-CRM 账号" autocomplete='off' />
                    
                </div>
                <div id="cycode-container" class="cycode-container"></div>
            </div>
			<div class='normalInput fieldInput'>
				<input type="password" value="" name="password" id="password" 
				 maxlength='16' placeholder='密码' autocomplete='off' />
			</div>
			
			
            <input type="submit" name="submit" value="登 录" 
    
            style="background:url(style/login.jpg);                
            border-style:center;                
            width:300px;                
            height:40px;                
            background-repeat:no-repeat;"               
            />
            
			
	  </form>
	</div>
    
     <div>
    
    <div id='flymeFooter' class='footerWrap'>
    
    
<div align="center">
				<a href="javascript:void(0);">关于Golf-CRM</a>
				
				<a href="javascript:void(0);">联系我们</a>
  
 
				<span class='service-label'>客服热线</span>
				<span class='service-num'>187****4774</span>
                <br/>
                <font color=#cccccc size="-11">©2016 Golf-CRM management system 2016  </font>
                </div>
               
                
                </div>
</div>

 <script type="text/javascript"> 
                    function validate_channel_info(loginform)  
                    {  
                        if(loginform.username.value==""||loginform.password.value=="")  
                        {  
                            alert("账号或密码不能为空");  
                            return false;  
                        }  
                        else if(!isNumber(loginform.username.value))  
                        {  
                            alert("用户名和密码只能是字母或数字");  
                            return false;  
                        }
                        else if(!isNumber(loginform.password.value))  
                        {  
                            alert("用户名和密码只能是字母或数字");  
                            return false;  
                        }    
                        return true;  
                    }   
                      
                    function isNumber(str)          // 判断是否为非负整数  
                    {  
                        var rx = /^[0-9a-zA-Z]*$/g;;  
                        return rx.test(str);  
                    }  
                      
 </script>   
<script language="javascript">
var sUrl=location.search.toLowerCase();
var sQuery=sUrl.substring(sUrl.indexOf("=")+1);
re=/select|update|delete|truncate|join|union|exec|insert|drop|count|’|"|;|>|<|%/i;
if(re.test(sQuery))
{
    alert("请勿输入非法字符");
    location.href=sUrl.replace(sQuery,"");
} 

</script>

  </body>
</html>
