<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <base href="/">  -->
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/plug/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plug/bootstrap/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<link rel="stylesheet" type="text/css" href="/css/setCateg.css" />
<script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/plug/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
<script type="text/javascript" src="/js/location.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<title>销售额记录</title>
<script type="text/javascript">
	function showPage(number) {
		var id = $("#id").val();
		window.location.href = "/u/rebateRecord.html?pageNo=" + number+"&id="+id;
	}
</script>
</head>
<body>
	<div style="text-align: center">
		<jsp:include page="../include/left.jsp"><jsp:param	value="finance_list" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
		<input type="hidden" id="pageNo" name="pageNo" value="" />
		<input type="hidden" id="id" name="id" value="${merchantId }" />
		<div class="right-box" style="margin-left: 280px;">
			<div class="right-part">
				<div class="box-top"></div>
				<div class="right-bottom">
					<div class="content">
						<table class="table-responsive table_box">
							<thead>
								<tr class="text-indent">
									<th class="t-c">时间</th>
		   							<th class="t-c">代理商级别</th>
		   							<th class="t-c">订单号</th>
		   							<th class="t-c">订单总金额</th>
		   							<th class="t-c">返利比例</th>
		   							<th class="t-c">返利金额</th>
		   							<th class="t-c">返利代理商</th>
		   							<th class="t-c">备注</th>
		   							<th class="t-c">修改形式</th>
		   							<th class="t-c">总额</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${records }" var="record">
									<tr>
										<td><fmt:formatDate value="${record.createDateTime }"
												pattern="yyyy.MM.dd" /></td>
										<c:forEach items="${types }" var="item">
											<c:if test="${record.merchantLevel==item.dictCodeValue }">
												<td>${item.dictCodeName }</td>
											</c:if>
										</c:forEach>
										<td>${record.orderNumber }</td>
										<td>${record.totalPrice }</td>
										<td>${record.proportion }</td>
										<td class="editor-color">${record.money }</td>
										<td>${record.downCityName==null?"":record.downCityName }</td>
										<td>${record.remark }</td>
										<c:forEach items="${codes }" var="code">
											<c:if test="${record.status==code.dictCodeValue }">
												<td>${code.dictCodeName }</td>
											</c:if>
										</c:forEach>
										<td>${record.rebateMoney }</td>
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
	</div>
</body>
</html>