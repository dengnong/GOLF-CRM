function validate_channel_info(inputnumber)  //新增产品校验
{  
    if(addproduct.productnumber.value=="")  
    {  
        alert("产品号不可为空");  
        return false;  
    }  
    else if(!isNumber(addproduct.productnumber.value))  
    {  
        alert("请输入产品号数字代码");  
        return false;  
    }
    else if(!isNumber(addproduct.productvaliditydate.value))  
    {  
        alert("请输入正确有效期(单位/月)");  
        return false;  
    }
    else if(!isNumber(addproduct.productequity.value))  
    {  
        alert("请输入有效权益次数");  
        return false;  
    }
    else if(!isNumber(addproduct.productweekday.value))  
    {  
        alert("请输入平日消费扣次");  
        return false;  
    }
    else if(!isNumber(addproduct.productholiday.value))  
    {  
        alert("请输入假日消费扣次");  
        return false;  
    }
    else if(!isprice(addproduct.productprice.value))  
    {  
        alert("请输入正确价格");  
        return false;  
    }
    
    return confirmAct2();  
}   

function validate_channel_info_addcourse(input){   //新增球场校验
	if(!isNumber(addcourse.coursenumber.value))  
    {  
        alert("请输入场地数字代码");  
        return false;  
    }
	else if(!isprice(addcourse.courseprice.value))  
    {  
        alert("请输入正确收费价格");  
        return false;  
    }
	
	return confirmAct2(); 
}

function validate_channel_info_addserice(input){   //新增服务校验
	if(!isNumber(addservice.serviceid.value))  
    {  
        alert("请输入服务类型数字代码");  
        return false;  
    }
	else if(!isNumber(addservice.servicecaddie.value))  
    {  
        alert("请输入球童数量");  
        return false;  
    }
	else if(!isNumber(addservice.servicegolfcar.value))  
    {  
        alert("请输入球车数量");  
        return false;  
    }
	else if(!isNumber(addservice.servicewardrobe.value))  
    {  
        alert("请输入衣柜数量");  
        return false;  
    }
	
	return confirmAct2(); 
}

function validate_channel_info_addcustomer(input){   //新增顾客
	if(addcustomeraction.customername.value=="")  
    {  
        alert("顾客姓名不可为空");  
        return false;  
    } 
	else if(addcustomeraction.customerphone.value=="")  
    {  
        alert("顾客电话号码不可为空");  
        return false;  
    }
	else if(addcustomeraction.radio.value=="")  
    {  
        alert("请选择顾客性别");  
        return false;  
    }
	else if(addcustomeraction.customeremail.value=="")  
    {  
        alert("请填写顾客邮箱");  
        return false;  
    }
	else if(!isEmail(addcustomeraction.customeremail.value))  
    {  
        alert("请检查顾客邮箱");  
        return false;  
    }
	else if(addcustomeraction.customeraddress.value=="")  
    {  
        alert("请填写顾客地址");  
        return false;  
    }
	else if(addcustomeraction.customerpostcode.value=="")  
    {  
        alert("请填写邮编");  
        return false;  
    }
	else if(!isNumber(addcustomeraction.customerpostcode.value))  
    {  
        alert("请检查邮编");  
        return false;  
    }
	else if(addcustomeraction.customernationallity.value=="")  
    {  
        alert("请填写顾客国籍");  
        return false;  
    }
	else if(addcustomeraction.customerprouince.value=="")  
    {  
        alert("请填写顾客所在省份");  
        return false;  
    }
	else if(addcustomeraction.customercity.value=="")  
    {  
        alert("请填写顾客所在城市");  
        return false;  
    }
	else if(addcustomeraction.customernativeplace.value=="")  
    {  
        alert("请填写顾客籍贯");  
        return false;  
    }
	else if(addcustomeraction.customerposition.value=="")  
    {  
        alert("请填写顾客职务");  
        return false;  
    }
	else if(addcustomeraction.customercardtype.value=="")  
    {  
        alert("请填写证件类型");  
        return false;  
    }
	else if(addcustomeraction.customerpostnumber.value=="")  
    {  
        alert("请填写证件号码");  
        return false;  
    }
	
	
	return confirmAct2(); 
}

function validate_channel_info_addvip(input){   //新增服务校验
	if(addvip.productnumber.value=="")  
    {  
        alert("请输入产品卡号");  
        return false;  
    }
	else if(!isNumber(addvip.productnumber.value))  
    {  
        alert("请检查卡号");  
        return false;  
    }
	
	
	return confirmAct2(); 
}


function isEmail(str){
	var rx = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/; 
    return rx.test(str); 
	
}	  
function isNumber(str)          // 判断是否为非负整数  
{  
    var rx = /^[0-9]+$/;  
    return rx.test(str);  
}  

function isprice(str) 			//判断价格
{
	var rx = /(^[-+]?[1-9]\d*(\.\d{1,2})?$)|(^[-+]?[0]{1}(\.\d{1,2})?$)/;
	return rx.test(str);
}

function confirmAct2(){         // 确认提交弹窗
    if(confirm("再次确认操作")){
    	
    	return true;
    }else{
       return false;
    }
}


function validate_channel_info_editproduct(input){   //新增服务校验
	if(addproduct.productprice.value=="")  
    {  
        alert("请输入价格");  
        return false;  
    }
	else if(!isprice(addproduct.productprice.value))  
    {  
        alert("请检查输入格式");  
        return false;  
    }
	
	
	return confirmAct2(); 
}


function validate_channel_info_editcustomer(input){   //新增顾客
	if(editcustomer.customername.value=="")  
    {  
        alert("顾客姓名不可为空");  
        return false;  
    } 
	
	else if(editcustomer.radio.value=="")  
    {  
        alert("请选择顾客性别");  
        return false;  
    }
	else if(editcustomer.customeremail.value=="")  
    {  
        alert("请填写顾客邮箱");  
        return false;  
    }
	else if(!isEmail(editcustomer.customeremail.value))  
    {  
        alert("请检查顾客邮箱");  
        return false;  
    }
	else if(editcustomer.customeraddress.value=="")  
    {  
        alert("请填写顾客地址");  
        return false;  
    }
	else if(editcustomer.customerpostcode.value=="")  
    {  
        alert("请填写邮编");  
        return false;  
    }
	else if(!isNumber(editcustomer.customerpostcode.value))  
    {  
        alert("请检查邮编");  
        return false;  
    }
	else if(addcustomeraction.customernationallity.value=="")  
    {  
        alert("请填写顾客国籍");  
        return false;  
    }
	else if(addcustomeraction.customerprouince.value=="")  
    {  
        alert("请填写顾客所在省份");  
        return false;  
    }
	else if(addcustomeraction.customercity.value=="")  
    {  
        alert("请填写顾客所在城市");  
        return false;  
    }
	else if(addcustomeraction.customernativeplace.value=="")  
    {  
        alert("请填写顾客籍贯");  
        return false;  
    }
	else if(addcustomeraction.customerposition.value=="")  
    {  
        alert("请填写顾客职务");  
        return false;  
    }
	else if(addcustomeraction.customercardtype.value=="")  
    {  
        alert("请填写证件类型");  
        return false;  
    }
	else if(editcustomer.customerpostnumber.value=="")  
    {  
        alert("请填写证件号码");  
        return false;  
    }
	
	
	return confirmAct2(); 
}