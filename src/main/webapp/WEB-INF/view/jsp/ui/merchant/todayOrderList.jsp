<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- <base href="/"> -->
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/plug/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/plug/bootstrap/daterangepicker-bs3.css" />
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/setCateg.css" />
    <script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/plug/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/moment.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
	<script type="text/javascript" src="/js/area.js"></script>
	<script type="text/javascript" src="/js/location.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
    <title>今日简报</title>
  <script type="text/javascript">
    	function showPage(number){
    		var status="";
    		window.location.href="/u/merchant/todayOrderlist.html?pageNo="+number+"&status="+status;
    	}
    </script>
</head>
<body>
<div style=" text-align:center">
		<jsp:include page="../include/left.jsp"><jsp:param value="todayOrderlist" name="checkLefr"/><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
		<input type="hidden" name="pageNo" id="pageNo" value=""/>
	<div class="right-box">
		<div class="right-part">
		   <div class="header-bg"></div>
		    <div class="wrap" style=" margin-top:80px;">
		        <div class="wrap_list wrap_lista">
		            <table class="table-responsive table_box">
		            	<thead>
		            		<tr>
		            			<td>订单号/时间</td>
		            			<td>数量</td>
		            			<td>利润/金额</td>
		            			<td>订单状态</td>
		            			<td>操作</td>
		            		</tr>
		            	</thead>
		            	<tbody>
		                 <c:forEach items="${dataList}" var="item" varStatus="vs">
		            		<tr>
		            			<td class="table_w30 p_r">
		                           <c:choose>
			                            <c:when test="${item.source==1 }"> <i class="icon_1"></i></c:when>
			                            <c:when test="${item.source==2 }"> <i class="icon_2"></i></c:when>
			                            <c:when test="${item.source==3 }"> <i class="icon_3"></i></c:when>
		                      	   </c:choose>
		                           <span class="a1 bold textLeft">${item.orderNumber }<br/><em><i class="icon iconfont _margin icon-shijian"></i><fmt:formatDate value="${item.createDateTime }" 
		pattern="yyyy.MM.dd"/></em></span> 
		                        </td>
		                        <td class="table_w17">
		                             <p>${item.orderNum }</p>
		                        </td>
		                        <td class="table_w17">
		                            <span class="bold red"><fmt:formatNumber value="${item.profit }" pattern="#.##" /><br/><em><fmt:formatNumber value="${item.orderTotalMoney }" 
		pattern="#.##" /></em></span>
		                        </td>
		                        <td class="table_w17">
		                            <p>
		                                <c:choose>
		                                    <c:when test="${item.status==10 }">未付款</c:when>
		                                    <c:when test="${item.status==20 }">已付款</c:when>
		                                    <c:when test="${item.status==30 }">配货中</c:when>
		                                    <c:when test="${item.status==40 }">已发货</c:when>
		                                    <c:when test="${item.status==50 }">交易成功</c:when>
		                                    <c:when test="${item.status==60 }"><span style="color:red">订单关闭</span></c:when>
		                                    <c:when test="${item.status==70 }">售后中</c:when>
		                                    <c:when test="${item.status==22 }">定制确认</c:when>
		                                    <c:when test="${item.status==24 }">面板打印中</c:when>
		                                    <c:when test="${item.status==26 }">定制中</c:when>
		                                    <c:when test="${item.status==28 }">已入库</c:when>
		                                </c:choose>
		                        </p>
		                        </td>
		                        <td class="table_w17">
		                            <p class="blue link _content_"><a href="/u/merchant/detail.html?orderNumber=${item.orderNumber }">详情</a></p>
		                        </td>
		            		</tr>
		                 </c:forEach>
		            	</tbody>
		             </table>
		         <jsp:include page="../include/pages.jsp"></jsp:include>
		         </div>
		         <div class="boxP">
		            <div class="wrap_listb" style="margin-top:0">
		                <div class="_right_title">
		                    <p>今日简报</p>
		                </div>
		                <div class="_right_text _hr">
		                    <p class="bold">${todayCount}</p>
		                    <p class="bold">订单数</p>
		                </div>
		                <div class="_right_text _height">
		                    <p class="bold"><fmt:formatNumber value="${todayTotalProfit }" 	pattern="#.##" /></p>
		                    <p class="bold">利润</p>
		                </div>
		            </div>
		            <div class="wrap_listb Coupon">
		                <div class="_right_title">
		                    <p>本月简报</p>
		                </div>
		                <div class="_right_text _hr">
		                    <p class="bold">${monthCount }</p>
		                    <p class="bold">订单数</p>
		                </div>
		                <div class="_right_text _height">
		                    <p class="bold"><fmt:formatNumber value="${monthTotalProfit }" pattern="#.##" /></p>
		                    <p class="bold">利润</p>
		                </div>
		            </div>
		        </div>  
		    </div>
	</div>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('input[name="daterange"]').daterangepicker();
    });
</script>
</body>
</html>