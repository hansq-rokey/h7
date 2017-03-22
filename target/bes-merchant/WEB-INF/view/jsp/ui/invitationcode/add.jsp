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
    <script src="../../../../../plug/adddatetime.js" type="text/javascript" ></script>
    <link href="../../../../../css/common.css" rel="stylesheet" type="text/css">
	<link href="../../../../../css/add-invitecode.css" rel="stylesheet" type="text/css">    
	<script src="../../../../../js/common.js" type="text/javascript" ></script>
    <script src="../../../../../js/base.js" type="text/javascript" ></script>
    <title>邀请码列表</title>
</head>
<body>
<div class="container clearfix">
    <jsp:include page="../include/top.jsp"></jsp:include>
    
 <div class="content">

		<jsp:include page="../include/left.jsp"></jsp:include>
 		<div class="content-right">
            <div class="right-title clearfix">
                <a>新增邀请码</a>
            </div>
            <div class="main">
            	<p class="balancetx">账户余额：￥${ ssssMoney }元</p>
            	<div class="row imgbox">
            	<c:forEach items="${ listProduct }" var="item">
            		<div class="col-md-3">
            			<p class="pro"><a href="${ item.detailUrl }" target="_blank" data-id="${ item.id }">${ item.title }</a></p>
            			<p class="tc"><input type="checkbox" data-id="${ item.id }" class="checked" isCheck="false"> </p>
            		</div>
            	</c:forEach>
            	</div>
            	<p class="paymoney">需付款：<span class="num">0</span>元</p>
            	<form id="allowProductId" method="POST" action="/u/invitationcode/add.html">
	            	<div class="row">
		            	<p class="ask">面额：</p>
		            	<input type="text" class="answer" style="width: 124px;" name="money" value="0"/>
		            	<p class="ask">数量：</p>
						<p class="kuang" unselectable="on" style="-moz-user-select:none;" onselectstart="return false;"><span class="minus numBtn">-</span><input type="text" value="1" class="quantity" name="number"><span class="plus numBtn">+</span></p>
		            </div>
		            <div class="row">
		            	<p class="ask">姓名：</p>
		            	<input type="text" class="answer" name="receiveUserName"/>
		            </div>
		            <div class="row">
		            	<p class="ask">手机号：</p>
		            	<input type="text" class="answer" name="receiveUserPhone"/>
		            </div>
		            <div class="row">
		            	<p class="ask">有效期：</p>
		            	<input type="text" onclick="SelectDate(this,'yyyy-MM-dd')"  class="answer" name="validTime">
		            </div>
		            <input type="hidden" name="ids" class="prodId">
		            <input type="button" class="buybtn" value="立即购买"/>
		            <input type="button" class="clobtn" value="取消" style="display: none;"/>
		        </form>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
	$('input[type=checkbox]').on('click',function(){
		$(this).each(function(){
			if($(this).attr('isCheck')=='true'){
				$(this).removeAttr("isCheck")
			}else{
				$(this).attr('isCheck',true);
			}
		})
	})
	$('.buybtn').on('click',function(){
		checked();
		var name=$('input[name=receiveUserName]').val(),
			phone=$('input[name=receiveUserPhone]').val(),
			time=$('input[name=validTime]').val(),
			money=parseInt($('input[name=money]').val());
		if(money==''||money==null){
			alertLayel("面额不能为空");
			return;
		}
		if(name==''||name==null){
			alertLayel("姓名不能为空");
			return;
		}
		if(!phone.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)){
			alertLayel("手机格式不正确");
			return;
		}
		if(phone==''||phone==null){
			alertLayel("手机号不能为空");
			return;
		}
		if(time==''||time==null){
			alertLayel("有效期不能为空");
			return;
		}
		$('#allowProductId').submit();
	})
	function checked(){
		var ids=[];
		$('input[type=checkbox]').each(function(){
			if($(this).attr('isCheck')=='true'){
				var id=$(this).attr('data-id');
				ids.push(id);
			}
		})
		$('input[name=ids]').val(ids);
	}
	$('.numBtn').on('click',function(){
		var num=parseInt($('.quantity').val()),
		money=parseInt($('input[name=money]').val());
		if($(this).hasClass('plus')){
			num+=1;
			$('.quantity').val(num);
		}
		if($(this).hasClass('minus')){
			if(num>0){
				num-=1;
				$('.quantity').val(num);
			}
		}
		if(money!=''){
			$('.num').text(num*money); 
		}
	})
	$('input[name=money],input[name=number]').bind('input propertychange', function() {
		var money=parseInt($('input[name=money]').val());
		var num=parseInt($('.quantity').val());
		if(!num){
			num=0;
			$('.quantity').val(0)
		}
		if(!money){
			$('input[name=money]').val(0);
			money=0;
		}
			$('.num').text(num*money);
		
	});
	$('.quantity,input[name=money]').keydown(function(e){// 绑定事件
		var oEvent = e || window.event;// 兼容处理
		if(!(oEvent.keyCode==46)&&!(oEvent.keyCode==8)&&!(oEvent.keyCode==9)&&!(oEvent.keyCode==37)&&!(oEvent.keyCode==39))// 键值
		if(!((oEvent.keyCode>=48&&oEvent.keyCode<=57)||(oEvent.keyCode>=96&&oEvent.keyCode<=105))) // 键值
			return false;
		//oEvent.returnValue = false; // firefox 兼容问题
	});
})
</script>
</body>
</html>
