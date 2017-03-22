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
    <title>我的订单</title>
</head>
<body>
<div style=" text-align:center">
	<jsp:include page="../include/left.jsp"><jsp:param value="finance_list" name="checkLefr"/><jsp:param value="${info.level }" name="userLevel"/></jsp:include>
	<input type="hidden" name="pageNo" id="pageNo" value=""/>
	<!-- <div class="addBtn"><i></i></div> -->
	<div class="right-box">
		<div class="right-part">
		    <div class="box-top"> </div>
		    <div class="wrap">
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
		                <tr class="text-indent">
		                    <td>流水号</td>
		                    <td>时间</td>
		                    <td>交易类型</td>
		                    <td>收入</td>
		                    <td>支出</td>
		                    <td>状态</td>
		                </tr>
		            </thead>
		            <tbody>
		             <c:forEach items="${ dataList}" var="item" varStatus="vs">
		                <tr class="text-indent">
		                    <td class="p_r">
		                        <i class="icon_1"></i>
		                        <span class="a1 bold _height">${item.payNumber }</span>
		                    </td>
		                    <td>
		                        <span class="bold"><fmt:formatDate value="${item.createDateTime }" pattern="yyyy-MM-dd"/></span>
		                    </td>
		                    <td>
		                        <p>
		                            <c:choose>
		                              <c:when test="${item.type==1 }">下单购物</c:when>
		                              <c:when test="${item.type==2 }">购买邀请码</c:when>
		                              <c:when test="${item.type==3 }">返利</c:when>
		                              <c:when test="${item.type==4 }">提现</c:when>
		                              <c:when test="${item.type==5 }">充值</c:when>
		                              <c:when test="${item.type==6 }">邀请码退回</c:when>
		                              <c:when test="${item.type==7 }">退货</c:when>
		                              <c:otherwise>未知</c:otherwise>
		                            </c:choose>
		                      </p>
		                    </td>
		                    <td>
		                        <p>
		                            <c:choose>
		                                  <c:when test="${item.type==1 }"></c:when>
		                                  <c:when test="${item.type==2 }"></c:when>
		                                  <c:when test="${item.type==3 }"><fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/></c:when>
		                                  <c:when test="${item.type==4 }">
		                                    <c:if test="${item.status==-1 }">
		                                          <fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/>
		                                        </c:if>
		                                  </c:when>
		                                  <c:when test="${item.type==5 }"><fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/></c:when>
		                                  <c:when test="${item.type==6 }"><fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/></c:when>
		                                  <c:when test="${item.type==7 }"></c:when>
		                                  <c:otherwise>未知</c:otherwise>
		                              </c:choose>
		                      </p>
		                    </td>
		                    <td>
		                        <p>
		                            <c:choose>
		                                <c:when test="${item.type==1 }"><fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/></c:when>
		                                <c:when test="${item.type==2 }"><fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/></c:when>
		                                <c:when test="${item.type==3 }"></c:when>
		                                <c:when test="${item.type==4 }">
		                                  <c:if test="${item.status==0 }">
		                                    <fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/>
		                                  </c:if>
		                                  <c:if test="${item.status==1 }">
		                                    <fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/>
		                                  </c:if>
		                                </c:when>
		                                <c:when test="${item.type==5 }"></c:when>
		                                <c:when test="${item.type==6 }"></c:when>
		                                <c:when test="${item.type==7 }"><fmt:formatNumber value="${item.money}" type="currency" maxFractionDigits="2" minFractionDigits="2"/></c:when>
		                                <c:otherwise>未知</c:otherwise>
		                              </c:choose>
		                      </p>
		                    </td>
		                    <td>
		                        <p class="blue link _content_">
		                            <c:choose>
		                                <c:when test="${item.type==4 }">
		                                  <c:if test="${item.status==-1 }">拒绝提现</c:if>
		                                  <c:if test="${item.status==0 }">已申请</c:if>
		                                      <c:if test="${item.status==1 }">已同意</c:if>
		                                </c:when>
		                              <c:otherwise></c:otherwise>
		                            </c:choose>
		                      </p>
		                    </td>
		                </tr>
		               </c:forEach> 
		            </tbody>
		        </table>
		            <c:if test="${pager.pages>1 }">
		            <div class="list-page list-inherit">
		                <c:if test="${pager.hasPreviousPage }">
		                    <a class="prev" href="${url }${pager.pageNumber-1}"></a>
		                </c:if>
		                <c:if test="${pager.start-1>0 }">
		                    <a href="${url }1">1</a>
		                </c:if>
		                <c:if test="${pager.hasBeforPoint }">
		                    ...
		                </c:if>
		                <div class="list-page-num">
		                    <c:forEach items="${pager.navigatePageNumbers }" var="item">
		                        <a class="${item==pager.pageNumber?'current':'' }" href="${url }${item }">${item }</a>
		                    
		                    </c:forEach>
		                </div>
		                <c:if test="${pager.hasAfterPoint }">
		                    ...
		                </c:if>
		                <c:if test="${ pager.hasNextPage}">
		                    <a class="next" href="${url }${pager.pageNumber+1}"></a>                        
		                </c:if>
		            </div>
		        </c:if>
		        </div>
		         <div class="boxP p_f">
		            <div class="wrap_listb" style="margin-top:0;display:none" >
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
		                <div>
		                    <button id="withdraw" class="withdraw">提现</button>
		                </div>
		            </div>
		             <div class="wrap_listb">
		                <div class="_right_title">
		                  <p>首批提货款</p>
		                </div>
		                <div class="_right_text">
		                    <p class="bold text-left">${info.firstGoodsMoneyBalance }</p>
		                    <a href="/u/firstGoodsRecord.html?id=${info.id }">记录详情</a>
		                </div>
		            </div>
		            <div class="wrap_listb Coupon">
		                <div class="_right_title">
		                  <p>优惠券</p>
		                </div>
		                <div class="_right_text">
		                   <p class="freeze_money">冻结：${info.freezeCoupon }</p>
		                   <p class="unfreeze_money">可用：${info.unfreezeCoupon }</p>
		                   <a href="/u/couponRecord.html?id=${info.id }">记录详情</a>
		                </div>
		            </div>
		            <div class="wrap_listb Coupon">
		                <div class="_right_title">
		                  <p>保证金</p>
		                </div>
		                <div class="_right_text">
		                   <p class="freeze_money">总额：${info.bondMoney }</p>
		                   <p class="unfreeze_money">待返还：${info.bondMoneyBalance }</p>
		                   <a href="/u/bondRecord.html?id=${info.id }">记录详情</a>
		                </div>
		            </div>
		            <div class="wrap_listb Coupon">
		                <div class="_right_title">
		                  <p>销售额</p>
		                </div>
		                <div class="_right_text">
		                   <p class="freeze_money">总销售额：${info.saleTotalMoney }</p>
		                   <a href="/u/saleRecordList.html?id=${info.id }">记录详情</a>
		                </div>
		            </div>
		            <c:if test="${info.level!=4 }">
		            	<div class="wrap_listb Coupon">
		                	<div class="_right_title">
		                  		<p>返利金额</p>
		                	</div>
		                	<div class="_right_text">
		                   		<p class="freeze_money">返利金额：${info.rebateMoney }</p>
		                   		<a href="/u/rebateRecord.html?id=${info.id }">记录详情</a>
		                	</div>
		            	</div>
		            </c:if>
		        </div>  
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
    /*  $(document).on('focus','#cach', function() {
        $(this).prev("p").css('bottom', '30px');
     });
     $(document).on('focus','#pwd', function() {
        $(this).prev("p").css('bottom', '30px');
     });
     $(document).on('blur','#cach', function() {
        var _htmlc=$(this).val();
            if (_htmlc=="") {
                $(this).prev("p").css('bottom', '0');
            }else{
                $(this).prev("p").css('bottom', '30px');
            }
        });
      $(document).on('blur','#pwd', function() {
        var _htmlc=$(this).val();
            if (_htmlc=="") {
                $(this).prev("p").css('bottom', '0');
            }else{
                $(this).prev("p").css('bottom', '30px');
            }
        });
       */
     $(document).on('click', '#-btnb', function() {
        layer.closeAll('page');
     }); 
     
     $(document).on('click', '#-btna', function() {
      var money = $("#money").val();
      var lowestMoney = $("#lowestMoney").val();
      var cach = $("#cach").val();
      var pwd = $("#pwd").val();
      if(cach == null || cach ==undefined || cach == ''){
         alert("提现金额不可为空！");
         return false;
      }
      var r = /^\d+(\.\d+)?$/;//非负浮点数（正浮点数 + 0）
      if(!r.test(cach)){  
            alert("提现金额只支持非负浮点数!");
            return false;
        }
      if(pwd == null || pwd ==undefined || pwd == ''){
         alert("密码不可为空！");
         return false;
        }
      var newM = money-cach;
      //如果经过提现后的金额小于最小额度不允许提现
      if(money==0){
          alert("0元不可提现，最少提现金额为500");
          return false;
        }
      if(money<500){
          alert("提现金额小于500，不允许提现");
          return false;
      }
      if(newM<lowestMoney){
        alert("提现后的金额小于设置的最小额度不允许提现！");
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