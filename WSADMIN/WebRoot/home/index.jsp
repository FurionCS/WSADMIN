<%@ taglib uri="Mytag" prefix="Layout"%>

<Layout:overwrite name="Mycss">
<style>  
    div.graph  
            {  
                width: 100%;  
                height: 300px;  
            } 
       
       #agegraph{
       			height:500px;
       } 
    </style>  
</Layout:overwrite> 


<Layout:overwrite name="MyContent">
<div class="row-fluid">
	<h1 class="page-title">微商结算系统</h1>
        <div>
            <div class="span12">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="javascript:void(0)">首页</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
            <div class="row-fluid"  style="font-family:微软雅黑">
						
						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">
							<div class="dashboard-stat green">
								<div class="visual">
									<i class="icon-group"></i>
								</div>
								<div class="details">
									<div id="agentNumber" class="number">0</div>
									<div class="desc">代理人数</div>
								</div>
								<a class="more" href="Agent/AgentList.jsp?active=menupage6_5">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>                 
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6  fix-offset" data-desktop="span3">
							<div class="dashboard-stat purple">
								<div class="visual">
									<i class="icon-bell"></i>
								</div>
								<div class="details">
									<div class="number" id="newagentcount">0</div>
									<div class="desc">今日新增代理</div>
								</div>
								<a class="more" href="javascript:">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>          
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6 fix-offset" data-desktop="span3">
							<div class="dashboard-stat blue">
								<div class="visual">
									<i class="icon-jpy"></i>
								</div>
								<div class="details">
									<div id="teamMoney"class="number">0</div>
									<div class="desc">最高团队业绩</div>
								</div>
								<a class="more" href="Achievement/AchievementList.jsp?active=menupage5_2">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>                 
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6 fix-offset" data-desktop="span3">
							<div class="dashboard-stat yellow">
								<div class="visual">
									<i class="icon-bullhorn"></i>
								</div>
								<div class="details">
									<div class="number" id="personmoney">0</div>
									<div class="desc">最高个人业绩</div>
								</div>
								<a class="more" href="Achievement/AchievementList.jsp?active=menupage5_2">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>                 
							</div>
						</div>
					
							<div class="row-fluid">
							<!-- BEGIN tendency-->
							<div class="portlet solid bordered light-grey">
								<div class="portlet-title">
									<div class="caption"><i class="icon-bar-chart"></i>趋势图</div>
									<div class="tools">
										<div class="btn-group pull-right" data-toggle="buttons-radio">
											<!--<a href="#" class="btn mini active">评价</a>
                                            <a href="#" class="btn mini">投诉</a>-->
                                            <select id="chartType">
                                                <option value="hour">过去12小时内</option>
                                                <option value="day">过去两周内</option>
                                                <option value="month">过去1年内</option>
                                            </select>
										</div>
									</div>
								</div>
							<!-- END tendency-->	
								<div class="portlet-body">
									<div id="site_statistics_loading">
										<img src="Content/image/loading.gif" alt="loading" />
									</div>
									<div id="site_statistics_content" class="hide">
										<div id="site_statistics" class="chart"></div>
									</div>
								</div>
							</div>
							<!-- END PORTLET-->
						</div>
					</div>
					<div class="row-fluid">
						 <div class="span6 responsive">
							<div class="portlet box green">
								<div class="portlet-title">
									<div class="caption"><i class="icon-reorder"></i>饼图</div>
									<div class="tools">
										<a href="javascript:;" class="collapse"></a>
										<a href="javascript:;" class="remove"></a>
									</div>
								</div>
								<div class="portlet-body">
									<h4>代理性别比例图</h4>
									<div id="sexgraph" class="graph" ></div>  
								</div>
							</div>
	                   	 </div>
                    
                    <div class="span6 responsive">
						<div class="portlet box green">
							<div class="portlet-title">
								<div class="caption"><i class="icon-reorder"></i>饼图</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body">
								<h4>代理地区分布图</h4>
								<div id="addressgraph" class="graph" ></div>  
							</div>
						</div>
                    </div>
                 </div>
                    <div class="row-fluid">
                    	<div class="span12 responsive">
							<div class="portlet box green">
								<div class="portlet-title">
									<div class="caption"><i class="icon-reorder"></i>饼图</div>
									<div class="tools">
										<a href="javascript:;" class="collapse"></a>
										<a href="javascript:;" class="remove"></a>
									</div>
								</div>
								<div class="portlet-body">
									<h4>代理年龄比例图</h4>
									<div id="agegraph" class="graph"></div>		
									<!-- <div id="sexgraph" class="graph" ></div>  --> 
								</div>
							</div>
                    </div>
                 </div> 
                
</Layout:overwrite>
 <Layout:overwrite name="MyScript">
 	<script src="Scripts/bootstrap/jquery.flot1.js" charset="utf-8"></script>
	<script src="Scripts/bootstrap/jquery.flot.stack.js"></script>
	<script src="Scripts/bootstrap/jquery.flot.pie.js"></script>
	<script src="js/amcharts.js"></script>
	<script src="js/pie.js"></script>
	<script src="js/light.js"></script>
 	<script>
 	getAgentDate();
 	var man=0;
 	var female=0;
	var data;
	var dataaddress=[];
	var dataagerange=[];
	getBaseDate();
	function getBaseDate(){
		 $.ajax({
			   url: "AgentAction_getBaseDate",
	            type: "POST",
	           	dataType: "json",
	            success: function (result) {
	            	$("#agentNumber").html(result.agentcount);
	            	$("#newagentcount").html(result.newagentcount);
	            	$("#personmoney").html(result.personMoney);
	            	$("#teamMoney").html(result.teamMoney);
	            	
	            },
		 		error: function (error) {
	                noty({ text: "请检查网络！", type: "warning", layout: "topCenter", timeout: 3000 });
	                console.log("error"); return;
	            }
		 })
	}
 	function getAgentDate(){
 		  $.ajax({
 	            url: "AgentAction_getAgentDate",
 	            type: "POST",
 	           	dataType: "json",
 	            success: function (result) {
 	            	data=[  
 		                { label: "男",  data: result.losex[0]},  
 		                { label: "女",  data: result.losex[1]}  
 		            ]; 
 	            	
 	            	for(var i=0;i<result.loaddress.length;i++){
 	            		var o={label:result.loaddress[i].agaddress,data:result.loaddress[i].agcount}
 	            		dataaddress.push(o);
 	            	}
 	            	for (var prop in result.agerange) {  
	            		  if (result.agerange.hasOwnProperty(prop)) {   
	            		    var o={"country":prop,"litres":result.agerange[prop]};
	            		    dataagerange.push(o);
	            		  }  
	            		}  
 	            	showplot();
 	            	
 	            },
 	           	error: function (error) {
 	                noty({ text: "请检查网络！", type: "warning", layout: "topCenter", timeout: 3000 });
 	                console.log("error"); return;
 	            }
 		  });
 	}
 	function showplot(){
 		//年龄范围图
	 		AmCharts.makeChart( "agegraph", {
	 	 		  "type": "pie",
	 	 		  "theme": "light",
	 	 		  "dataProvider":dataagerange,
	 	 		  "valueField": "litres",
	 	 		  "titleField": "country",
	 	 		   "balloon":{
	 	 		   "fixedPosition":true
	 	 		  },
	 	 		  "export": {
	 	 		    "enabled": true
	 	 		  }
	 	 		} );
 		//地址分布图
 	           $.plot($("#addressgraph"), dataaddress, 
 	        		  {
 	        		          series: {
 	        		              pie: { 
 	        		                  show: true,
 	        		                  radius: 1,
 	        		                  tilt: 0.5,
 	        		                  label: {
 	        		                      show: true,
 	        		                      radius: 1,
 	        		                      formatter: function(label, series){
 	        		                          return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
 	        		                      },
 	        		                      background: { opacity: 0.8 }
 	        		                  },
 	        		                  combine: {
 	        		                      color: '#999',
 	        		                      threshold: 0.1
 	        		                  }
 	        		              }
 	        		          },
 	        		          legend: {
 	        		              show: false
 	        		          }
 	        		  });
 		//性别分布图
 	           $.plot($("#sexgraph"), data,
 	        		 {
 	        		         series: {
 	        		             pie: { 
 	        		                 innerRadius: 0.5,
 	        		                 show: true
 	        		             }
 	        		         }
 	        		 }); 
 	}
 	var num = 12;
    var unit = "hour";
    var pageviews = [];
    var visitors = [];
    getData();//趋势图获得数据方法
    $("#chartType").change(function () {
        $('#site_statistics_loading').show();
        $('#site_statistics_content').hide();
        unit = this.value;
        if (this.value == "day") num = 14;
        else num = 12;
        getData();
    });
    function getData() { 	
        $.ajax({
            url: "TrendDateAction_GetTrendData",
            type: "POST",
            data: {
                num: num, unit: unit
            },
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                  //  pageviews = result.ALSM;
                   // alert(pageviews);
                    visitors = result.ALSM;
                    MyChart();
                }
                else {
                    noty({ text: "获取失败", type: "warning", layout: "topCenter", timeout: 3000 }); return;
                }
            },
            error: function (error) {
                noty({ text: "请检查网络！", type: "warning", layout: "topCenter", timeout: 3000 });
                console.log("error"); return;
            }
        });
    }
    function MyChart() {
        if (!jQuery.plot) {
            return;
        }
        var data = [];
        var totalPoints = 250;
        // random data generator for plot charts

        function getRandomData() {
            if (data.length > 0) data = data.slice(1);
            // do a random walk
            while (data.length < totalPoints) {
                var prev = data.length > 0 ? data[data.length - 1] : 50;
                var y = prev + Math.random() * 10 - 5;
                if (y < 0) y = 0;
                if (y > 100) y = 100;
                data.push(y);
            }
            // zip the generated y values with the x values
            var res = [];
            for (var i = 0; i < data.length; ++i) res.push([i, data[i]])
            return res;
        }

        function showTooltip(title, x, y, contents) {
            $('<div id="tooltip" class="chart-tooltip"><div class="date">' + title + '<\/div><div class="label label-success">增长量: ' + contents + '<\/div><\/div>').css({
                position: 'absolute',
                display: 'none',
                top: y - 100,
                width: 75,
                left: x - 40,
                border: '0px solid #ccc',
                padding: '2px 6px',
                'background-color': '#fff'
            }).appendTo("body").fadeIn(200);
        }

        function randValue() {
            return (Math.floor(Math.random() * (1 + 50 - 20))) + 10;
        }

     
        if ($('#site_statistics').size() != 0) {

            $('#site_statistics_loading').hide();
            $('#site_statistics_content').show();

            var plot_statistics = $.plot($("#site_statistics"), [/*  {
                data: pageviews,
                label: "新增代理"
            },  */ {
                data: visitors,
                label: "新增代理"
            } 
            ], {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 2,
                        fill: true,
                        fillColor: {
                            colors: [ {
                                opacity: 0.05
                            }, {
                                opacity: 0.01
                            }
                            ]
                        }
                    },
                    points: {
                        show: true
                    },
                    shadowSize: 2
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                    tickColor: "#eee",
                    borderWidth: 0
                },
                colors: ["#37b7f3","#d12610" , "#52e136"],
                xaxis: {
                    mode: "time",
                    
                    ticks: 11,
                    tickDecimals: 0
                },
                yaxis: {
                    ticks: 11,
                    tickDecimals: 0
                }
            });
            var previousPoint = null;
            $("#site_statistics").bind("plothover", function (event, pos, item) {
                $("#x").text(pos.x.toFixed(2));
                $("#y").text(pos.y.toFixed(2));
              //  alert(item);
                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;
                        //alert(item.datapoint);
                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(2),
                            y = item.datapoint[1].toFixed(2);
                        showTooltip(new Date(item.datapoint[0] - 8 * 60 * 60 * 1000).Format((unit!="month")?"MM月dd日":"MM月"), item.pageX, item.pageY, item.datapoint[1]); //item.series.label + " of " + x + " = " + y);
                    }
                } else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });
        }               
    }
    Date.prototype.Format = function (format) {
    
        var o = {
            "M+": this.getMonth() +1, //month 
            "d+": this.getDate(), //day 
            "h+": this.getHours(), //hour 
            "m+": this.getMinutes(), //minute 
            "s+": this.getSeconds(), //second 
            "q+": Math.floor((this.getMonth() + 3) / 3), //quarter 
            "S": this.getMilliseconds() //millisecond 
        }

        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }

        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    }; 
 	</script>
 </Layout:overwrite>
 
<%@ include file="/share/_Layout.jsp"%>