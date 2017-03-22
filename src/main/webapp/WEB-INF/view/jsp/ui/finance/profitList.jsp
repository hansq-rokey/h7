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
    <script type="text/javascript" src="/plug/jQuery/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="/plug/bootstrap/bootstrap.min.js"></script>
  <script type="text/javascript" src="/plug/bootstrap/moment.js"></script>
  <script type="text/javascript" src="/plug/bootstrap/daterangepicker.js"></script>
  <script type="text/javascript" src="/plug/layer/layer.js"></script>  
  <script type="text/javascript" src="/js/area.js"></script>
  <script type="text/javascript" src="/js/location.js"></script>
  <script type="text/javascript" src="/js/common.js"></script>
    <title>财务</title>
    <script type="text/javascript">
        function showPage(number){
            window.location.href="/u/finance/profitList.html?pageNo="+number;
        }
    </script>
</head>
<body>
<div style=" text-align:center">
	<jsp:include page="../include/left.jsp"><jsp:param value="profitList_list" name="checkLefr" /><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
	<div class="right-box">
		<div class="right-part">
		<input type="hidden" name="pageNo" id="pageNo" value=""/>
		    <div class="box-top"> </div>
		    <div class="wrap" style="margin-top:-55px;">
		       <!--财务筛选-->
		      <!--  <div class="input-list">暂时隐藏
		           <input type="text" placeholder="订单号">
		           <span class="search-icon ripple-event"></span>
		            <div class="setDateBox">
		               <input type="text" name="daterange" class="daterange">
		               <i class="select-arrow"></i>
		               <i class="date-icon"></i>
		           </div>
		           <div class="selectinput">
		               <i class="select-arrow"></i>
		               <i class="menu-icon"></i>
		               <span class="selectvalue"></span>
		               <ul class="opation" style="display: none;">
		                   <li>下拉一下拉一下拉一</li>
		                   <li>下拉er下拉er下拉er</li>
		                   <li>下拉三下拉三下拉三</li>
		                   <li>下拉四下拉四下拉四</li>
		               </ul>
		           </div>
		       </div>   -->
		
		       <div class="wrap_list wrap_lista">
		           <table class="table-responsive table_box">
		               <thead>
		                   <tr class="p_r">
		                       <td>流水号/订单号</td>
		                       <td>时间</td>
		                       <td>下单类型</td>
		                       <td>利润</td>
		                      <!--  <td>支出</td> -->
		                       <td>状态</td>
		                   </tr>
		               </thead>
		               <tbody>
		                <c:forEach items="${orderList}" var="orderItem" varStatus="vs">
		                   <tr>
		                       <td  class="p_r">
		                           <i class="icon_1"></i>
		                           <span class="a1 bold _height">${orderItem.orderNumber }</span>
		                       </td>
		                       <td>
		                           <span class="bold"><fmt:formatDate value="${orderItem.createDateTime }" pattern="yyyy-MM-dd"/></span>
		                       </td>
		                       <td>
		                            <c:if test="${orderItem.orderType==1 }">
		                               <p>店铺订单</p>
		                           </c:if>
		                           <c:if test="${orderItem.orderType==2 }">
		                               <p>邀请码订单</p>
		                           </c:if>
		                           <c:if test="${orderItem.orderType==3 }">
		                               <p>下级4s店订单</p>
		                           </c:if>
		                           <c:if test="${orderItem.orderType==4 }">
		                               <p>C端下单</p>
		                           </c:if>
		                       </td>
		                       <td>
		                           <p>${orderItem.profit }</p>
		                       </td>
		                       <td>
		                             <p class="b_list">
		                               <c:choose>
		                                   <c:when test="${orderItem.status==10 }"><span>未付款</span></c:when>
		                                   <c:when test="${orderItem.status==20 }">已付款</c:when>
		                                   <c:when test="${orderItem.status==30 }">配货中</c:when>
		                                   <c:when test="${orderItem.status==40 }">已发货</c:when>
		                                   <c:when test="${orderItem.status==50 }">交易成功</c:when>
		                                   <c:when test="${orderItem.status==60 }"><span style="color:red">订单关闭</span></c:when>
		                                   <c:when test="${orderItem.status==70 }">售后中</c:when>
		                                   <c:when test="${orderItem.status==22 }">定制确认</c:when>
		                                   <c:when test="${orderItem.status==24 }">面板打印中</c:when>
		                                   <c:when test="${orderItem.status==26 }">定制中</c:when>
		                                   <c:when test="${orderItem.status==28 }">已入库</c:when>
		                               </c:choose>
		                             </p>
		                       </td>
		                   </tr>
		                </c:forEach>
		               </tbody>
		           </table>
		           <jsp:include page="../include/pages.jsp"></jsp:include>
		       </div>
		       <c:if test="${info.level==1 }">
		        <div class="boxP">
		           <div class="wrap_listb" style="margin-top:0">
		               <div class="_right_title">
		                 <p>财务概述</p>
		               </div>
		               <div class="_right_text _hr">
		                   <p class="bold">${sureProfit}</p>
		                   <p class="bold">账户余额</p>
		               </div>
		               <div class="_right_text _height">
		                   <p class="bold">${totalProfit}</p>
		                   <p class="bold">待确认余额</p>
		               </div>
		               <div class="withdraw-box">
		                   <button id="withdraw" class="withdraw">提现</button>
		               </div>
		           </div>
		            <div class="wrap_listb" style="margin-top:20;display:none">
		               <div class="_right_title">
		                 <p>首批提货款</p>
		               </div>
		               <div class="_right_text">
		                   <p class="bold">${info.firstGoodsMoneyBalance }</p>
		                   <p class="bold">剩余提货款</p>
		               </div>
		           </div>
		       </div>  
		       </c:if>
		   </div>
		   <input type="hidden" id="money" value="${sureProfit}"/>
		   <input type="hidden" id="lowestMoney" value="${info.lowestMoney }"/>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('input[name="daterange"]').daterangepicker();
    });
    $("#withdraw").on('click', function(event) {
    var aa='<div class="w_title">';
        aa+='<h3>申请提现</h3>';
        aa+='<div class="_wmoney"><input type="text"  name="money" class="money" id="cach" placeholder="提现金额"></div>';
        aa+='<div class="_wpassword"><input type="password" name="password" class="password" id="pwd" placeholder="提现密码"></div>';
        aa+='<div class="_wbtn"><a id="-btna" class="_won" href="javascript:void(0);">提现</a> <a id="-btnb" href="###">取消</a></div>';
        aa+='</div>';
    layer.open({
       type: 1,
       title: false,
       closeBtn: 0,
       area: ['400px', '300px'],
       shadeClose: true,
       skin: 'yourclass',
       content:aa,
  });
});
$(function(){
     $(document).on('click', '#-btnb', function() {
        layer.closeAll('page');
     }); 
     
     $(document).on('click', '#-btna', function() {
      var money = $("#money").val();
      var lowestMoney = $("#lowestMoney").val();
      var cach = $("#cach").val();
      var pwd = $("#pwd").val();
      if(cach == null || cach ==undefined || cach == ''){
    	  layer.msg("提现金额不可为空");
         return false;
      }
      var r = /^\d+(\.\d+)?$/;//非负浮点数（正浮点数 + 0）
      if(!r.test(cach)){  
    	  layer.msg("提现金额只支持非负浮点数!");
            return false;
        }
      if(pwd == null || pwd ==undefined || pwd == ''){
    	 layer.msg("密码不可为空！");
         return false;
        }
      var newM = money-cach;
      //提现金额为0或者提现金额小于500，不允许提现
      if(cach==0 || cach<500){
    	  layer.msg("0元不可提现，最少提现金额为500");
          return false;
        }
    //如果经过提现后的金额小于最小额度不允许提现
      if(newM<lowestMoney){
    	  layer.msg("提现后的金额小于设置的最小额度不允许提现！");
        return false;
      }
      $.ajax({
              url: "/u/finance/getCash.html",
              type: "POST",
              data:{money:cach,password:pwd},
              dataType: "json",
              async: false,
              success: function (obj) {
                if ( obj.code == 1 ) {
                  alert(obj.message);
            return;
            }
                if ( obj.code == 0 ) {
            //获取登陆用户成功之后给值
            alert("提现成功!");
            $("#cach").val('');
            $("#pwd").val('');
            layer.closeAll('page');
            //$(".searchOrder").click();
          }
        }
     });
  });
}) 
</script>
<style>
.icon_1,.icon_2,.icon_3{
	left:-30px;
}
</style>
</body>
</html>