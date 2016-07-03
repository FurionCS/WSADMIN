<!-- 
		这是自定义标签模板，如果用不到哪个标签请删除，不然会报错
 -->
<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
listUser
</Layout:overwrite>
<%-- <Layout:overwrite name="Mycss"></Layout:overwrite> --%>

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
				<a href="javascript:void(0)">业绩添加</a>
			</li>
		</ul>
</div>

<div class="row-fluid">

<div class="responsive span12 fix-offset" data-tablet="span12 fix-offset" data-desktop="span6">
		<div class="portlet box yellow">
			<div class="portlet-title">
				<div class="caption"><i class="icon-user"></i>添加业绩信息</div>
				<div class="tools">
						<a href="javascript:;" class="collapse"></a> 
				</div>
			</div>
			<div class="portlet-body">
			<div class="row-fluid">
            <div class="span12">
   				<form action="AchievementAction_addAchieve" method="post" id="InfoForm" class="form-horizontal" novalidate="novalidate">
                       <input name="aid" id="aid" value="" style="display: none;">
                        <input name="agid" id="agid" value="" style="display: none;">
                       <div class="control-group">
                            <label class="control-label">原有业绩&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="Fmoney" id="Fmoney" class="span6 m-wrap popovers" data-input="text" data-maxlength="250" disabled="" data-original-title="" title="">
                                <span style="color: red;" id="spanFMoney"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">新增业绩&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="money" id="money" class="span6 m-wrap popovers" data-input="text" data-maxlength="250" required="" data-original-title="" title="">
                                <span style="color: red;" id="spanMoney"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">业绩比例&nbsp;</label>
                            <div class="controls">
                              <div class="input-append"><input id="proportio" class="m-wrap span8 popovers" type="text" name="range.proportion" value="" disabled="" data-original-title="" title=""><span class="add-on">%</span></div>
                                <span style="color: red;" id="spanProportio"></span>
                            </div>
                        </div>
                        
                            <a type="" class="btn yellow" href="javascript:void(0);" style="width: 120px; margin-left: 180px;" onclick="SaveAchievement()">添加</a>
                           
                    </form>
            </div>
        </div>	
		</div>
		</div>
</div>

<div class="responsive span12 fix-offset" data-tablet="span12 fix-offset" data-desktop="span6">
		<div class="portlet box blue" style="border-color: forestgreen   ;">
			<div class="portlet-title" style="background-color: forestgreen   ;">
				<div class="caption"><i class="icon-user"></i>总代列表</div>
				<div class="tools">
						<a href="javascript:;" class="collapse"></a> 
				</div>
			</div>
			<div class="portlet-body">
			<div class="row-fluid">
            <div class="span12">
                <div class="portlet box light-grey" style="border-top: 1px solid #eee;">
                    <div class="portlet-body">
                        <div class="row-fluid">
                            <div class="span6">
                                <div id="sample_1_length" class="dataTables_length">
                                    <label>
                                        <select size="1" name="sample_1_length" id="pagesize" aria-controls="sample_1" class="m-wrap small">
                                            <option value="5" selected="selected">5</option>
                                            <option value="10" >10</option>
                                            <option value="20">20</option>
                                            <option value="-1">All</option>
                                        </select> 条每页</label>
                                </div>
                            </div>
                            <div class="span6">
                                <div class="dataTables_filter" id="sample_1_filter" style="float: right;">
                                    <label>检索: <input type="text" aria-controls="sample_1" class="m-wrap small" id="search" style="height:30px;" placeholder="姓名、微信号"></label>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>单选</th>
                                <th>姓名</th>
                                <th>微信号</th>
                                <th>手机号</th>
                            </tr>
                        </thead>
                        <tbody id="ListBody">
								
                        </tbody>
                    </table>
                    <div class="row-fluid">
                        <div class="span6">
                            <div id="pageInfo" class="dataTables_info">
                            </div>
                        </div>
                        <div class="span6">
                            <div style="float: right;" class="dataTables_paginate paging_bootstrap pagination">
                                <ul id="pagePart">
                                </ul>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>	
		</div>
		</div>
</div>
</div>
</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script>
	var pageSize = 5; //一页显示的记录数
    var pageIndex = 1; //当前页
    var PSize = 5;
    var orderby = "", strSearch = "";
    var count = 0;  //总记录数
    var pageCount=0;
    var istrue=true;
    $(document).ready(function () {
    	getAgentList(); //具体方法在下面
        document.getElementById("pagesize").onchange = function () {
            if (this.value < 0) { //即选择查看All记录（ value设为-1）
                pageSize = count; //此时count为所有记录条数
            } else
                pageSize = this.value;
                pageIndex = 1;   //无论选择每页显示几页，首先显示第一页
           	 getAgentList();
        }
        document.getElementById("search").onkeyup = function () {
            strSearch =this.value;
            getAgentList();
        };
    });
    $("#money").keyup(function(){
    	 var Fmoney=$("#Fmoney").val().trim();
    	 var money=this.value;
    	 if(money==""){return;}
    	 if(isNaN(parseInt(money))){  noty({ text: "必须填写数字", type: 'warning', layout: 'center', timeout: 2000 });return;}
    	 if(!isNaN(parseInt(Fmoney))){money=parseInt(money)+parseInt(Fmoney)}
    	 else{money=parseInt(money)}
    	  $.ajax({
              url: "RangesAction_getRangesByMoney",
              type: "POST",
              data: { 
            	  "ranges.minnum":money
              },
              dataType: "json",
              success: function (result) {  
            	  if(result.code==1){
            		  istrue=true
            		  $("#proportio").val(result.proportion);
            	  }
            	  else if(result.code==2){
            		  istrue=false;
            		  noty({ text: "结算设定错误，请修改", type: 'warning', layout: 'center', timeout: 2000 });
            	  }else{
            		  istrue=false;
            		  noty({ text: "业绩不在范围内，请修改结算设定", type: 'warning', layout: 'center', timeout: 2000 });
            	  }
              }
    	  })
    })
    
     //判断是否为double的类型
		function checkIsDouble(strdouble){
			var reg=/^[-\+]?\d+(\.\d+)?$/;
			if(reg.test(strdouble)){return true;}
			else return false;
		}
    function SaveAchievement(){ //点击保存按钮，保存业绩增加，更新业绩比率
    var aid=$("#aid").val().trim();
    var Fmoney=$("#Fmoney").val().trim();
    var money=$("#money").val().trim();
    if(!checkIsDouble(money)){
    	 noty({ text: "添加的业绩错误", type: 'warning', layout: 'topCenter', timeout: 2000 });
    	return;
    }
    var agid=$('input[name="AgentRadio"]:checked').val();
    if(agid==""){
    	 noty({ text: "请选择代理", type: 'warning', layout: 'topCenter', timeout: 2000 });
    	return;
    }
    var proportio=$("#proportio").val().trim();
    if(proportio==""||!istrue){return;}
     $.ajax({
            url: "AchievementAction_updateAchievementMoney",
            type: "POST",
            data: { "achievement.aid": aid,    //id
            		"achievement.money":Fmoney,        //原业绩
            		"addMoney":money,            //增加业绩
            		"achievement.proportion":proportio,//业绩比例
            		"achievement.agent.agid":agid       //原业绩
            },
            dataType: "json",
            success: function (result) {  
                if (result.code == 1) {
                    var data = result.achievementafter; //查到的数据
                    if(isNaN(parseInt(Fmoney))){Fmoney=0}
                    $("#Fmoney").val(parseInt(money)+parseInt(Fmoney));
    				$("#proportio").val(proportio);
    				$("#money").val("");
    				 noty({ text: "业绩添加成功", type: 'success', layout: 'topCenter', timeout: 2000 });
                }
                else {
                	 noty({ text: "业绩添加失败", type: 'warning', layout: 'topCenter', timeout: 2000 });
                }

            },
            error: function () {
                console.log("error");
            
            }
        });
   
    }
    
   function checkItem(agidnow){ //根据id获取选择的总代理的业绩，显示到页面
    $("#Fmoney").val("");
    $("#proportio").val("");
    $("#aid").val("");
    $.ajax({
            url: "AchievementAction_getAchievementByID",
            type: "POST",
            data: { "achievement.agent.agid": agidnow},
            dataType: "json",
            success: function (result) {  
           //alert(result);
           //alert(result.achievement.money)
                if (result.code == 1) {
                    var data = result.achievement; //查到的数据
                    $("#Fmoney").val(data.money);
                    $("#proportio").val(data.proportion);
                    $("#aid").val(data.aid);
                }
                else {
                    $("#Fmoney").val("");
                    $("#proportio").val("");
                    $("#aid").val("");
                }

            },
            error: function () {
                console.log("error");
                
            
            }
        });
   
   }

   
    function getAgentList() {  //getUserList方法名字换了要改4处，上面改3，下面改1。
        $.ajax({
            url: "AgentAction_getAgentByPage",
            type: "POST",
            data: { "page.pageSize": pageSize, "page.pageIndex": pageIndex, "page.strWhere": strSearch},
            dataType: "json",
            success: function (result) {  
                if (result.code == 1) {
                    count = result.count; //所有记录条数
                    var data=result.galist; //查到的数据
                    var html = "";
                    for (var i = 0; i < data.length; i++) {
                        html += '<tr class="odd gradeX">';
                       	html += '<td class="hidden-480">'+ '<div><span><input type="radio" onclick="checkItem('+data[i].agid+');"  name="AgentRadio" value=' + data[i].agid + '></span></div>' +'</td>';
                        html += '<td class="hidden-480">' + data[i].agname+ '</td>';
                        html += '<td class="hidden-480">' + data[i].agwxnum + '</td>';
                        html += '<td class="hidden-480">' + data[i].agtel + '</td>';
       					html += '</tr>';
                    }
                    $("#ListBody").html(html);
                }
                else {
                	count=0;
                    var html = "";
                    html += "<tr class='odd gradeX'>";
                    html += "<td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td>";
                    html += "</tr>";
                    $("#ListBody").html(html);
                }
                $("#chk_All").attr("checked", false).closest("span").removeClass("checked");

                GetPageInfo(count);
            },
            error: function () {
                console.log("error");
            }
        });
    }

    function GetPageInfo(count) {
        var pageHtml = "";
        if (count != 0) {
            recordCount = count;
            pageCount = Math.ceil(recordCount / pageSize);

            if (pageIndex == 1) {
                pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
            }
            else {
                pageHtml += "<li class='prev' onclick='GotoPage(" + Number(pageIndex - 1) + ")'><a>← <span class='hidden-480'>上一页</span></a></li>";
            }

            var PNumCount = Math.ceil(pageCount / PSize);//判断总分页
            var PNum = parseInt((pageIndex - 1) / PSize);//判断第几页分页
            if (PNum >= 1)
                pageHtml += "<li onclick='GotoPage(" + Number((PNum - 1) * PSize + 1) + ")'><a >...</a></li>";
            for (var j = PNum * PSize; j < (pageCount <= PSize * (PNum + 1) ? pageCount : PSize * (PNum + 1)) ; j++) {
                if (j == pageIndex - 1) {
                    pageHtml += "<li class=\"active\"><a >" + (j + 1) + "</a></li>";
                }
                else {
                    pageHtml += "<li onclick='GotoPage(" + (j + 1) + ")'><a >" + (j + 1) + "</a></li>";
                }
            }
            if ((PNum + 1) < PNumCount)
                pageHtml += "<li onclick='GotoPage(" + Number((PNum + 1) * PSize + 1) + ")'><a >...</a></li>";

            if (pageIndex == pageCount) {
                pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
            }
            else {
                pageHtml += " <li class='next' onclick='GotoPage(" + Number(pageIndex + 1) + ")'><a><span class='hidden-480'>下一页</span> → </a></li>";
            }
            $("#pagePart").html(pageHtml);
            if (pageSize * pageIndex > recordCount) {
                if (recordCount == 0) {
                    $("#pageInfo").html("显示第 0 条数据到 0 条数据，总共 0 页");
                }
                else {
                    $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + recordCount + " 条数据，总共 " + pageCount + " 页");
                }
            }
            else {
                $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + pageSize * pageIndex + " 条数据，总共 " + pageCount + " 页");
            }
        }
        else {
            pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
            pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
            $("#pageInfo").html("显示 0 条数据到 0 条数据，总共 0 页");
        }
        $("#pagePart").html(pageHtml);
        if (pageIndex > pageCount) {
            pageIndex = pageCount;
        }
    }

    function GotoPage(topage) {
        pageIndex = topage;
        if (0 < topage && topage <= pageCount)
        	getAgentList();
    }
</script>
</Layout:overwrite> 
<%@ include file="/share/_Layout.jsp"%>