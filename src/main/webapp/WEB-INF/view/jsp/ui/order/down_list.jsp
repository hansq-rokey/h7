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
    <title>下级代理列表</title>
    <script type="text/javascript">
        function showPage(number){
            window.location.href="/u/merchant/cityList.html?pageNo="+number;
        }
    </script>
</head>
<body>
<div style=" text-align:center">
	<jsp:include page="../include/left.jsp"><jsp:param value="agent_list" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
	<input type="hidden" name="pageNo" id="pageNo" value=""/>
	<div class="right-box">
		<div class="right-part">
		 <div class="box-top"> </div>
		  <div class="right-bottom">
		      <div class="content">
		         <table class="table-responsive table_box ">
		               <tr>
                    	<th class="t-c">账号</th>
                    	<th class="t-c">名称</th>
                    	<th class="t-c">类型</th>
                    	<th class="t-c">上级代理</th>
                    	<th class="t-c">销售额</th>
                    	<th class="t-c">操作</th>
                	   </tr>
		                <c:forEach items="${citys }" var="item" varStatus="vs">
		                  <tr class="text-indent">
		                      <td  class="table_w30 p_r">
		                          <span class="a1 bold order_firstbox">${item.linkTel}</span>
		                      </td>
		                      <td  class="table_w17">
		                          <p>${item.cityMerchantName}</p>
		                      </td>
		                      <td class="table_w17">
		                      	<c:forEach items="${typeNames }" var="name">
                    				${name.dictCodeValue==item.level?name.dictCodeName:"" }
                    			</c:forEach>
		                      </td>
		                      <td class="table_w17">
		                      	${item.parentName }
		                      </td>
		                       <td class="table_w17">
		                      	${item.saleTotalMoney }
		                      </td>
		                      <td class="table_w17">
		                          <p class="blue link _content_"><a class="_margin0" href="/u/merchant/cityDetail.html?id=${item.id }">详情</a></p>
		                      </td>
		                  </tr> 
		                </c:forEach>    
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