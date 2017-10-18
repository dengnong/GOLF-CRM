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

    
    <div class="alert alert-info">当前位置<b class="tip"></b>产品中心<b class="tip"></b>配套服务</div>
  
  <form name="addservice" action="<%=path %>/servlet/ProductServlet" method="post" onsubmit="return validate_channel_info_addserice(this);">
  <input name="operation" type="hidden" id="operation" value="addservice"/>
 <%String coursenumber = String.valueOf(request.getAttribute("coursenumber")); %>
 
     <input type="hidden" value="<%=coursenumber %>" name="coursenumber" id="coursenumber"/> 

    <p>&nbsp;</p>
    <p>
      <label for="coursenumber">球场号: </label>
     <input type="text" value="<%=coursenumber %>" name="lookcoursenumber" id="lookcoursenumber" disabled="disabled"
    onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>

    <p>
      <label for="serviceid">ID: </label>
      <input type="text" value="服务ID" name="serviceid" id="serviceid"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
 	</p>
    <p>&nbsp;</p>
    <p>
      <label for="servicegreen">果岭: </label>
     <input type="text" value="果岭规格" name="servicegreen" id="servicegreen"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    <p>
      <label for="servicecaddie">球童: </label>
     <input type="text" value="球童数量" name="servicecaddie" id="servicecaddie"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="servicegolfcar">球车: </label> 
     <input type="text" value="球车数量" name="servicegolfcar" id="servicegolfcar"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="servicecatering">餐饮: </label>
     <input type="text" value="餐饮类型" name="servicecatering" id="servicecatering"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    
       <p>
      <label for="servicewardrobe">衣柜: </label>
     <input type="text" value="衣柜数量" name="servicewardrobe" id="servicewardrobe"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
    
      <p>
      <label for="servicelounge">休息室: </label>
     <input type="text" value="休息室类型" name="servicelounge" id="servicelounge"
     onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFFFFF" />
    </p>
    <p>&nbsp;</p>
     
      <!-- <p class="login-submitjt">
      <button type="submit" name="submit value=" class="login-button"></button>-->


     <p>&nbsp;</p>


    
    <table width="400" border="0">
        <tr>
          <td align="right">
          <button type="button" href=”#” onclick="javascript :history.back(-1);">返回上页</button></td>
          <td align="center"><button type="submit" class="" >确认提交</button></td>
        </tr>
      </table>
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