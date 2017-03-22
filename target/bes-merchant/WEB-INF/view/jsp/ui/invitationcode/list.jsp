<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="../../../../../plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="../../../../../plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <script src="../../../../../plug/adddatetime.js" type="text/javascript" ></script>
    <link href="../../../../../css/common.css" rel="stylesheet" type="text/css">
	<link href="../../../../../css/invitecode-list.css" rel="stylesheet" type="text/css">    
	<script src="../../../../../js/common.js" type="text/javascript" ></script>
    <script src="../../../../../js/base.js" type="text/javascript" ></script>
    <title>邀请码列表</title>
</head>
<body>
<div style="display: none;">
            	<form action="/u/invitationcode/list.html" method="post">
            		<input type="hidden" name="pageNo" value="${pageNo }" id="pageNo"/>
            		 <input type="submit" value="搜索" class="searchOrder search">
            	</form>
</div>
<div class="container clearfix">
    <jsp:include page="../include/top.jsp"></jsp:include>
    
 <div class="content">

		<jsp:include page="../include/left.jsp"></jsp:include>

        <div class="content-right">
            <div class="right-title clearfix">
                <a>邀请码列表</a>
                <ul class="partlist">
                	<li>
                		<span class="switch ${status==null?'switched':'' }"><a href="/u/invitationcode/list.html">全部</a></span>
                	</li>
                	<li>
                		<span class="switch  ${status==-1?'switched':'' }"><a href="/u/invitationcode/list.html?status=-1">已失效</a></span>
                	</li>
                	<li style="display: none;">
                		<span class="switch  ${status==0?'switched':'' }"><a href="/u/invitationcode/list.html?status=0">未付款</a></span>
                	</li>
            		<li>
                		<span class="switch  ${status==1?'switched':'' }"><a href="/u/invitationcode/list.html?status=1">未使用</a></span>
                	</li>
                	<li>
                		<span class="switch  ${status==2?'switched':'' }"><a href="/u/invitationcode/list.html?status=2">使用中</a></span>
                	</li>
                	<li>
                		<span class="switch  ${status==3?'switched':'' }"><a href="/u/invitationcode/list.html?status=3">已使用</a></span>
                	</li>
                </ul>                
            </div>
	        <div class="all">
				<div class="row" style="display: none;">
					<input type="text" class="infor" placeholder="用户姓名、手机号、编号">
            		<input type="hidden" name="pageNo" value="${pageNo }" id="pageNo"/>
					<input type="button" class="searchbtn search" value="搜索"/>
					<input type="button" class="buybtn" value="购买"/>
				</div>
		             	<div class="simple">
		             		<table  class="invitecodetable">
		              	<thead>
		              		<tr>
		              			<td style="min-width: 110px;">手机号</td>
		              			<td style="min-width:120px;">姓名</td>
		              			<td style="min-width:120px;">面额</td>
		              			<td style="min-width:120px;">状态</td>
		              			<td style="min-width:120px;">购买日期</td>
		              			<td style="min-width:120px;">有效期</td>
		              			<td style="min-width:100px;">使用产品</td>
		              			<td style="min-width:80px;">操作</td>
		              		</tr>
		              	</thead>
		              	<tbody>
		              		<c:forEach items="${ invitationCodeList }" var="item">
		              		<tr>
		              			<td>${ item.receiveUserPhone }</td>
		                          <td>${ item.receiveUserName }</td>
		              			<td>￥${ item.money }</td>	                			
		              			<td class="status">
								<c:choose>
									<c:when test="${item.status==-1 }">已失效</c:when>
									<c:when test="${item.status==0 }">未付款</c:when>
									<c:when test="${item.status==1 }">未使用</c:when>
									<c:when test="${item.status==2 }">使用中</c:when>
									<c:when test="${item.status==3 }">已使用</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
							</td>
		              			<td><fmt:formatDate value="${ item.createDateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		              			<td><fmt:formatDate value="${ item.validTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		              			<td><a href="javascript:;" class="link showProduct" data-id="<c:forEach items="${ item.allowProducts }" var="allowProduct">${ allowProduct.productId },</c:forEach>">查看</a></td>
		              			<td>
		              				<c:choose>
									<c:when test="${ item.status==0 || item.status==1 }"><a href="#" class="link closebutton" data-id="${ item.id }">关闭</a></c:when>
								</c:choose>
		              			</td>
		              		</tr>
		              		</c:forEach>
		              	</tbody>
		              	</table>
		             	</div>
		     			<jsp:include page="../include/pages.jsp"></jsp:include>
	        </div>
        </div>
    </div>
</div>
<div class="pop closePop" style="display: none;">
	<div class="popbg"></div>
	<div class="layel">
		<h3 class="poptitle">关闭邀请码<i class="closeicon"></i> </h3>
		<div class="row">
			<p class="excalmatoryimg"><img src="../../../../../images/excalmatory.png"></p>
			<p>关闭后，用户将无法使用该邀请码。</p>
			<p>是否关闭？</p>
		</div>
		<div class="row tc">
			<input type="button" value="关闭" class="closebtn">
			<input type="button" value="取消" class="deletebtn closeBtn">
		</div>
	</div>
</div>
<div class="pop showPop" style="display: none;">
	<div class="popbg"></div>
	<div class="layel">
		<h3 class="poptitle">使用产品<i class="closeicon"></i> </h3>
		<div class="row showprodlist">
		</div>
		<div class="row tc">
			<input type="button" value="确定" class="deletebtn closeBtn">
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on('click','.closebutton',function(){
    		var id = $(this).attr("data-id");
    		$(this).addClass('closing');
     		$('.closePop').show().find('.closebtn').attr('data-id',id);
    	});
    	$(document).on('click','.deletebtn',function(){
     		$(this).parent().parent().parent('.pop').hide();
    	});
    	$(document).on('click','.closebtn',function(){
    		var id = $(this).attr("data-id");
    		$.ajax({
				type : "POST",
				url : "/u/invitationcode/close.html",
				data : {
					invitationCodeId : id
				},
				dataType : "json",
				success : function(data) {
					console.dir(data);
					var jsonData = data;
	                if(jsonData.code==0){
	                    $('.closing').parent().parent().find('.status').text('已失效');
	                    $('.closing').remove();
	                }else{
	                	alertLayel(data.message);
	                }                
				}
			});
    		$(this).parent().parent().parent('.pop').hide();
    	});
    	//查看产品
    	$('.showProduct').on('click',function(){
    		$('.showPop').show();
    		var id=$(this).attr('data-id');
    		var html='';
    		$.ajax({
				type : "POST",
				url : "/u/invitationcode/getallowproduct.html",
				data : {
					id : id
				},
				dataType : "json",
				success : function(data) {
					if(data){
						for(i=0;i<data.length;i++){
							html+='<p><a href="'+data[i].detailUrl+'" target="_blank">'+data[i].title+'</a></p>';
							console.dir(html); 
						}  
					}else{
						html='<p>没有可使用产品</p>'
					}         
		    		$('.showPop').find('.showprodlist').html(html); 
				}
			});
    	})
	});
</script>

</body>
</html>