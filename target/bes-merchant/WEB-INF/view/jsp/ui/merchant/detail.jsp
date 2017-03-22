<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- <base href="/"> -->
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/plug/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/procure.css" />
    <script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/js/area.js"></script>
	<script type="text/javascript" src="/js/location.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
    <title>订单详情</title>
</head>
<body>
<div style=" text-align:center">
	<jsp:include page="../include/left.jsp"><jsp:param value="orderlist" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
	<div class="right-box" style="margin-left: 280px;">
		<div class="right-part">
			<div class="box-top">
				<div class="tab-list">
		            <p class="Operation_tag" style="text-align:left">
		              <a href="###">订单列表</a>
		              <b class="Operation_icon"></b>
		              <span>订单详情</span> 
		            </p>
	              </div>
			</div>
		  	<div class="layout-box">
			  	<div class="layout-left">
				  	<div class="order_box">
			        	<ul class="order-mian">
			        	  <c:forEach items="${orderStatusList }" var="item">
			        	   <c:if test="${item.dictCodeValue!=80 }">
			        		<li>
			        		  <p  class="order_text">${item.dictCodeName }</p>
			        		  <p  class="${item.flow?'order_plan order_planHover':'order_plan' }"></p>
			        		  <c:if test="${item.flow }">
			        		  	<p  class="order_date"><fmt:formatDate value="${item.orderHistory.createDateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			        		  </c:if>
			        		</li>
			        	   </c:if>
			        	  </c:forEach>
			        	 </ul>
		                 <a class="order_btn" href="###">查看物流</a>
		              </div>
		              <table class="Operation Operation2">
					    		<tr>
					    			<th>序号</th>
					    			<!-- <th>包装码</th> -->
					    			<th>名称</th>
					    			<th>单价</th>
					    			<th>数量</th>
					    			<th>总价</th>
					    		</tr>
					    		<c:forEach items="${dataList }" var="item" varStatus="v">
					    		<tr>
					    			<td class="order_b">${v.count}</td>
					    			<!-- <td>FE-FE2</td> -->
					    			<td>
				                      <div class="order_b">
				                      	 <span class="img_width">
				                      	 	<c:forEach items="${item.pics }" var="pic">
				                      	 		<img src="${pic.url }">
				                      	 	</c:forEach>
				                      	 </span>
				                      	 <span>
				                      	 	<a href="###">${item.productTitle }</a>
				                      	 	<span>
				                      	 		<c:if test="${item.orderItemExtend!=null }">
								                   ${item.orderItemExtend.length }cm*${item.orderItemExtend.width }cm*${item.orderItemExtend.height }cm
								                </c:if>
				                      	 	</span>
				                      	 </span>
				                      </div>
					    			</td>
					    			<td class="order_b">${item.unitPrice }</td>
					    			<td class="order_b">${item.num }</td>
					    			<td class="order_b">${item.totalPrice }</td>
					    		</tr>
					    		</c:forEach>
					    	</table>
				    	 </div>
				    	<div class="Operationicon_right" style="margin-top:20px">
					     <ul class="order-wrap">
					     	<li class="order-icon order-icon1">${orderInfomation.orderNumber }</li>
					     	<li>
						     	<span class="order-icon order-icon3">${orderInfomation.reveiveUserName }</span>
						     	<span class="order-icon order-icon4" style="text-indent:15px;">${orderInfomation.mobilePhone }</span>
						    </li>
						    <li class="order-icon order-icon5">${orderInfomation.provinceName}${orderInfomation.cityName}${orderInfomation.detailAddress }</li> 	
					     </ul>
			   		 </div>
	  			    </div>	
	    </div>
	</div>
</div>
</body>
</html>