<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- <base href="/">  -->
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/plug/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/plug/bootstrap/daterangepicker-bs3.css" />
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/setCateg.css" />
    <script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/plug/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
    <script type="text/javascript" src="/js/location.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <title>提现记录</title>
    <script type="text/javascript">
    	function showPage(number){
    		window.location.href="/u/finance/cashList.html?pageNo="+number;
    	}
    </script>
</head>
<body>
<div style=" text-align:center">
	<jsp:include page="../include/left.jsp"><jsp:param value="cashList" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
	<input type="hidden" id="pageNo" name="pageNo" value=""/>
	<div class="right-box" style="margin-left: 280px;">
		<div class="right-part">
			<div class="box-top"></div>
		     <!-- <div class="right-top">
		       <div class="input-list" style="margin-top: 25px;display: none;">
		            <input type="text" placeholder="订单号">
		            <span class="search-icon ripple-event"></span>
		              <div class="setDateBox">
		                 <input type="text" name="daterange" class="daterange" >
		                 <i class="select-arrow"></i>
		                 <i class="date-icon"></i>
		               </div>
		            <div class="selectinput">
		                <i class="select-arrow"></i>
		                <i class="menu-icon"></i>
		                <span class="selectvalue">来源</span>
		                <ul class="opation">
		                    <li>下拉一下拉一下拉一</li>
		                    <li>下拉er下拉er下拉er</li>
		                    <li>下拉三下拉三下拉三</li>
		                    <li>下拉四下拉四下拉四</li>
		                </ul>
		            </div>
		            <div class="selectinput">
		                <i class="select-arrow"></i>
		                <i class="menu-icon"></i>
		                <span class="selectvalue">订单状态</span>
		                <ul class="opation">
		                    <li>下拉一下拉一下拉一</li>
		                    <li>下拉er下拉er下拉er</li>
		                    <li>下拉三下拉三下拉三</li>
		                    <li>下拉四下拉四下拉四</li>
		                </ul>
		            </div>
		        </div> -->
		     <!--    <div class="tab-list">
		         <ul>
		             <li class="on ripple-event">物料</li>
		             <li class="ripple-event">类目设置</li>
		         </ul>
		     </div> -->
		    </div>
		    <div class="right-bottom">
		        <div class="content">
		           <table class="table-responsive table_box">
		               <thead>
		                <tr class="text-indent">
		                   <td>流水号</td>
		                   <td>日期</td>
		                   <td>金额</td>
		                   <td>状态</tr>
		                </tr>   
		               </thead>
		               <tbody>
		                <c:forEach items="${dataList }" var="item" varStatus="vs">
		                   <tr class="text-indent">
		                       <td><span class="a1 bold">${item.payNumber }</span></td>
		                       <td><p><fmt:formatDate value="${item.createDateTime }" pattern="yyyy-MM-dd"/></p></td>
		                       <td><p>${item.money }</p></td>
		                       <td>
		                        <p class="blue link _content_">
		                            <c:if test="${item.status==-1 }">拒绝提现</c:if>
		                            <c:if test="${item.status==0 }">已申请</c:if>
		                            <c:if test="${item.status==1 }">已同意</c:if>
		                        </p>
		                       </td>
		                   </tr>
		                </c:forEach>   
		               </tbody>
		           </table>
		           <jsp:include page="../include/pages.jsp"></jsp:include>
		         </div>
		            <!--page-->
		            <div class="_page">
		                <ul id="biuuu_city_list"></ul>
		                <div id="biuuu_city"></div>
		            </div> 
		        </div>
		    </div>
	  </div>  
</body>
</html>