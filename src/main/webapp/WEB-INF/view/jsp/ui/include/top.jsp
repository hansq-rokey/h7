<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/plug/layer/layer.js"></script>
<div class="left-top">
	<div class="user-infor">
		<img src="/images/pic.jpg" class="user-image">
		<div class="infor-box">
			<span>城市运营公司</span> 
			<span class="user-name">
			<span class="name-value"></span>
			<i class="user-arrow"></i></span>
		</div>
		<div class="_botselect">
			<ul>
				<a id="update_password">修改密码</a>
				<a href="/u/user/ssssInfo.html">个人信息</a>
				<a href="http://daili.ibaixiong.com/u/order/list.html" target="_blank">商城个人中心</a>
				<a href="http://daili.ibaixiong.com/logout.html">退出</a>
			</ul>
		</div>
	</div>
	<div class="new-date" style="display: none;">
		<div class="date-item">
			<span class="date-num">21</span> <span class="date-late">新订单</span>
		</div>
		<div class="date-item">
			<span class="date-num">21</span> <span class="date-late">新订单</span>
		</div>
		<div class="date-item">
			<span class="date-num">21</span> <span class="date-late">新订单</span>
		</div>
	</div>
</div>
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
					var nick=obj.result.name;
					if(nick==null)
						nick ="白熊";
					$(".name-value").text(nick);
					//4s店，代理商链接显示
					var ssss = obj.result.ssssTag;
					if(ssss == 1){
						$("#ssssLi").show();
					}
					var merchantTag = obj.result.merchantTag;
					if(merchantTag == 1){
						//$("#merchantLi").show();
					}
				}
		   }
		});
$("#update_password").on('click',function(event) {
	   var aa='<div class="w_title">';
	        aa+='<h3>修改密码</h3>';
	        aa+='<div class="_wmoney"><input type="password" name="money" class="money" id="oldPwd" placeholder="原密码"></div>';
	        aa+='<div class="_wpassword"><input type="password" name="password" class="password" id="newPwd1" placeholder="新密码"></div>';
	        aa+='<div class="_wpassword"><input type="password" name="password" class="password" id="newPwd2" placeholder="从新输入新密码"></div>';
	        aa+='<div class="_wbtn"><a id="-bt1" class="_won" onclick="updatePassword()">确认</a> </div>';///<a id="-bt2" href="###">取消</a>
	        aa+='</div>';
	    layer.open({
	       type: 1,
	       title: false,
	       closeBtn: 2,
	       area: ['400px', '350px'],
	       shadeClose: true,
	       skin: 'yourclass',
	       content:aa,
	  });
	});
});
	function updatePassword(){
		var oldPwd = $("#oldPwd").val();
   		var newPwd1 = $("#newPwd1").val();
   		var newPwd2  = $("#newPwd2").val();
   		if(oldPwd == null || oldPwd ==undefined || oldPwd == ''){
   		 layer.msg("原密码不可为空");
			return false;
		}
   		if(newPwd1 == null || newPwd1 ==undefined || newPwd1 == ''){
   		 layer.msg("新密码不可为空");
			return false;
		}
   		if(newPwd2 == null || newPwd2 ==undefined || newPwd2 == ''){
   		 layer.msg("确认新密码不可为空");
			return false;
		}
   		if(newPwd1 != newPwd2){
   		 layer.msg("新密码与确认新密码不一致");
			return false;
   		}
   		$.ajax({
			   url: "/u/user/update.html?oldPwd="+oldPwd+"&newPwd="+newPwd1,
			   type: "post",
			   dataType:"json",
			   cache:false,
			   success: function(obj){
		  			if (obj.code==1) {
		  				 layer.msg(obj.message);
						return;
				    }
				 	if ( obj.code == 0 ) {
				 		 layer.msg("修改密码成功!");
				 		window.location.reload();//重载页面
					}
			   }
			});
	}
</script>