<!-- 
		这是自定义标签模板，如果用不到哪个标签请删除，不然会报错
 -->
<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
setRange
</Layout:overwrite>
<Layout:overwrite name="Mycss">

<style>
</style>
</Layout:overwrite> 

<Layout:overwrite name="MyContent">
	<div class="row-fluid">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home"></i> 
				<a href="home/index.jsp">首页</a> 
				<i class="icon-angle-right"></i>
			</li>
			<li>
				<a href="javascript:void(0)">业绩管理</a> 
				<i class="icon-angle-right"></i>
			</li>
			<li>
				<a href="javascript:void(0)">结算设定</a>
			</li>
		</ul>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<!-- BEGIN SAMPLE FORM PORTLET-->
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i>填写结算信息（注：只能填写数字，第二个框的值必须大于0）
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse" ></a> 
					</div>
				</div>
				
				<div class="portlet-body form" >
				<div class="clearfix">
					<div class="btn-group">
						<button id="sample_editable_1_new" class="btn black" onclick="addLine()" style="background-color: lightslategray ;">
								Add New <i class="icon-plus"></i>
						</button>
					</div>
					<div class="btn-group">
						<button id="sample_editable_1_new" class="btn black" onclick="deleteRanges()">
								Delete One <i class="icon-minus"></i>
						</button>
					</div>
				</div>
				
					<!-- BEGIN FORM-->
					<div id="formList">

					<!-- END FORM-->
				</div>

				</div>

			</div>

			<!-- END SAMPLE FORM PORTLET-->

		</div>
	</div>
</Layout:overwrite>
<Layout:overwrite name="MyScript">
 <script src="Scripts/bootstrap/bootstrap-datepicker.js"></script>
 <script src="Scripts/bootstrap/bootstrap-datetimepicker.min.js"></script>
 <script src="Scripts/bootstrap/locales/bootstrap-datetimepicker.zh-CN.js"></script>
 <script src="js/Check.js"></script>
  <script>
  $(document).ready(function () {
	  //alert("csdwgehb5ni ds");
	  getRangesList(); 
 });
  
  function getRangesList() {  
        $.ajax({
            url: "RangesAction_getAllRanges",
            type: "POST",
            dataType: "json",
            success: function (result) {  
                if (result.code == 1) {
                    var data = result.rlist; //查到的数据
                    var html = "";
                    for (var i = 0; i < data.length; i++) {
                        html += '<form action="RangesAction_addRanges" class="form-horizontal" style="padding-bottom: 10px !important;">';
                        
                       	html += '<label class="control-label">范围： &nbsp</label>';
                       	
                        html += '<input style="display:none;" type="text" class="rid" name="ranges.rid" id="rid" value="' + data[i].rid + '">';
                       	
                        html += '<div class="input-append">';
                        html += '<input class="m-wrap span9 popovers" type="text" name="ranges.minnum" id="minnum" value="' + data[i].minnum + '">';
                        html += '<span class="add-on">元</span></div>';
								
                        html += '<span class="">---- &nbsp</span>';
                        
                        html += '<div class="input-append">';
                        html += '<input class="m-wrap span9 popovers" type="text" name="ranges.maxnum"  id="maxnum" value="' + data[i].maxnum + '">';
                        html += '<span class="add-on">元</span></div>';
                        
                        html += '<div class="input-prepend">';
                        html += '<span class="add-on">提成比例</span>';
                        html += '<input class="m-wrap span8 popovers" type="text" name="ranges.proportion" id="proportion" value="' + data[i].proportion + '">';
                        html += '</div>';
                        
                        html += '<div class="input-prepend" style="margin-left: 20px;">';
                        html += '<input type="submit" class="btn yellow" style="width:90px;" value="修改">';
                        html += '</div></form>';
                    }
                    $("#formList").html(html);
                }
                else {
                    var html = "";
                	html += '<label class="control-label"></label>';
                    $("#formList").html(html);
                }
            },
            error: function () {
                console.log("error");
            }
        });
    }
  
  function addLine() {  
	 
                      var html = "";
                 
                      html += '<form action="RangesAction_addRanges" class="form-horizontal" style="padding-bottom: 10px !important;">';
                      
                      html += '<label class="control-label">范围： &nbsp</label>';
                      
                      html += '<div class="input-append">';
                      html += '<input class="m-wrap span9 popovers" type="text" name="ranges.minnum" id="minnum" >';
                      html += '<span class="add-on">元</span></div>';
								
                      html += '<span class="">---- &nbsp</span>';
                      
                      html += '<div class="input-append">';
                      html += '<input class="m-wrap span9 popovers" type="text" name="ranges.maxnum" id="maxnum" >';
                      html += '<span class="add-on">元</span></div>';
                      
                      html += '<div class="input-prepend">';
                      html += '<span class="add-on">提成比例</span>';
                      html += '<input class="m-wrap span8 popovers" type="text" name="ranges.proportion" id="proportion">';
                      html += '</div>';
                      
                      html += '<div class="input-prepend" style="margin-left: 20px;">';
                      html += '<input type="submit" class="btn yellow" value="提交">';
                      html += '</div></form>';
                
                  	$("#formList").html($("#formList").html()+html);
  }
  
  
  function deleteRanges(){
		var length=$(".form-horizontal").length;
		var formRange=$(".form-horizontal")[length-1];
		if($(".rid")[length-1]!=null){
			var i=1;
			$(".rid").each(function(){
				if(i==length){
					//alert($(this).val());
					if(confirmDeleteRanges($(this).val(),formRange)){
					}
				}
				i++;
			})
		} else{
			formRange.remove();
		}
		
	}
  
  function confirmDeleteRanges(id,formRange){
		var flag=true;
		noty({
            text: '确定要删除这条范围吗',
            type: 'information',
            layout: 'center',
            buttons: [
                {
                    addClass: 'btn blue', text: '确定', onClick: function ($noty) {
			 			$.ajax({
				            url: "RangesAction_deleteRanges",
				            type: "POST",   
				            data: {"ranges.rid":id},
				            dataType: "json",
				            success: function (result) {
				            	if(result.code==1){
				            		 flag=true;
				            		 $noty.close();
				            		 noty({ text: "删除成功！", type: "success", layout: "topCenter", timeout: 1000, modal: true }); 
				            		 setTimeout(function(){formRange.remove();}, 3000)
				            	}else{
				            		 $noty.close();
				            		noty({ text: "删除失败！", type: "warning", layout: "topCenter", timeout: 1000, modal: true }); 
				            	}
				            },
				            error: function () {
                              noty({ text: "检查网络设置,或稍等操作", type: 'warning', layout: 'center', timeout: 2000 });
                          }
			 			});
                    }
                },
                {
                    addClass: 'btn red', text: '取消', onClick: function ($noty) {
                        $noty.close();
                    }
                }
            ]
        });
		 return flag;
	}
  </script> 
</Layout:overwrite> 
<%@ include file="/share/_Layout.jsp"%>