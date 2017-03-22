<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="../../../../../plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="../../../../../plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <link href="../../../../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../../../../css/userinfor.css" rel="stylesheet" type="text/css">	
    <script src="../../../../../js/common.js" type="text/javascript" ></script>
    <script src="../../../../../js/base.js" type="text/javascript" ></script>
    <title>账户信息</title>
</head>
<body>
<div class="container clearfix">
    <div class="content">
		<jsp:include page="../include/left.jsp"></jsp:include>
        <div class="content-right">
            <div class="right-title clearfix">
                <a>账户信息</a>
            </div>
            <div class="main">
            	<p><span class="gray" style="margin-left:10px;">账<span style="width:30px;display:inline-block;"></span>号：</span><span class="gray">${user.phone }</span></p>
            	<input type="button" value="修改密码" class="amendbtn" style="margin-top:20px;">
            </div>
        </div>
    </div>
</div>
<div class="pop" style="display: none;">
    <div class="popbg"></div>
    <div class="layel">
        <h3 class="poptitle">修改密码<i class="closeicon"></i> </h3>
        <div class="row">
            <p><span class="tm">原密码：</span><input type="text" id="oldPwd" class="nr"></p>
            <p><span class="tm">新密码：</span><input type="text" id="newPwd1" class="nr"></p>
            <p><span class="tm">确认新密码：</span><input type="text" id="newPwd2" class="nr"></p>
        </div>
        <div class="row tc">
            <input type="button" value="确定" onclick="updatePwd()" class="okbtn">
        </div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on('click','.amendbtn',function(){
			$("#oldPwd").val("");
       		$("#newPwd1").val("");
       		$("#newPwd2").val("");
     		$('.pop').show();
    	});
	});
	function updatePwd(){
   		//alertLayel(mobile);
   		var oldPwd = $("#oldPwd").val();
   		var newPwd1 = $("#newPwd1").val();
   		var newPwd2  = $("#newPwd2").val();
   		if(oldPwd == null || oldPwd ==undefined || oldPwd == ''){
   			alertLayel("原密码不可为空");
			return false;
		}
   		if(newPwd1 == null || newPwd1 ==undefined || newPwd1 == ''){
   			alertLayel("新密码不可为空");
			return false;
		}
   		if(newPwd2 == null || newPwd2 ==undefined || newPwd2 == ''){
   			alertLayel("确认新密码不可为空");
			return false;
		}
   		if(newPwd1 != newPwd2){
   			alertLayel("新密码与确认新密码不一致");
			return false;
   		}
   		$.ajax({
			   url: "/u/user/update.html?oldPwd="+oldPwd+"&newPwd="+newPwd1,
			   type: "post",
			   dataType:"json",
			   cache:false,
			   success: function(obj){
		  			if ( !checkCode( obj ) ) {
						return;
				    }
				 	if ( obj.code == 0 ) {
				 		alertLayel("修改密码成功!");
						$(".pop").hide();
					}
			   }
			});
	}
</script>
</body>
</html>