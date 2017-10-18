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
    <script src="<%=path %>/GOLF/Scripts/check.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/GOLF/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
  </head>
  
  <body>
  <div class="alert alert-info">当前位置<b class="tip"></b>呼叫中心<b class="tip"></b>新增顾客</div>
  
  <form action="<%=path %>/servlet/CustomerServlet" method="post" name="addcustomeraction"  onsubmit="return validate_channel_info_addcustomer(this)">
  <input name="operation" type="hidden" id="operation" value="addcustomer"/>
    <p>&nbsp;</p>
    
     <%String phonenumber = String.valueOf(request.getAttribute("phonenumber")); %>
    
	<input type="hidden" value="<%=phonenumber %>" name="customerphone" id="customerphone" />

    <p>
      <label for="customerphone">电话:</label>
      <input type="text" value="<%=phonenumber %> " name="callphone" id="callphone" disabled="disabled"
      onFocus="if(value==defaultValue){value='';}" 
      onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#999999" />
 	</p>
 	<p>&nbsp;</p>
    
    <p>
      <label for="customername">姓名:</label>
     <input type="text" value="" name="customername" id="customername"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#999999" />
    </p>
    <p>&nbsp; </p>
    
    <table width="300" border="0">
  <tr>
  <td align="center">&nbsp;</td>
    <td align="center">男
      <input type="radio" name="radio" id="man" value="男" />
      <label for="man"></label></td>
    <td>女
      <input type="radio" name="radio" id="women" value="女" />
      <label for="women"></label></td>
  </tr>
</table>

    <p>&nbsp;</p>
    <p>
     <label for="customerbithday">出生年月:</label>
     <script src="<%=path %>/GOLF/Scripts/laydate.js" type="text/javascript" language="javascript"></script>
     <input type="text" value="点击选择" name="customerbirthday" id="customerbirthday" 
     onclick="laydate()"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
       <p>
      <label for="customeremail">电子邮箱:</label>
     <input type="text" value="" name="customeremail" id="customeremail"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customeraddress">住址:</label>
     <input type="text" value="" name="customeraddress" id="customeraddress" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customerpostcode">邮编:</label>
     <input type="text" value="" name="customerpostcode" id="customerpostcode" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customernationallity">国籍:</label>
     <input type="text" value="" name="customernationallity" id="customernationallity" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
	<p>
      <label for="customerprouince">省份:</label>
     <input type="text" value="" name="customerprouince" id="customerprouince"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
	<p>
      <label for="customercity">城市:</label>
     <input type="text" value="" name="customercity" id="customercity" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>    
     <p>&nbsp;</p>   
       <p>
      <label for="customernativeplace">籍贯:</label>
     <input type="text" value="" name="customernativeplace" id="customernativeplace"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customerposition">职务:</label>
     <input type="text" value=""  name="customerposition" id="customerposition"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>  
    <p>&nbsp;</p>
    <p>
      <label for="customercardtype">证件类型:</label>
     <input type="text" value="" name="customercardtype" id="customercardtype"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
      <p>
      <label for="customerpostnumber">证件号码:</label>
     <input type="text" value="" name="customerpostnumber" id="customerpostnumber" 
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    <p>&nbsp;</p>
    <p>
      <label for="customerintrest">兴趣:</label>
     <input type="text" value="选填" name="customerinterest" id="customerinterest"
     onFocus="if(value==defaultValue){value='';}" 
     onBlur="if(!value){value=defaultValue;this.style.color='#FFF'}" style="color:#FFF" />
    </p>
    
   
      <table width="400" border="0">
        <tr>
          <td align="right">
          <button type="button" href=”#” onclick="javascript :history.back(-1);">返回上页</button></td>
          <td align="center"><button type="submit" class="" >确认提交</button></td>
        </tr>
      </table>

    
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
