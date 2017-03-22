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
	<script type="text/javascript" src="/plug/laypage/laypage.js"></script>
	<script type="text/javascript" src="/js/area.js"></script>
	<script type="text/javascript" src="/js/location.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
    <title>合伙人订单列表</title>
  <script type="text/javascript">
    	function showPage(number){
    		var id = $("#infoId").val();
    		window.location.href="/u/merchant/ssssOrderList.html?pageNo="+number+"&id="+id;
    	}
    </script>
</head>
<body>
<jsp:include page="../include/left.jsp"/>
<!-- <div class="addBtn"><i></i></div> -->
<input type="hidden" name="pageNo" id="pageNo" value=""/>
<input type="hidden" name="infoId" id="infoId" value="${ssssInfo.id }"/>
<div class="right-part">
    <div class="right-top">
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
     <!--    <div class="tab-list">
         <ul>
             <li class="on ripple-event">物料</li>
             <li class="ripple-event">类目设置</li>
         </ul>
     </div> -->
    </div>
    <div class="right-bottom">
        <div class="content">
            <div class="row content-title">
                <div class="col-lg-2 col-md-2 col-sm-2 ">订单号/时间</div>
                <div class="col-lg-2 col-md-2 col-sm-2 ">产品数量</div>
                <div class="col-lg-3 col-md-3 col-sm-3">利润/金额</div>
                <div class="col-lg-3 col-md-3 col-sm-3">订单状态</div>
                <div class="col-lg-2 col-md-2 col-sm-2 ">操作</div>
            </div>
           <div class="box_min">
           	<c:forEach items="${dataList}" var="item" varStatus="vs">
	            <div class="row ${vs.count%2==0?'even':'' }">
	                <div class="col-lg-2 col-md-2 col-sm-2 _wrap1">
	                	<c:choose>
	                		<c:when test="${item.source==1 }"> <i class="icon_1"></i></c:when>
	                		<c:when test="${item.source==2 }"> <i class="icon_2"></i></c:when>
	                		<c:when test="${item.source==3 }"> <i class="icon_3"></i></c:when>
	                	</c:choose>
	                    <span class="a1 bold">${item.orderNumber }</span>
	                    <span> <i class=" icon iconfont _margin icon-shijian"></i><fmt:formatDate value="${item.createDateTime }" pattern="yyyy.MM.dd"/></span>
	                </div>
	                <div class="col-lg-2 col-md-2 col-sm-2 _wrap1">
	                    <p>${item.orderNum }</p>
	                </div>
	                <div class="col-lg-3  col-md-3  col-sm-3 _wrap1">
	                    <span class="bold red"><fmt:formatNumber value="${item.profit }" pattern="#.##" /></span>
	                    <span><fmt:formatNumber value="${item.orderTotalMoney }" pattern="#.##" /></span>
	                </div>
	                <div class="col-lg-3 col-md-3  col-sm-3  _wrap1">
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
	                </div>
	                <div class="col-lg-2 col-md-2 col-sm-2 _wrap1">
	                    <p class="blue link _content_"><a href="/u/merchant/ssssOrderDetail.html?orderNumber=${item.orderNumber }">详情</a></p>
	                </div>
	            </div>
           	</c:forEach>
           </div>
         </div>
             <!--page-->
            <div class="_page">
                <ul id="biuuu_city_list"></ul>
                <div id="biuuu_city"></div>
            </div>
            <jsp:include page="../include/pages.jsp"></jsp:include>
        </div>
    </div>

<script type="text/javascript">
    $(document).ready(function() {
        $('input[name="daterange"]').daterangepicker();
    });
</script>
<script type="text/javascript">
    // 模板
    var _temp = ['<div class="marker" id="marker">',
        '<div class="d-mask"></div>',
        '<div class="dialogWrap">',
        ' <div class="dialog">',
        ' <h2>删除地址<a href="javascript:;" class="close" onclick="hideDialog()"></a></h2>',
        '<div class="tac"><i class="question-mark"></i></div>',
        '<p class="question-sure-text">是否确认删除该地址？</p>',
        '<div class="question-dialog-btn tac">',
        '<a data-btn="ok" class="new-orange-btn" href="javascript:;">确认</a>',
        '<a onclick="hideDialog()" class="cancel" href="javascript:;">取消</a>',
        '</div>',
        '</div>',
        '</div>',
        '</div>'].join('');
    // 交互接口
    var settings = {
        // 删除地址接口
        delAddressFn: function(_data, fn){
            /*$.ajax({
             type: "POST",//请求方式
             url: "url",//请求地址
             data: _data,//参数
             dataType: "text",// 接收数据的格式
             success: function (data) {
             fn(data);
             },//成功后启动的回调函数
             error: function () {
             fn(data);
             },
             cache: false//缓存
             });*/
            // 模拟数据及回调
            var d = {
                "status": 1 // 1成功 0失败
            };
            fn(d);// 异步成功模拟回调函数
        },
        // 编辑地址
        editAddressFn: function(data, fn){
            console.log(data);

            fn(1);//异步处理成功后回调
        },
        // 添加新地址接口
        addAddressFn: function(data, fn){
            console.log(data);

            fn(1);//异步处理成功后回调
        }
    };
    // Ready
    $(document).ready(function() {
        showLocation();
        // 删除
        $('#address-mian').off('click.del').on('click.del', '.address-del', function(){
            var _this = $(this),// 当前按钮
                    $parent = _this.closest('.address'),// 父级元素
                    _id = _this.attr('data-id'),// 数据Id
                    $marker = $("#marker");// 弹窗
            if ($marker.length === 0) {
                $('body').append(_temp);// 插入模板
            }else{
                $marker.show();// 显示弹窗
            }
            $('a[data-btn="ok"]').off('click').on('click', function(){
                settings.delAddressFn(_id, function(data){
                    if (data.status == 1) {
                        $("#marker").hide();// 隐藏弹窗
                        $parent.hide();// 隐藏删除项
                    }else{
                        alert("删除失败!");// 错误提示
                    }
                });
            });
        });
        // 编辑
        $('#address-mian').off('click.edit').on('click.edit', '.address-edit', function(){
            var _this = $(this),// 当前按钮
                    _id = _this.attr('data-id'),// 数据Id
                    _$parent = _this.closest('.address'),// 父级元素
                    adreeName = _$parent.find('.adree-name').text(),// 名称
                    pro = _$parent.find('span[pro]').attr('pro'),//
                    cit = _$parent.find('span[cit]').attr('cit'),//
                    tow = _$parent.find('span[tow]').attr('tow'),//
                    adreeTele = _$parent.find('.adree-tele').text(),//电话
                    street = _$parent.find('.street').text();// 详细
            _$parent.find('[value="'+ pro +'"]').trigger('click');// 模拟触发
            _$parent.find('[data-txt="name-txt"]').val(adreeName);// 姓名
            _$parent.find('[value="'+ cit +'"]').trigger('click');// 模拟触发
            _$parent.find('[data-txt="hone-txt"]').val(adreeTele);// 电话
            _$parent.find('[value="'+ tow +'"]').trigger('click');// 模拟触发
            _$parent.find('[data-txt="adre-txt"]').val(street);// 地址
            _$parent.addClass('address-add');// 添加标记
            _$parent.find('.editdiv-box').animate({height: 500, opacity: 'show'}, 200);// 动画显示
            _$parent.siblings('.address').removeClass('address-add').find('.editdiv-box').hide();
        });
        // 取消编辑
        $('#address-mian').off('click.qedit').on('click.qedit', '.cancel-edit', function(){
            var _this = $(this),
                    _$parent = _this.closest('.address');
            _$parent.removeClass('address-add').find('.editdiv-box').animate({height: 240, opacity: 'hide'}, 100);// 动画显示
            return false;
        });
        // 提交编辑
        $('#address-mian').off('click.submit').on('click.submit', 'a[data-btn="ok_btn"]', function(){
            var _this = $(this),
                    _$parent = _this.closest('.address'),
                    _neme = _$parent.find('[data-txt="name-txt"]').val() || '',
                    _phone = _$parent.find('[data-txt="hone-txt"]').val() || '',
                    _regional1 = _$parent.find('em.txt').eq(0).attr('value') || '',
                    _regional2 = _$parent.find('em.txt').eq(1).attr('value') || '',
                    _regional3 = _$parent.find('em.txt').eq(2).attr('value') || '',
                    pval = _$parent.find('em.txt').eq(0).text() || '',
                    cval = _$parent.find('em.txt').eq(1).text() || '',
                    tval = _$parent.find('em.txt').eq(2).text() || '',
                    _street = _$parent.find('[data-txt="adre-txt"]').val() || '',
                    _postCode = _$parent.find('[data-txt="post"]').val() || '',
                    _label = _$parent.find('[data-txt="label"]').val() || '',
                    _id = _$parent.find('a.address-edit').attr('data-id') || '',
                    _data = {
                        "id": _id,
                        "name": _neme,
                        "phone": _phone,
                        "regional": _regional1 + '-' + _regional2 + '-' + _regional3,
                        "street": _street,
                        "postCode": _postCode,
                        "label": _label
                    };
            if (undefined == _id) {
                settings.addAddressFn(_data, function(d){
                    if (1 == d){
                        window.location.reload();
                    };
                });
            }else{
                settings.editAddressFn(_data, function(d){
                    if (1 == d){
                        _$parent.find('.adree-name').text(_neme);
                        _$parent.find('.adree-tele').text(_phone);
                        _$parent.find('span[pro]').attr('pro', _regional1).text(pval);
                        _$parent.find('.street').text(_street)
                        _$parent.find('span[cit]').attr('cit', _regional2).text(cval);
                        //_$parent.find('[data-txt="post"]').val(_postCode)
                        _$parent.find('span[tow]').attr('tow', _regional3).text(tval);
                        //_$parent.find('[data-txt="label"]').val(_label)
                        _$parent.find('.editdiv-box').animate({height: 240, opacity: 'hide'}, 100);
                    };
                });
            }

        });
        // 添加地址
        $('#address-mian').off('click.adds').on('click.adds', 'div[data-btn="addres-btn"]', function(){
            var _this = $(this),// 当前按钮
                    _$parent = _this.closest('.address');// 父级元素
            _$parent.addClass('address-add').find('.editdiv-box').animate({height: 500, opacity: 'show'}, 200);// 动画显示
            _$parent.siblings('.address').removeClass('address-add').find('.editdiv-box').hide();
        });
    });
    // 文本框只能输入数字// 数字锁键
    var $numTxtBox = $('input[data-txt="hone-txt"], input[data-txt="post"]');// 锁键状态
    $numTxtBox.keydown(function(e){// 绑定事件
        var oEvent = e || window.event;// 兼容处理
        if(!(oEvent.keyCode==46)&&!(oEvent.keyCode==8)&&!(oEvent.keyCode==9)&&!(oEvent.keyCode==37)&&!(oEvent.keyCode==39))// 键值
            if(!((oEvent.keyCode>=48&&oEvent.keyCode<=57)||(oEvent.keyCode>=96&&oEvent.keyCode<=105))) // 键值
                return false;
        //oEvent.returnValue = false; // firefox 兼容问题
    });
    function hideDialog(){
        $("#marker").hide();
    };
</script>
</body>
<style type="text/css">
.icon_1,.icon_2,.icon_3{
   left:5px;
}
</style>
</html>