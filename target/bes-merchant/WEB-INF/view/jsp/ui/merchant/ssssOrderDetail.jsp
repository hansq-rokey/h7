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
    <link rel="stylesheet" type="text/css" href="/css/procure.css" />
    <script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/moment.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
	<script type="text/javascript" src="/plug/laypage/laypage.js"></script>
	<script type="text/javascript" src="/plug/layer/layer.js"></script>  
	<script type="text/javascript" src="/js/area.js"></script>
	<script type="text/javascript" src="/js/location.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
    <title>合伙人订单详情</title>
</head>
<body>
<jsp:include page="../include/left.jsp"><jsp:param value="orderlist" name="checkLefr" /></jsp:include>
<div class="right-bottom">
	<div class="right-top" style="left: 280px;"></div>
    <div class="a_content">
    	   <div class="b_content b_content1">
    	   	    <div class="tab-list" style="left:45px;top: -135px;">
		            <ul class="Operation_tag" style="margin-top: 90px;">
		              <a href="###">订单列表</a>
		              <b class="Operation_icon"></b>
		              <a href="###">订单详情</a> 
		            </ul>
                </div>
    	   	    <div class="order_box">
		        	<ul class="order-mian">
		        	  <c:forEach items="${orderStatusList }" var="item">
		        		<li>
		        		  <p  class="order_text">${item.dictCodeName }</p>
		        		  <p  class="${item.flow?'order_plan order_planHover':'order_plan' }"></p>
		        		  <c:if test="${item.flow }">
		        		  	<p  class="order_date"><fmt:formatDate value="${item.orderHistory.createDateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		        		  </c:if>
		        		</li>
		        	 </c:forEach>
		        		<!-- <li>
		        		   <p  class="order_text">付款</p>
		        		   <p  class="order_plan"></p>
		        		   <p  class="order_date">2015.01.25<br>10:30</p>
		        		</li>
		        		<li>
		         		   <p  class="order_text">同意配货</p>
   	         		       <p  class="order_plan"></p>
		        		   <p  class="order_date">2015.01.25<br>10:30</p>
		        		</li>
		        		<li>
		         			<p  class="order_text">发货</p>
		         			<p  class="order_plan order_last"></p>
		        		    <p  class="order_date">2015.01.25<br>10:30</p>
		        		</li>
		        		<li>
		        			<p  class="order_text">签收</p>
		        			<p  class="order_plan order_planHover"></p>
		        		    <p  class="order_date">2015.01.25<br>10:30</p>
		        		</li> -->
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
	    		</tr>
	    		<c:forEach items="${dataList }" var="item" varStatus="v">
	    		<tr>
	    			<td>${v.count}</td>
	    			<!-- <td>FE-FE2</td> -->
	    			<td>
                      <div class="order_b">
                      	 <span><img src="../images/sl_01.png"></span>
                      	 <span>
                      	 	<a href="###">${item.productTitle }</a>
                      	 	<span>
                      	 		<c:forEach items="${item.orderItemExts}" var="ext" varStatus="v">
                      	 			${ext.formatExtValue }cm
                      	 			<c:if test="${v.count==1 }">*</c:if>
                      	 			<c:if test="${v.count==2 }">*</c:if>
                      	 		</c:forEach>
                      	 	</span>
                      	 </span>
                      </div>
	    			</td>
	    			<td>${item.unitPrice }</td>
	    			<td>${item.num }</td>
	    		</tr>
	    		</c:forEach>
	    	</table>
	     </div>	
	    <div class="Operationicon_right" style="margin-top:20px">
	     <div class="order-wrap">
	     	<p ><i class="order-icon order-icon1"></i>${orderInfomation.orderNumber }</p>
	     	<p>
		     	<span><i class="order-icon order-icon3"></i>${orderInfomation.reveiveUserName }</span>
		     	<span><i class="order-icon order-icon4"></i>${orderInfomation.mobilePhone }</span>
		    </p>
		    <p><i class="order-icon order-icon5"></i>${orderInfomation.provinceName}${orderInfomation.cityName}${orderInfomation.detailAddress }</p> 	
	     </div>
	    </div>
      </div>
</div>
</body>
</html>