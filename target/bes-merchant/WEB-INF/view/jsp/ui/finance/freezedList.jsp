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
    <title>提现记录</title>
</head>
<body>
<div class="container clearfix">
    <jsp:include page="../include/top.jsp"></jsp:include>
    <div class="content">
		<jsp:include page="../include/left.jsp"><jsp:param value="fin" name="checkLefr" /></jsp:include>
        <div class="content-right">
            <div class="right-title clearfix">
                <a>待确认金额</a>
            </div>
            <div class="row">
            	<form action="/u/finance/freezedList.html" method="post">
            		<input type="hidden" name="pageNo" value="${pageNo }" id="pageNo"/>
	                <input type="text" name="startTime" id="startTimeStr" value="${startTime }" placeholder="开始时间" class="datetimepicker startdata" onclick="SelectDate(this,'yyyy-MM-dd')">
	                <span>至</span>
	                <input type="text" name="endTime" id="endTimeStr" value="${endTime }" placeholder="结束时间" class="datetimepicker startdata" onclick="SelectDate(this,'yyyy-MM-dd')">
	                <input type="submit" value="搜索" class="searchOrder search">
                </form>
            </div>
            <div class="row orderlist-box">
                <table class="orderlist-table">
                    <thead>
                    <tr>
                        <td style="min-width: 120px;">订单号</td>
                        <td style="min-width: 120px;">日期</td>
                        <td style="min-width: 120px;">金额</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dataList }" var="item">
	                    <tr>
	                        <td>${item.orderNumber }</td>
	                        <td><fmt:formatDate value="${item.createDateTime }" pattern="yyyy-MM-dd"/></td>
	                        <td>${item.profit }</td>
	                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        <jsp:include page="../include/pages.jsp"></jsp:include>
    	</div>
	</div>
</div>
</body>
</html>