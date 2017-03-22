<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>熊爸爸</title>
    <meta name="keywords" content="熊爸爸,供暖 ,暖魔方,暖气,白熊,智能取暖器,智能家居,浴霸,浴室,室内取暖设备,新型取暖设备,取暖app,德国进口,白熊科技"/>
	<meta name="description" content="熊爸爸致力于打造室内环境智能产品集成平台，结合互联网＋硬件，为全球用户创造一个健康和舒适的生活环境，以高科技、高品质、智能化的产品和贴心极致的售后服务为用户缔造全新的生活空间，引领健康新生活。"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/shop/css/index.css" rel="stylesheet" type="text/css">
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/shop/js/index.js" type="text/javascript" ></script>
    <link rel="icon" href="http://fe.ibaixiong.com/shop/image/xLogin.ico"	mce_href="http://fe.ibaixiong.com/shop/image/xLogin.ico"	type="image/x-icon">
    <script>
	$(document).ready(function() {
	$.ajax({
		   url: "/user/info.html",
		   type: "get",
		   dataType:"json",
		   cache:false,
		   success: function(obj){
			 	if ( obj.result.loginstatus == true ) {
					//获取登陆用户成功之后给值
					$("#userInfo").show();
					$("#loginInfo").hide();
					var nick=obj.result.name;
					if(nick==null)
						nick ="白熊";
					$("#userName").text(nick);
				}
		   }
		});
	});
	</script>
</head>
<body>

<header>
    <div class="navbox">
        <a href="http://www.ibaixiong.com"><img src="http://fe.ibaixiong.com/common/image/logo01.png" class="indexlogo"></a>
        <img src="http://fe.ibaixiong.com/common/image/logo02.png" class="indexlogo white-logo">
        <ul class="headnav">
			<li id="userInfo" style="display: none;">
				<a href="/u/order/list.html" id="userName" style="width: 80px;overflow: hidden;padding: 0;height: 100px;float: left;    text-overflow:ellipsis;white-space:nowrap;"></a>
				<a href="/logout.html">退出</a>
			</li>
            <li id="loginInfo">
            	<a href="http://login.ibaixiong.com/login?service=http://www.ibaixiong.com/sso" class="loginlink">登录</a>
            	<span>|</span>
            	<a href="http://user.ibaixiong.com/register.html" class="registerlink">注册</a>
            </li>
            <li><a href="/u/car/list.html">购物车</a> </li>
            <li><a href="http://bbs.ibaixiong.com">社区</a> </li>
            <li class="prodhover"><a href="#">产品</a> 
            	<div  class="prodbox">
                    <div class="prodlist">
                        <div class="prodliatbox">
                            <a href="/bathroom/overview.html#top">
                            <img src="http://fe.ibaixiong.com/shop/images/logo-bath.png">
                            <p>浴室款</p>
                            </a>
                        </div>
                        <div class="prodliatbox">
                            <a href="/bedroom/overview.html#top" target="_blank">
                            <img src="http://fe.ibaixiong.com/shop/images/logo-room.png">
                            <p>壁挂款</p>
                            </a>
                        </div>
                    </div>
                </div>
            </li>
            <li><a href="http://www.ibaixiong.com">首页</a> </li>
        </ul>
    </div>
</header>
<div class="sliders">
    <div class="slider-wrap">
        <div class="slider slider1 curslider">
            <div class="button-wrapper" style="margin-top:470px;">
            	<div class="linkdiv buydiv" style="margin-left: 580px;"><a href="/product/52.html" class="buynowbath">立即购买</a><span class="bathbuynowspan"></span></div>
                <div class="linkdiv seediv" style="margin-left: 0px;"> <a href="/bathroom/overview.html#top" target="_blank" class="seedetailsbath">了解详情</a><span class="seedetailsspanbath"></span></div>
        	</div>
        </div>
        <div class="slider slid                        er2">
              <p class="button-wrapper" style="margin-top:450px;font-size:16px;"><span class="bath-price"><span style="color:#ff6200;">￥</span><span class="strong" style="color:#ff6200;">3999元</span>  起</span> </p>
            <div class="button-wrapper">
                 <div class="linkdiv seediv-bath"> <a href="/product/52.html" class="seedetails-bath">立即购买</a><span class="seedetailsspan-bath"></span></div>
                 <div class="linkdiv buydiv-bath"><a href="/bedroom/overview.html#top" target="_blank" class="buynow-bed">了解详情</a><span class="buynowspan-bath"></span></div>
            </div>
        </div>
        <div class="slider slider3">
            <div class="button-wrapper" style="margin-top:335px;font-size:16px;">              
            	<span class="wall-price"><span style="color:#764b20;">￥</span><span class="strong" style="color:#764b20;">3999</span>  元/台</span> 
                 <div class="linkdiv seediv-wall" style="margin-left: 20px;"> <a href="/product/52.html" class="seedetails-wall">立即购买</a><span class="seedetailsspan-wall"></span></div>
            </div>
        </div>
    </div>
    <ul class="bullet">
        <li class="icon-circle icon-circle-thin"></li>
        <li class="icon-circle"></li>
        <li class="icon-circle"></li>
    </ul>
    <!--<div class="">-->
        <!--<a href="#" class="prev"><img src="images/prev.png"> </a>-->
        <!--<a href="#" class="next"><img src="images/next.png"> </a>-->
    <!--</div>-->
</div>
<div class="content">
    <div class="content-box">
        <div class="row">
            <div class="col-lg-4">
            	<!-- <a href="bathroom/overview.html#top" target="_blank">
                <img src="http://fe.ibaixiong.com/shop/images/pic3.png" class="videoimg">
                </a>
                <p class="videotitle">浴室款</p> -->
                <img src="http://fe.ibaixiong.com/shop/images/pic5.png" class="videoimg videoimg1">
                <div class="popvideobox popvideobox1">
                    <div class="videobg"></div>
                    <div class="videobox videobox1">
                        <i class="closevideo"></i>
<!-- 	                        <video src="http://player.youku.com/player.php/sid/XMTM5NTc5OTE4NA/partnerid/91a0d45b32079123/v.swf" controls="controls" class="video video1"></video>
 -->	                    
 						<object type="application/x-shockwave-flash" data="http://player.youku.com/player.php/sid/XMTQxMDA0NDIyMA==/v.swf" width="100%" height="100%" id="youku-player">
			                <param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always">
			                <param name="play" value="true">
			                <param name="movie"  value="http://player.youku.com/player.php/sid/XMTQxMDA0NDIyMA==/v.swf">
			                <param name="flashvars" value="imglogo=&amp;paid=0&amp;partnerId=91a0d45b32079123&amp;styleid=0">
			            </object>
					</div>
                </div>
			    <span class="videoState"></span>
                <p class="videotitle">熊爸爸暖魔方宣传片</p>
            </div>
            <div class="col-lg-4">
            	<a href="bedroom/overview.html#top" target="_blank">
                <img src="http://fe.ibaixiong.com/shop/images/pic2.png" class="videoimg">
                </a>
                <p class="videotitle">卧室款</p>
            </div>
            <div class="col-lg-4">
            	<a href="/family.html" target="_blank">
                <img src="http://fe.ibaixiong.com/shop/images/pic4.png" class="videoimg">
                </a>
                <p class="videotitle">千家万户</p>
            </div>
        </div>
    </div>
</div>
<div class="pop">
    <div class="popbg"></div>
    <div class="layel">
        <h3 class="poptitle">问题反馈<i class="closeicon"></i> </h3>
        <div class="row">
            <div class="remind">输入您的联系方式，我们会第一时间与您交流<i class="arrow"></i></div>
        </div>
        <div class="row">
            <input type="text" class="yourname" id="callMe" placeholder="怎么称呼您？">
        </div>
        <div class="row">
            <input type="text" class="yournum" id="tel" placeholder="请留下您的手机号码">
        </div>
        <div class="row" style="display: none;">
            <input type="text" class="yzm-input" placeholder="验证码">
            <img src="http://fe.ibaixiong.com/shop/images/loginbg.png" class="yzm-img">
        </div>
        <div class="row">
            <textarea class="description" id="customersMemo" placeholder="如您有关于产品的任何问题，欢迎反馈我们，我们将在第一时间回复。"></textarea>
        </div>
        <div class="row">
            <input type="button" class="sendinfor" value="发送">
        </div>
    </div>
</div>
<footer class="bx-footer">
    <div class="footer-wrap">
        <div class="row">
            <div class="col-lg-2">
                <ul>
                    <li><p>关于熊爸爸</p></li>
                    <li><a target="_blank" href="/about.html">了解我们</a> </li>
                    <li><a target="_blank" href="/join.html">加入团队</a> </li>
                    <li><a target="_blank" href="/contact.html">联系我们</a> </li>
                    <li><a target="_blank" href="/attract.html">加盟我们</a> <img src="http://fe.ibaixiong.com/shop/images/hot.png" style="padding-bottom:5px;"></li>
                </ul>
            </div>
            <div class="col-lg-2">
                <ul>
                    <li><p>熊爸爸渠道</p></li>
                    <li><a target="_blank" href="https://shop130325253.taobao.com/">熊爸爸淘宝店</a> </li>
                    <!-- li><a href="javascript:;">白熊商城</a> </li> -->
                </ul>
            </div>
            <div class="col-lg-2">
                <ul>
                    <li><p>关注我们</p></li>
                    <li class="wx"><a href="javascript:;">官方微信</a><img src="http://fe.ibaixiong.com/shop/images/erweima.png" class="erweima"> </li>
                    <li><a target="_blank" href="http://weibo.com/u/5721304254">新浪微博</a> </li>
                    <li class="wx"><a href="javascript:;">客户端下载</a><img src="http://fe.ibaixiong.com/shop/images/client_download.png" class="erweima"> </li>
                </ul>
            </div>
            <div class="col-lg-2">
                <ul>
                    <li><p>共建家园</p></li>
                    <li><a href="javascript:;" class="feedback">问题反馈</a> </li>
                </ul>
            </div>
            <div class="col-lg-4 tc">
                <div><i class="mobileicon"></i><span class="mobilenum">400-157-0088</span></div>
                <div style="text-indent: 34px;">周一到周五（9:00-18:00）</div>
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2175775986&site=qq&menu=yes"><img border="0" src="http://fe.ibaixiong.com/shop/images/qqonline.png" alt="点击这里给我发消息" title="点击这里给我发消息" class="qqonline" style="margin-top:27px;padding-left:26px;"/></a>
            </div>
        </div>
        <div class="row">
            <p class="footer-infor">© 2015 ibaixiong.com All rights reserved.    杭州白熊科技有限责任公司    浙ICP备15024007号-1</p>
        </div>
    </div>
</footer>
<script type="text/javascript">
//问题反馈
$(".sendinfor").click(function(){
	var callMe=$("#callMe").val();
	var tel=$("#tel").val();
	var customersMemo=$("#customersMemo").val();
	if(!callMe){
		alertLayel('姓名不能为空!');
		return;
	}
    if (!tel.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)) {
    	alertLayel('手机号码格式不正确!')
        return false;
    }
	if(!tel){
		alertLayel('联系方式不能为空!');
		return;
	}
	if(!customersMemo){
		alertLayel('描述内容不能为空！');
		return;
	}
	$.ajax({
        url: "/u/user/question.html",
        type: 'post',
        data:{ "callMe": callMe,"tel":tel,"customersMemo":customersMemo },
        dataType: 'json',
        success: function (data) {
        	if(data.code==1){
        		$('.pop').hide();
        		$("#callMe").val("");
        		$("#tel").val("");
        		$("#customersMemo").val("");
        	}else{
        		alertLayel("对不起，提交失败，请稍后再试！");
        	}
        },
		error: function(XMLHttpRequest) {
			if(XMLHttpRequest.readyState==0&&XMLHttpRequest.responseText==""){
				alertLayel("请登录后重试");
        	}
		}
    });
});


</script>
</body>
</html>
