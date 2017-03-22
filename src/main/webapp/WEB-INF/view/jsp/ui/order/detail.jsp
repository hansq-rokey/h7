<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="/plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <script src="/plug/adddatetime.js" type="text/javascript" ></script>
    <link href="/css/common.css" rel="stylesheet" type="text/css">
    <link href="/css/shop-orderdetails.css" rel="stylesheet" type="text/css">
    <script src="/js/common.js" type="text/javascript" ></script>
    <title>订单详情</title>
</head>
<body>
<div class="container clearfix">
    <jsp:include page="../include/top.jsp"></jsp:include>
    <div class="content">
        <jsp:include page="../include/left.jsp"><jsp:param value="orderlist" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
        <div class="content-right">
            <div class="right-title clearfix">
                <a>我的订单</a>
            </div>
            <div class="row"><span  class="light">订单管理</span>>订单详情 </div>
            <div class="row">
                <span class="light">订单号:</span>${order.orderNumber }
                <span class="space"></span>
                <span class="light">用户姓名:</span>${reciver.reveiveUserName }
                <span class="space"></span>
                <span class="light">手机号:</span>${reciver.mobilePhone }
            </div>
            <div class="row orderlist-box">
                <div class="order-container">
	            	<c:if test="${order.status!=60 }">
                    <ul class="order-status clearfix">
                    	<c:forEach items="${orderStatusList }" var="item">
	                        <li class="${item.flow ? 'on':'' }">
	                            <span>${item.dictCodeName }</span>
	                            <c:if test="${item.flow }">
									<em class="dateTime"><fmt:formatDate value="${item.orderHistory.createDateTime }" pattern="yyyy-MM-dd HH:mm"/></em>									
								</c:if>
	                        </li>
						</c:forEach>
                    </ul>
                    <div class="sline"></div>
                    <div class="sline2"></div>
                    </c:if>

                    <div class="order">
                        <h4 class="clearfix"><c:if test="${order.status==10 }"><span class="fr order-close">12小时后订单将关闭</span></c:if><span class="fl"><c:if test="${logistics!=null&&logistics.expressNo!=null }"> 运单号：${logistics.expressNo}</c:if></span></h4>
                        <div class="order-sp">
                        	<c:forEach items="${orderItems }" var="item" varStatus="statusItem">
								<div class="sp ${statusItem.index==0?"bt0":""} clearfix">
									<c:forEach items="${item.pics }" var="pic" varStatus="statusPic">
										<c:if test="${statusPic.first }"><img src="${pic.url }" /></c:if>
									</c:forEach>
									<span class="sp-name">${item.productModelFormatName }</span>
									<span class="sp-price"><fmt:formatNumber value="${item.discountUnitPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span>
									<span class="sp-count">X${item.num }</span>
								</div>
							</c:forEach>
                            <div class="sp-right">
	                            <c:if test="${order.status==50 }">
	                            	<a href="http://www.ibaixiong.com/u/service/apply.html?number=${order.orderNumber }" class="after-sale">申请售后</a>
	                            </c:if>
                                <div class='logistics-info' data-number="${order.orderNumber }" style="height:100%;">
                                    <a class="detail detail_on" style="height: 20px;position:absolute;margin:auto;top:0;bottom:0;left:0;right:0;" href="javascript:void(0)">物流信息</a>
                                </div>
                            </div>
                        </div>
                        <div class="order-info clearfix">
                            <div class="order-info-money fl">
                                <h6>实付：<span><fmt:formatNumber value="${order.discountPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></h6>
                                <p><em>商品总额</em>：<fmt:formatNumber value="${order.totalPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></p>
                                <!-- <p><em>积分优惠</em>：<span>-￥199.00</span></p> -->
                                <p><em>其他优惠</em>：<span>-<fmt:formatNumber value="${order.totalPrice-order.discountPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
                                <p><em class="yf">运费</em>：<span>0</span></p>
                            </div>
                            <div class="order-info-log fl">
                                <h6>收货信息</h6>
                                <p><em class="yf">姓名</em>：${reciver.reveiveUserName }</p>
                                <p><em>收货地址</em>：${reciver.provinceName }${reciver.cityName }${reciver.districtName }${reciver.detailAddress }</p>
                                <p><em class="yf">电话</em>：${reciver.mobilePhone }</p>
                                <p><em>送货时间</em>：${reciver.deliverTimeName }</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../include/pages.jsp"></jsp:include>
        </div>

    </div>
</div>
<script>
		var html='';
		function dateTime(){
			$('.order-close').each(function(){
					var startDate=$('.dateTime').text().toString().replace(/-/g,"/");
					var newDate=new Date();
					newDate=newDate++;
					startDate=new Date(Date.parse(startDate));
					var time=43200000-(newDate-startDate);
					//if(time>0){
						var seconds = time/1000;
				        var minutes = Math.floor(seconds/60);
				        var hours = Math.floor(minutes/60);
				        var CHour= hours % 24;
				        var CMinute= minutes % 60;
				        var CSecond= seconds % 60;
				        html=''+CHour+'时'+CMinute+'分'+parseFloat(CSecond).toFixed(0)+'秒后订单关闭';
				        $(this).text(html);
					//}
			})
		}
		window.onload=function(){
	        setInterval("dateTime()",1000);

	    }
		var length=$('.order-status').find('li').length;
		var width=$('.order-status').width();
		if(width<length*165){
			$('.sline2').show();
		}
		$('.sline').css('width',length*165);
	</script>
</body>
</html>