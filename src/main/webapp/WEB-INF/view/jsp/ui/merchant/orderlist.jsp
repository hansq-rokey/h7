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
    <link href="../../../../../css/finance.css" rel="stylesheet" type="text/css">
    <script src="../../../../../js/common.js" type="text/javascript" ></script>
    <script src="../../../../../js/base.js" type="text/javascript" ></script>
    <title>代理商订单列表</title>
</head>
<script type="text/javascript">
	function setTypeVal2(id,name){
	   $("#form2NameSel").text(name);
	   $("#level").val(id);
	}
	$(document).ready(function() {
		var level = $("#level").val();
		if(level == 1){
			$("#form2NameSel").text("代理商");
		}
		if(level == 2){
			$("#form2NameSel").text("4s店");
		}
	});
</script>
<body>
<div class="container clearfix">
    <jsp:include page="../include/top.jsp"></jsp:include>
    <div class="content">
		<jsp:include page="../include/left.jsp"><jsp:param value="orderlist" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
        <div class="content-right">
        	<div class="right-title clearfix">
                <a>订单列表</a>
            </div>
            <div class="row">
            	<form action="/u/merchant/orderlist.html" method="post">
            		<input type="hidden" name="level" value="${level }" id="level"/>
            		<input type="hidden" name="pageNo" value="${pageNo }" id="pageNo"/>
	                <input type="text" name="keywords" value="${keywords }" placeholder="根据名称、订单号、店铺编号查询" class="search-orderNumber" style="width: 200px;color:#333;margin-right:20px"">
	                <span class="selectinput" style="width: 180px;margin-left:0;color:#333;margin-right:25px"">
	                    <span class="selectvalue" id="form2NameSel">代理商</span>
	                    <i class="arrowright"></i>
	                    <ul class="option">
	                        <i class="arrowtop"></i>
	                        <li onclick="setTypeVal2(1,'代理商')">代理商</li>
	                        <li onclick="setTypeVal2(2,'4s店')">4s店</li>
	                    </ul>
	                </span>
	                <input type="text" name="startTime" id="startTimeStr" value="${startTime }" placeholder="开始时间" class="datetimepicker startdata" onclick="SelectDate(this,'yyyy-MM-dd')">
	                <span>至</span>
	                <input type="text" name="endTime" id="endTimeStr" value="${endTime }" placeholder="结束时间" class="datetimepicker startdata" onclick="SelectDate(this,'yyyy-MM-dd')">
	                <input type="submit" value="搜索" class="searchOrder search" style="margin-left:20px"">
                </form>
            </div>
            <div class="orderlist-box">
                <table class="orderlist-table">
                    <thead>
                    <tr>
                        <td style="min-width: 120px;">订单号</td>
                        <td style="min-width: 120px;">店铺名</td>
                        <td style="min-width: 120px;">店铺编号</td>
                        <td style="min-width: 120px;">级别</td>
                        <td style="min-width: 120px;">时间</td>
                        <td style="min-width: 120px;">利润</td>
                     	<td style="min-width: 120px;">订单状态</td>
                        <td style="min-width: 120px;">操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dataList }" var="item">
	                    <tr>
	                    	<!-- 查询的是代理商 -->
	                        <c:if test="${level==1 }">
	                        	<td>${item.orderNumber }</td>
		                        <td>${item.merchant.cityMerchantName }</td>
		                        <td>${item.merchant.merchantCode}</td>
		                        <td>${item.merchant.level}</td>
		                        <td><fmt:formatDate value="${item.createDateTime }" pattern="yyyy-MM-dd"/></td>
		                        <td>${item.profit}</td>
		                        <td>
		                        	<c:if test="${item.status==10 }">
		                        	未付款
	       							</c:if>
									<c:if test="${item.status==20 }">
	       							已付款
	       							</c:if>
	       							<c:if test="${item.status==30 }">
	       							配货中
	       							</c:if>
	       							<c:if test="${item.status==40 }">
	       							已发货
	       							</c:if>
									<c:if test="${item.status==50 }">
									交易成功
	       							</c:if>
	       							<c:if test="${item.status==60 }">
	       							订单关闭
	       							</c:if>
	       							<c:if test="${item.status==70 }">
	       							售后中
	       							</c:if>
									<c:if test="${item.status==22 }">
									定制确认
	       							</c:if>
	       							<c:if test="${item.status==24 }">
	       							面板打印中
	       							</c:if>
	       							<c:if test="${item.status==26 }">
	       							定制中
	       							</c:if>
	       							<c:if test="${item.status==28 }">
	       							已入库
	       							</c:if>
       							</td>
		                      	<td><a class="order-details link" href="/u/order/detail.html?number=${item.orderNumber }">查看详情</a></td>
	                        </c:if>
	                        <!-- 查询的是4s店 -->
	                        <c:if test="${level==2 }">
		                        <td>${item.orderNumber }</td>
		                        <td>${item.info.ssssName }</td>
		                        <td>${item.info.ssssCode}</td>
		                        <td></td>
		                        <td><fmt:formatDate value="${item.createDateTime }" pattern="yyyy-MM-dd"/></td>
		                        <td>${item.profit}</td>
		                        <td>
		                        	<c:if test="${item.status==10 }">
		                        	未付款
	       							</c:if>
									<c:if test="${item.status==20 }">
	       							已付款
	       							</c:if>
	       							<c:if test="${item.status==30 }">
	       							配货中
	       							</c:if>
	       							<c:if test="${item.status==40 }">
	       							已发货
	       							</c:if>
									<c:if test="${item.status==50 }">
									交易成功
	       							</c:if>
	       							<c:if test="${item.status==60 }">
	       							订单关闭
	       							</c:if>
	       							<c:if test="${item.status==70 }">
	       							售后中
	       							</c:if>
									<c:if test="${item.status==22 }">
									定制确认
	       							</c:if>
	       							<c:if test="${item.status==24 }">
	       							面板打印中
	       							</c:if>
	       							<c:if test="${item.status==26 }">
	       							定制中
	       							</c:if>
	       							<c:if test="${item.status==28 }">
	       							已入库
	       							</c:if>
       							</td>
		                        <td><a class="order-details link" href="/u/order/detail.html?number=${item.orderNumber }">查看详情</a></td>
	                        </c:if>
	                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        <jsp:include page="../include/pages.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
