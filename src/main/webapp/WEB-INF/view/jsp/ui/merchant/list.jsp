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
    <link rel="stylesheet" type="text/css" href="/css/procure.css" />
    <script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/moment.js"></script>
	<script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
    <title>合伙人列表</title>
    <script type="text/javascript">
    	function showPage(number){
			window.location.href="/u/merchant/list.html?pageNo="+number;
    	}
    </script>
</head>
<body>
<jsp:include page="../include/left.jsp"/>
<input type="hidden" name="pageNo" id="pageNo" value=""/>
<div class="addBtn"><i></i></div>
<div class="right-part">
    <div class="right-top">
        <div class="input-list">
            <input type="text">
            <span class="search-icon ripple-event"></span>
            <div class="setDateBox">
                <input type="text" name="daterange" class="daterange">
                <i class="select-arrow"></i>
                <i class="date-icon"></i>
            </div>
        </div>
        <div class="tab-list">
            <ul>
                <li class="ripple-event">库存列表</li>
                <li class="on ripple-event">出库列表</li>
                <li class="ripple-event">入库列表</li>
                <li class="ripple-event">采购列表</li>
            </ul>
        </div>
    </div>
    <div class="right-bottom">
        <div class="content">
            <div class="row content-title">
                <div class="col-lg-2">名称</div>
                <div class="col-lg-2">编号</div>
                <div class="col-lg-2">联系人</div>
                <div class="col-lg-2">联系方式</div>
                <div class="col-lg-2">操作</div>
            </div>
            <c:forEach items="${dataList }" var="item" varStatus="vs">
	            <div class="row ${vs.count%2==0?'even':'' }">
	                <div class="col-lg-2">
	                     <i class="icon_${item.type }"></i>
	                    <p class="only-line bold">${item.ssssName }</p>
	                </div>
	                <div class="col-lg-2">
	                    <p class="blue only-line bold">${item.ssssCode}</p>
	                </div>
	                <div class="col-lg-2">
	                    <p class="only-line">${item.linkMan}</p>
	                </div>
	                <div class="col-lg-2">
	                    <p class="red only-line bold">${item.linkTel}</p>
	                </div>
	                <div class="col-lg-2">
	                    <p class="blue data-title only-line" title="订单">
	                    	<a href="/u/merchant/ssssOrderList.html?id=${item.id }">订单</a>
	                    </p>
	                </div>
	            </div>
            </c:forEach>
        </div>
        <jsp:include page="../include/pages.jsp"></jsp:include>
    </div>

    <!-- 新增出库-->
    <div class="pop addStockExportPop">
        <div class="popBg"></div>
        <div class="smallLayel">
            <h3>新增出库</h3>
            <div class="row">
                <div class="col-lg-12">
                    <div class="input-item">
                        <p class="topItem">一级类目</p>
                        <div class="selectinput selectLong">
                            <i class="select-arrow"></i>
                            <span class="selectvalue"></span>
                            <ul class="opation">
                                <li>下拉一下拉一下拉一</li>
                                <li>下拉er下拉er下拉er</li>
                                <li>下拉三下拉三下拉三</li>
                                <li>下拉四下拉四下拉四</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="input-item">
                        <p class="topItem">物料名称</p>
                        <div class="selectinput selectLong">
                            <i class="select-arrow"></i>
                            <span class="selectvalue"></span>
                            <ul class="opation">
                                <li>下拉一下拉一下拉一</li>
                                <li>下拉er下拉er下拉er</li>
                                <li>下拉三下拉三下拉三</li>
                                <li>下拉四下拉四下拉四</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="input-item">
                        <p>数量</p>
                        <input type="text" value="">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="input-item">
                        <p>备注</p>
                        <input type="text" value="">
                    </div>
                </div>
            </div>
            <div class="row tc">
                <span class="popSure ripple-event">确认</span>
                <span class="popCancel">取消</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>