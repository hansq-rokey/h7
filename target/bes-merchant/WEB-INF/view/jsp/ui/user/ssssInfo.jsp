<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<script type="text/javascript" src="/plug/layer/layer.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
    <title>账户信息</title>
</head>
<body>
<jsp:include page="../include/left.jsp"/>
<!-- <div class="addBtn"><i></i></div> -->
<div class="right-part">
 <div class="box-top"> </div>
    <div class="wrap" style="margin-top:50px">
       <div class="m_content">
           <div class="m_box">
               <div class="m_tag">
                   <h3>熊爸爸代理商</h3>
                   <div class="m_hr"></div>
               </div>
            <div class="row m_margin">
                <div class="col-lg-6">
                    <p class="_usr _usra">
                        <i class="icon iconfont icon-xingming m_color"></i>
                    </p>
                    <p class="bold m_font">${info.linkMan }</p>
                    <p class="m_font1">${info.linkTel }</p>
                </div>
                <div class="col-lg-6" style="display:none">
                   <p class="_usr _usrb">
                        <i class="icon iconfont icon-suo m_color"></i>
                    </p>
                    <p class="bold m_font">服务站</p>
                    <p class="m_font1"></p>
                </div>
                <div class="col-lg-6">
                     <p class="_usr _usrc">
                        <i class="icon iconfont icon-dingwei m_color"></i>
                    </p>
                    <p class="bold m_font">${info.provinceName } ${info.cityName } ${info.countyName }</p>
                    <p class="m_font1">${info.cityMerchantAddress }</p>
                </div>
            </div>
            <div class="t_wrap">
                <p class="m_xx">点击银行卡查看银行卡的详细信息</p>
               <div class="bank_cc">
                    <div class="t_img t_img1">
                         <div class="img-bg"><img src="/images/Bankbg_03.png" width="100%" height="100%"></div>
                         <p class="t_yx1">${info.bankName }</p>
                         <p class="t_yx2">${info.bankAddress }</p>
                         <p class="t_yx3">${info.bankNumber }</p>
                         <p class="t_yx4">${info.bankAccountName }</p>
                         <p class="t_yx5">${info.identityCard }</p>
                    </div>
                     <div class="t_img t_img2">
                         <div class="img-bg"><img src="/images/BankBg_05.png"></div>
                         <h3 class="t_yx6">管辖区域</h3>
                         <div class="t_yx7">
                         	<c:forEach items="${areas }" var="item">
	                            <span>${item.areaName }</span>                         	
                         	</c:forEach>
                         </div>
                    </div>
                </div>    
           </div>
       </div>
    </div>
  </div>
</div>
<script type="text/javascript">  
  $(document).on('click', '.m_xx', function(event) {
    var aa='<div class="w_title">';
        aa+='<h3>查看详情</h3>';
        aa+='<div class="_wmoney" style="margin:50px 0;"><p>密码</p><input type="password" name="t-password" class="t-password" id="t-password"><span class="t_error" style="display:none">密码错误，请重新输入</span></div>';
        aa+='<div class="_wbtn"><a id="-btna" class="_won" href="###">查看</a> <a id="-btnb" href="###">取消</a></div>';
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
  $(document).on('focus', '.t-password', function() {
       $(this).prev("p").css('bottom', '30px');
  });
  $(document).on('blur','.t-password', function() {
        var _htmlc=$(this).val();
            if (_htmlc=="") {
                $(this).prev("p").css('bottom', '0');
            }else{
                $(this).prev("p").css('bottom', '30px');
            }
        });
   $(document).on('click', '#-btnb', function() {
        layer.closeAll('page');
     }); 
   $(document).on('click', '#-btna', function() {
      /*  var t_data="622262  0172555551259";//数据
       layer.closeAll('page');
       $(".t_yx3").html(t_data); */
       var password = $("#t-password").val();
       console.log(password);
       $.ajax({
    	   url:"/u/user/show.html",
    	   type:"POST",
    	   data:{"password":password},
    	   dataType:"JSON",
    	   success:function(data){
    		   if(data.success){
    			   layer.closeAll('page');
    		       $(".t_yx3").html(data.result.bankNumber);
    		       $(".t_yx5").html(data.result.identityCard);
    		   }else{
    			   $(".t_error").html(data.message).show();
    		   }
    	   }
       });
       
   });
    $(".t_img").hover(function() {
      $(".m_xx").fadeIn(500);
  });
</script>
</body>
</html>