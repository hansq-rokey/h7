<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" type="text/css" href="/css/publicleft.css" />
<div class="left-part">
	<jsp:include page="top.jsp" />
	<%
		String checkLefr = request.getParameter("checkLefr");
		String userLevel = request.getParameter("userLevel");
	%>
	<input type="hidden" id="checkLefr" value="<%=checkLefr %>"/>
	<input type="hidden" id="userLevel" value="<%=userLevel %>"/>
	<div class="left-bottom">
		<h3 style="display: block;"><i class="_rig _rig1"></i>简报管理<i class="arrow"></i></h3>
		<ul>
			<li id="_todayOrderlist_"><a class="_block" href="/u/merchant/todayOrderlist.html">今日管理</a></li>
		</ul>
		<h3><i class="_rig _rig2"></i>产品管理<i class="arrow"></i></h3>
		<ul>
			<li id="product_list"><a class="_block" href="/u/product/list.html">产品列表</a></li>
		</ul>
		<h3><i class="_rig _rig3"></i>订单管理<i class="arrow"></i></h3>
		<ul>
			<li id="order_list"><a class="_block" href="/u/merchant/orderlist.html">订单列表</a></li>
		</ul>
		<h3><i class="_rig _rig4"></i>下级代理<i class="arrow"></i></h3>
		<ul>
			<li id="agent_list"><a class="_block" href="/u/merchant/cityList.html">代理商列表</a></li>
		</ul>
		<h3><i class="_rig _rig5"></i>财务管理<i class="arrow"></i></h3>
		<ul>
			<li id="cashList"><a class="_block" href="/u/finance/cashList.html">提现记录</a></li>
			<li id="finance_list"><a class="_block" href="/u/finance/list.html">我的订单</a></li>
			<li id="profit_list"><a class="_block" href="/u/finance/profitList.html">区域利润</a></li>
		</ul>
		<div class="_indent"></div>
	</div>
</div>
<script>
$(function(){
	var leftOn=$("#checkLefr").val();
	console.log(leftOn);
	  var that=$(this);
	   if(leftOn == "todayOrderlist"){
		   $("#_todayOrderlist_").attr("class","curLi");
		   $("#_todayOrderlist_").parents("ul").css('display','block');
	   }
	   if(leftOn == "product_list"){
		   $("#product_list").attr("class","curLi");
		   $("#product_list").parents("ul").css('display','block');
	   }
	   if(leftOn == "order_list"){
		   $("#order_list").attr("class","curLi");
		   $("#order_list").parents("ul").css('display','block');
	   }
	   if(leftOn == "cashList"){
		   $("#cashList").attr("class","curLi");
		   $("#cashList").parents("ul").css('display','block');
	   }
	   if(leftOn == "finance_list"){
		   $("#finance_list").attr("class","curLi");
		   $("#finance_list").parents("ul").css('display','block');
	   }
	   if(leftOn == "profitList_list"){
		   $("#profit_list").attr("class","curLi");
		   $("#profit_list").parents("ul").css('display','block');
	   }
	   if(leftOn == "agent_list"){
		   $("#agent_list").attr("class","curLi");
		   $("#agent_list").parents("ul").css('display','block');
	   }
	   var level = $("#userLevel").val();
	   if(level!=1){
		   $("#profit_list").css("display","none");
	   }
	   
})
</script>