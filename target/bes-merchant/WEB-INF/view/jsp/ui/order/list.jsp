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
    <script type="text/javascript" src="/plug/bootstrap/moment.js"></script>
    <script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
    <script type="text/javascript" src="/js/area.js"></script>
    <script type="text/javascript" src="/js/location.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <title>订单列表</title>
    <script type="text/javascript">
        function showPage(number){
            window.location.href="/u/merchant/orderlist.html?pageNo="+number;
        }
    </script>
</head>
<body>
<div style=" text-align:center">
	<jsp:include page="../include/left.jsp"><jsp:param value="order_list" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
	<input type="hidden" name="pageNo" id="pageNo" value=""/>
	<div class="right-box">
		<div class="right-part">
		 <div class="box-top"> </div>
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
		      </div>
		     <div class="tab-list">
		       <ul>
		           <li class="on ripple-event">物料</li>
		           <li class="ripple-event">类目设置</li>
		       </ul>
		   </div>
		  </div> -->
		  <div class="right-bottom">
		      <div class="content">
		         <table class="table-responsive table_box ">
		             <thead>
		                  <tr class="text-indent">
		                      <td>订单号/时间</td>
		                      <td>数量</td>
		                      <td>利润/金额</td>
		                      <td>订单状态</td>
		                      <td>操作</td>
		                  </tr>
		              </thead>
		              <tbody>
		                <c:forEach items="${pageInfo.list }" var="item" varStatus="vs">
		                  <tr class="text-indent">
		                      <td  class="table_w30 p_r">
		                          <span class="a1 bold order_firstbox">${item.orderNumber }</span>
		                          <span class="order_firstbox"> <i class=" icon iconfont _margin icon-shijian"></i><fmt:formatDate value="${item.createDateTime }" pattern="yyyy.MM.dd"/></span>
		                      </td>
		                      <td  class="table_w17">
		                          <p><fmt:formatNumber value="${item.orderNum }" pattern="#" /></p>
		                      </td>
		                      <td class="table_w17">
		                           <span class="bold red"><fmt:formatNumber value="${item.profit }" pattern="#.##" /></span><br/>
		                           <span><fmt:formatNumber value="${item.orderTotalMoney }" pattern="#.##" /></span>
		                      </td>
		                      <td class="table_w17">
		                          <p>
		                              <c:choose>
		                                  <c:when test="${item.status==10 }">未付款</c:when>
		                                  <c:when test="${item.status==20 }">已付款</c:when>
		                                  <c:when test="${item.status==30 }">配货中</c:when>
		                                  <c:when test="${item.status==40 }">已发货</c:when>
		                                  <c:when test="${item.status==50 }">交易成功</c:when>
		                                  <c:when test="${item.status==60 }">订单关闭</c:when>
		                                  <c:when test="${item.status==70 }">售后中</c:when>
		                                  <c:when test="${item.status==22 }">定制确认</c:when>
		                                  <c:when test="${item.status==24 }">面板打印中</c:when>
		                                  <c:when test="${item.status==26 }">定制中</c:when>
		                                  <c:when test="${item.status==28 }">已入库</c:when>
		                              </c:choose>
		                          </p>
		                      </td>
		                      <td class="table_w17">
		                          <p class="blue link _content_"><a class="_margin0" href="/u/merchant/detail.html?orderNumber=${item.orderNumber }">详情</a></p>
		                      </td>
		                  </tr> 
		                </c:forEach>    
		              </tbody>
		         </table>
		       </div>
		       <jsp:include page="../include/pages.jsp"></jsp:include>
		          <!--page-->
		            <div class="_page">
		                <ul id="biuuu_city_list"></ul>
		                <div id="biuuu_city"></div>
		            </div> 
		        </div>
		    </div>
		    <div class="pop addMeterialPop">
		        <div class="popBg"></div>
		        <div class="smallLayel">
		            <h3>新增物料</h3>
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="input-item">
		                        <p class="topItem">一级物料</p>
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
		                        <p>物料名称</p>
		                        <input type="text" value="">
		                    </div>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="input-item">
		                        <p>物料规格</p>
		                        <input type="text" value="">
		                    </div>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="input-item">
		                        <p>型号</p>
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
	</div>
</div>
</body>
</html>