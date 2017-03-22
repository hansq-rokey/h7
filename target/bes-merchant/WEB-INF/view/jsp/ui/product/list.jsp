<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- <base href="/" /> -->
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/plug/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/plug/bootstrap/daterangepicker-bs3.css" />
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/setCateg.css" />
    <script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/moment.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
	<script type="text/javascript" src="/plug/laypage/laypage.js"></script>
	<script type="text/javascript" src="/js/area.js"></script>
	<script type="text/javascript" src="/js/location.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
    <title>商城</title>
    <script type="text/javascript">
    	function showPage(number){
    		window.location.href="/u/product/list.html?pageNo="+number;
    	}
    </script>
</head>
<body>
<div style=" text-align:center">
	<jsp:include page="../include/left.jsp"><jsp:param value="product_list" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
	<input type="hidden" name="pageNo" id="pageNo" value=""/>
	<div class="right-box">
		<div class="right-part">
			 <div class="box-top"></div>
				  <div class="cc_se">
				    <div class="input-list" style="padding-left: 20px;display:none">
				        <input type="text" placeholder="订单号">
				        <span class="search-icon ripple-event"></span>
				     </div>
				 </div>
				 <div class="shopping-content" id="shopping-content">
				 	<c:forEach items="${list}" var="item">
					 	<div class="shopping-item">
					 			<a class="shopping-link" href="http://daili.ibaixiong.com/u/product/${item.product.id }.html">
						 			 <c:forEach items="${item.pics }" var="pic" varStatus="vs">
				                     	<c:if test="${vs.first}">
					                      <img class="shopping-img-content"  src="${pic.url }">
				                     	</c:if>
				                     </c:forEach>
					 			</a>
					 		<div class="shoppping-tag">
					 			<div class="shopping-tag-wprice">
					 				<h3 class="shopping-tag-title">${item.product.title }</h3>
					 				<c:if test="${item.product.isMaterialCalculate==1 }">
						               	<a class="shopping-tag-sum" target="_blank" href="http://daili.ibaixiong.com/u/product/tool/${item.product.id }.html">物料计算</a>
			                         </c:if>
					 			</div>
					 			<div class="shopping-tag-xprice">
					 				 <c:if test="${item.format.isExtProperties==1 }">
			                         	<p class="">
				                             <span class="bold">按需计算</span>
				                             <span>按需计算</span>
				                         </p> 
			                         </c:if>
					 			</div>
					 			<div class="shopping-tag-price">
					 				<c:if test="${item.format.isExtProperties==0 or item.format.isExtProperties==null }">
				                             <span class="shopping-purh bold">采购价：￥<fmt:formatNumber value="${item.format.productPurchasePrice*fixProfit}" pattern="#.##"/> </span>
				                             <span class="shopping-retail">零售价：￥<fmt:formatNumber value="${item.format.productPurchasePrice*fixProfit}" pattern="#.##"/></span>
	                         
			                         </c:if>
					 			</div>
					 		</div>
					 	</div>
					 </c:forEach>	
					 <jsp:include page="../include/pages.jsp"></jsp:include>
				 </div>
			</div>
		</div>
	</div>
</body>
<script>
	/* window.onload = function(){
		var imgcontent = document.getElementById("shopping-content");
		console.log(imgcontent);
		var imgchild =  imgcontent.children || imgcontent.childNodes;
		var url ='<img src ="../../images/loading.jpg"/>';
		 for(var i = 0; i < imgchild.length ; i++){
			 if(imgchild[i].nodeType == "1" && imgchild[i].getAttribute("class") == "shopping-link"){
				 console.log(imgchild[i].);
			 }
		}
	} */
	window.onload = function(){
		var imgcontent =$(".shopping-link");
		var arr =[];
		var url ='<img src ="../../../images/loadimg.jpg"/>';
		for(var i = 0; i < imgcontent.length;  i++ ){
			 arr.push( imgcontent[i].children || imgcontent[i].childNodes);
		}
		for(var j = 0;j < arr.length ; j++){
			if(arr[j].length == "0"){
				console.log(imgcontent[j].innerHTML = url);
			}
		}
	}
</script>
</html>