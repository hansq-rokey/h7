
$(function(){
    var $h3=$('.left-bottom h3'),
        $left_bottom=$('.left-bottom'),
        $curH3=$('.curH3'),
        height=$(window).height(),
        $select=$('.selectinput'),
        $inputItem=$('.input-item'),
        $cancel=$('.popCancel'),
        $state=$('.state-btn');
        $(".left-bottom").height(height);
        console.log(height);
    //左侧导航切换
    $h3.on('click',function(){
        var cur=$(this).hasClass('curH3');
        if(!cur){
            $curH3.find('.arrow').removeClass('down');
            $('.curH3').removeClass('curH3').next('ul').slideUp('slow');
            $(this).addClass('curH3').next('ul').slideToggle('slow');
            $(this).find('.arrow').toggleClass('500');
        }else{
            $(this).addClass('curH3').next('ul').slideToggle('500');
            $(this).find('.arrow').toggleClass('down');
        }
       setTimeout(function () {
            if($left_bottom.height()>height){
                $left_bottom.css('height',height);
            }
            $('body').css('height',$left_bottom.height());
        }, 500);
    });
    $state.on('click',function(){
        if($(this).hasClass('state-on')){
            $('.left-part,.left-top').css('width','0px');
            $(this).removeClass('state-on').addClass('state-off');
        }else if($(this).hasClass('state-off')){
            $('.left-part,.left-top').css('width','280px');
            $(this).removeClass('state-off').addClass('state-on');
        }
    });
    resize();
    function resize(){
        var width = $(window).width();
        var width_= $(window).width()-280;
        var height=$(window).height()-140;
        if(width<1366){
            $('.state-btn').show();
            $('.left-part').css('left','-280px').addClass("retract");
            $(this).removeClass('state-off').addClass('state-on');
            $('.right-box').css('marginLeft','0');
            $('.right-top').css('left','0');
            $("._indent").css('display', 'block');
            $(".left-part").removeClass('_cc_');
            $(".add_nav,.a_content").css('left', '0');
            $(".s_content").css({height:height,width:width_+280});
        }else{
            $('.state-btn').hide();
            $('.right-box').css('marginLeft','280px');
            $('.left-part').css('left','0').removeClass("retract");
            $(this).removeClass('state-on').addClass('state-off');
           // $('.right-part').css('marginLeft','280px');
            $('.right-top').css('left','280px');
            $("._indent").css('display', 'none');
            //$(".add_nav,.a_content").css('left', '280px');
            $(".s_content").css({height:height,width:width_});
        }
        if (width<1305) {
            $(".s_content").width("1305px");
        }
        if (width<1100) {
            $(".input-list").width("1100px")
        };
    }
    window.onresize=function(){
        resize();
    };
    //判断左侧高度
    if($left_bottom.height()>height){
        $left_bottom.css('height',height);
    }
    //$('body').css('height',$left_bottom.height());
    //下拉框
    $select.find('.selectvalue').on('click',function(){
        $(this).next('.opation').slideToggle('fast');
    });
    $select.find('ul').find('li').on('click',function(){
        var value=$(this).text();
        $(this).parent().slideUp('fast').prev('.selectvalue').text(value);
    });
    $select.mousemove(function(){
        $(this).find('.opation').show();
    }).mouseout(function(){
        $(this).find('.opation').hide();
    })
    //组合时间选择框
    $('input[name="daterange"]').daterangepicker({
        format:'YYYY-MM-DD'
    });
    //单个时间选择框
    $('input[name="singleDatePicker"]').daterangepicker({
        singleDatePicker: true,
        format:'YYYY-MM-DD'
    });
    //点击水波纹效果
    $(".ripple-event").click(function(e) {
        $(".ripple").remove();
        var posX = $(this).offset().left,
            posY = $(this).offset().top,
            buttonWidth = $(this).width(),
            buttonHeight = $(this).height();

        $(this).prepend("<span class='ripple'></span>");

        if (buttonWidth >= buttonHeight) {
            buttonHeight = buttonWidth;
        } else {
            buttonWidth = buttonHeight;
        }
        var x = e.pageX - posX - buttonWidth / 2;
        var y = e.pageY - posY - buttonHeight / 2;
        $(".ripple").css({
            width: buttonWidth,
            height: buttonHeight,
            top: y + 'px',
            left: x + 'px'
        }).addClass("rippleEffect");
    });

    //title样式
        $(".data-title").each(function(b) {//这里是控制标签
            if (this.title) {
                var c = this.title; //把title的赋给自定义属性 myTilte ，屏蔽自带提示
                var tw=$(this).width();
                var a = 30; //设置提示框相对于偏移位置，防止遮挡鼠标
                $(this).mouseover(function(d) { //鼠标移上事件
                    this.title = "";
                    $("body").append('<div id="tooltip">' + c + "</div>"); //创建提示框,添加到页面中
                    $("#tooltip").css({
                        left: (d.pageX + a) + "px",
                        top: d.pageY + "px"
                    }).show(250) //设置提示框的坐标，并显示
                }).mouseout(function() { //鼠标移出事件
                    this.title = c; //重新设置title
                    $("#tooltip").remove() //移除弹出框
                }).mousemove(function(d) { //跟随鼠标移动事件
                    $("#tooltip").css({
                        left: (d.pageX + a) + "px",
                        top: d.pageY + "px"
                    })
                })
            }
        })
    //表单输入样式
    $inputItem.find('input[type=text],textarea').focus(function(){
            $(this).prev('p').css({bottom:'30px',color:'#30a3e6'});
    }).blur(function(){
        if(!$(this).val()) {
            $(this).prev('p').css({bottom: '10px', color: '#a9a9a9'});
        }else{
            $(this).prev('p').css({color:'#8c98a6'});
        }
    }).each(function(){
        if($(this).val()){
            $(this).prev('p').css({bottom:'30px',color:'#8c98a6'});
        }
    })
    //关闭弹窗
    $cancel.on('click',function(){
        $(this).parent().parent().parent('.pop').hide();
    })
    //修改密码切换
    $(".user-name").on('click', function() {
       $("._botselect").fadeToggle(600);
    });
})
/*//滚动条设置
$.fn.scrollUnique = function() {
    return $(this).each(function() {
        var eventType = 'mousewheel';
        if (document.mozHidden !== undefined) {
            eventType = 'DOMMouseScroll';
        }
        $(this).on(eventType, function(event) {
            // 一些数据
            var scrollTop = this.scrollTop,
                scrollHeight = this.scrollHeight,
                height = this.clientHeight;

            var delta = (event.originalEvent.wheelDelta) ? event.originalEvent.wheelDelta : -(event.originalEvent.detail || 0);        

            if ((delta > 0 && scrollTop <= delta) || (delta < 0 && scrollHeight - height - scrollTop <= -1 * delta)) {
                // IE浏览器下滚动会跨越边界直接影响父级滚动，因此，临界时候手动边界滚动定位
                this.scrollTop = delta > 0? 0: scrollHeight;
                // 向上滚 || 向下滚
                event.preventDefault();
            }        
        });
    }); 
};*/
/*$(".right-part").scrollUnique();*/


//左侧滑动
$(document).on('click', '._indent', function() {
    var thishas=$(".left-part").hasClass("retract");
	if (thishas) {
		$(".left-part").removeClass("retract").css('left','0');
        $("._indent:before").css('transform', 'rotateY(0deg)');
    }else{
    	$(".left-part").addClass("retract").css('left','-280px');
        $("._indent:before").css('transform', 'rotateY(180deg)');
    }
});
$(function(){
    var height=$(window).height()-140;
    $(".s_content").height(height);
})

//textare焦点事件
$(document).on('focus', '#money_content', function() {
    $("#reject_tag").hide();
});
$(document).on('blur', '#money_content', function() {
    var content=$(this).val();
    if (content=="") {
       $("#reject_tag").show();
    }
});
//关闭弹层
$(document).on('click', '.money_hiden', function() {
    $(".money_layer").fadeOut(200);
});

//选择弹出层
$(document).on('click', '.only-line>.blue', function(event) {
    var data=$(this).data('type');
    console.log(data);
    var content1='<div class="agree">';
        content1+='<h3 class="agree_tag">同意申请</h3>'
        content1+='<p class="agree_content">同意申请后，必须将相应定金返还用户，<br>是否同意?</p>';
        content1+='<div class="money_btn">';
        content1+='<a href="###" class="btn_on" id="agree">同意</a>';
        content1+='<a class="money_hiden" href="###">取消</a>';
        content1+='</div>';
        content1+='</div>';

    var  content2='<div class="agree">';
         content2+='<h3 class="agree_tag">确认打款</h3>';
         content2+='<p class="agree_content">确认打款后，用户将收到已打款状态，<br>是否确认?</p>';
         content2+='<div class="money_btn">';
         content2+='<a href="###" class="btn_on" id="agree">确认</a>';
         content2+='<a class="money_hiden" href="###">取消</a>';
         content2+='</div>';
         content2+='</div> ';
       
    var content3=' <div class="agree_reject">';
        content3+='<h3 class="agree_tag">拒绝申请</h3>';
        content3+='<p class="money_text">';
        content3+='<textarea id="money_content"></textarea>';
        content3+=' <span class="reject_tag" id="reject_tag">请输入拒绝退款理由</span>';
        content3+='</p>';
        content3+=' <div class="money_btn">';
        content3+='<a href="###" class="btn_on" id="reject">拒绝打款</a>';
        content3+=' <a class="money_hiden" href="###">取消</a>';
        content3+=' </div>';
        content3+='</div>';
    if (data==1) {
        $(".money_layer").fadeIn('400').html(content1);
    }
    else if(data==2){
        $(".money_layer").fadeIn('400').html(content3);
    }
   /* else if(data==3){
        $(".money_layer").fadeIn('400').html(content3);
    }*/
});

/*下拉修改*/
$(function(){
   var selectskin=$(".selectskin"); 
   selectskin.find('.selectcontent').on('click',function(){
        $(this).next('.selectopation').slideToggle('fast');
    });
   selectskin.find('ul').find('li').on('click',function(){
        var value=$(this).text();
        $(this).parent().slideUp('fast').prev('.selectcontent').text(value);
    });
   selectskin.mousemove(function(){
        $(this).find('.selectopation').show();
    }).mouseout(function(){
       $(this).find('.selectopation').hide();
    })
})
//添加商品下拉
$(function(){
   var rowc_mian=$(".rowc_mian"); 
   rowc_mian.find('.selectcontent').on('click',function(){
        $(this).next('.rowopation').slideToggle('fast');
    });
   rowc_mian.find('ul').find('li').on('click',function(){
        var value=$(this).text();
        $(this).parent().slideUp('fast').prev('.selectcontent').text(value);
        $(this).parent().next(".c_m").val(value);
    });
   rowc_mian.mousemove(function(){
        $(this).find('.rowopation').show();
    }).mouseout(function(){
       $(this).find('.rowopation').hide();
    })
})
/**/
$(document).on('click', '.add_p>.plusProprety', function() {
    var content='<div class="propValue">';
        content+='<div class="propType">';
        content+='<select name="type-1" style="height: 24px;">';
        content+='<option value="1" undefined="">输入框</option>';
        content+='<option value="2" selected="">单选</option>';
        content+='<option value="3" undefined="">多选</option>';
        content+='<option value="4" undefined="">图片</option>';
        content+=' </select>';
        content+='</div>';
        content+='<div class="propType">';
        content+='<input type="text" name="propertyName-1" value="长">';
        content+='</div>';
        content+='<div class="propType">';
        content+=' <input type="text" name="identify-1" value="length">';
        content+='</div>';
        content+='<input type="hidden" name="id-1" value="1">';
        content+='</div>';
        $(".boxcc").append(content);
});
/*关闭弹窗*/
$(document).on('click', '.procancel,.alertBtn', function(event) {
  $(".p_popup").fadeOut(200);
  $(".alertpop").fadeOut(200);
});
$(function(){
    $(".p_set").on('click',  function() {
      $(".p_popup").fadeIn(200);
    });
})

/*弹窗*/
function alertLayel(e){
    var html='<div class="alertpop" style="display: block;position: fixed;width: 100%;height:100%;top:0;left:0;z-index: 9999;"><div class="popbg closepop" style="    width: 100%;height:100%;position: absolute;top:0;left:0;z-index: 989;background: #000;opacity: 0.5;"></div><div class="alertLayel" style="width:400px;height:200px;padding-top:10px;background:#fff;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0;z-index:9999;"><h3 style="height:30px;position:relative;"><i class="closeicon" style="margin-right:12px;margin-top:0;"></i> </h3><p class="alertContent" style="line-height:30px;font-size:14px;text-align:center;height:100px;">'+e+'</p><div class="row tc" style="margin:0;"><input type="button" value="确定" class="alertBtn" style="height:30px;border:none;width:80px;background:#ff6200;color:#fff;"></div></div></div>';
    $("body").append(html);
}
