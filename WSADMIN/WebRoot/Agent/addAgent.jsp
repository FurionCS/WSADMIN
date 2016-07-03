
<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
添加代理
</Layout:overwrite>
<Layout:overwrite name="Mycss">
<link href="Content/bootstrap/datepicker.css" rel="stylesheet" />
<link href="Content/bootstrap/datetimepicker.css" rel="stylesheet" />
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
				<a href="javascript:void(0)">代理管理</a> 
				<i class="icon-angle-right"></i>
			</li>
			<li>
				<a href="javascript:void(0)">新增代理</a>
			</li>
		</ul>
	</div>
	<div class="row-fluid">

		<div class="span12">

			<!-- BEGIN SAMPLE FORM PORTLET-->

			<div class="portlet box blue">

				<div class="portlet-title">

					<div class="caption">
						<i class="icon-reorder"></i>填写代理信息
					</div>

					<div class="tools">
						<a href="javascript:;" class="collapse"></a> 
					</div>

				</div>

				<div class="portlet-body form">

					<!-- BEGIN FORM-->

					<form action="#" class="form-horizontal">
						<div class="control-group">
							<label class="control-label">*姓名</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agname" />
									<span id="sagname" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">*微信号</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agwxnum" />
									<span id="sagwxnum" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">*性别</label>
							<div class="controls">
								<label class="radio">
									<div class="radio">
										<span><input type="radio" name="aggender" value="1" checked=""></span>
									</div> 男
								</label> 
								<label class="radio">
									<div class="radio">
										<span class="checked"><input type="radio" name="aggender" value="0" ></span>
									</div> 女
								</label> 
							</div>
						</div>
						<!-- <div class="control-group">
							<label class="control-label">*地址</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agaddress" />
									<span id="sagaddress" class="help-inline" style="color:red;"></span>
							</div>
						</div> -->
						 <div class="control-group">
                            <label class="control-label" >*地址</label>
                            <div class ="controls" >
						      <select class="select small-mrap" tabindex="1"   name="province" id="s1">
						       <option></option>
						      </select>
						      <select class="select  small-mrap" tabindex="1"  name="city" id="s2">
						       <option></option>
						      </select>
						      <select class="select  small-mrap" tabindex="1"  name="town" id="s3">
						       <option></option>
						      </select>
						      <span id="sagaddress" class="help-inline" style="color:red;"></span>
								</div>
                        </div>
						<div class="control-group">
							<label class="control-label">*年龄</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agage" />
									<span id="sagage" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">*身份证</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agidcard" />
									<span id="sagidcard" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">*电话</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agtel" />
									<span id="sagtel" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">*密码</label>
							<div class="controls">
								<input type="password" class="span6 m-wrap popovers" id="agpassword" />
									<span id="sagpassword" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">上家微信号</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agpid" style="display: none;"/>
								<input type="text" class="span6 m-wrap popovers" id="agpname" placeholder="若没有上家，可不用填写"/>
									<span id="sagpname" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">*等级</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="aglevel"  placeholder="请填写0以上的整数（如：0代表总代，1代表一级代理...）"/>
									<span id="saglevel" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">*授权号</label>
							<div class="controls">
								<input type="text" class="span6 m-wrap popovers" id="agauthorization" />
									<span id="sagauthorization" class="help-inline" style="color:red;"></span>
							</div>
						</div>
						<div class="control-group">
                            <label class="control-label">*授权结束时间</label>
                            <div class="controls">
                                <input type="text" class="span6 m-wrap popovers" id="agdeadline" placeholder="请选择授权结束时间" />
                                	<span id="sagdeadline" class="help-inline" style="color:red;"></span>
                            </div>
                        </div>

						<div class="control-group">
							<label class="control-label">*类型</label>
							<div class="controls">
								<select data-placeholder="Your Favorite Type of Bear" class="chosen-with-diselect span6" tabindex="-1" id="agtype">
									<option value="2">个人</option>
									<option value="1">个体户</option>
									<option value="0">公司</option>
								</select>
							</div>
						</div>																														
						<div class="form-actions">

							<button type="button" class="btn blue" onclick="checkAdd()">保存</button>
							<button type="reset" class="btn">清空</button>

						</div>

					</form>

					<!-- END FORM-->

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
 <script type="text/javascript" src="js/addressCN.js"></script>
   <script>
   setup();
   preselect('浙江省');
   //初始化时间下拉框
   $('#agdeadline').datetimepicker({
       minView: "month",
       format: 'yyyy-mm-dd',
       language: 'zh-CN'
   });
   		//添加验证
		$("#agname").keyup(function(){
			var name=$("#agname").val().trim();
			if(!checkCName(name)){
				$("#sagname").html("请填写2-4个字的中文姓名！");
				return;
			}else{
				$("#sagname").html("");
			}
		})  
		
		$("#agwxnum").keyup(function(){
			var agwxnum=$("#agwxnum").val().trim();
			if(!checkwx(agwxnum)){
				$("#sagwxnum").html("请填写正确的微信号");
				return;
			}else{
				$("#sagwxnum").html("");
			}
		}) 
		
		/* $("#agaddress").keyup(function(){
			var agaddress = $("#agaddress").val().trim();
			if(agaddress==""||agaddress.length<=0){
				$("#sagaddress").html("请填写地址");
				return;
			}else{
				$("#sagaddress").html("");
			}
		}) */ 
		
		$("#agage").keyup(function(){
			var agage=$("#agage").val().trim();
			if(!chekcLevel(agage)){
				$("#sagage").html("请填写岁数（数字）");
				return;
			}else{
				$("#sagage").html("");
			}
		}) 

		$("#agidcard").keyup(function (e) {
			    var text = "";
			    if (this.value =="") {
			        $("#sagidcard").html("请输入身份证号");
			    }
			    else if ( (text=checkIdcard(this.value))!= true) {
			        $("#sagidcard").html(text);
			    }
			    else {
			        $("#sagidcard").html("");
			    }
			});

		$("#agtel").keyup(function(){
			var agtel=$("#agtel").val().trim();
			if(!checkMobile(agtel)){
				$("#sagtel").html("请填写正确的手机号码");
				return;
			}else{
				$("#sagtel").html("");
			}
		}) 		
	
		$("#agpassword").keyup(function(){
			var agpassword = $("#agpassword").val().trim();
			if(agpassword==""||agpassword.length<=0){
				$("#sagpassword").html("请填写密码");
				return;
			}else{
				$("#sagpassword").html("");
			}
		}) 
			
		function checkPWX(agwxnum){
			 $.ajax({
		            url: "AgentAction_selectAgentid",
		            type: "POST",
		            data: {
		            		"agent.agwxnum":agwxnum
		            	   },
		            dataType: "json",
		            success: function (result) { 
		            	if(result.code==1){
		            		$("#sagpname").html("");
		            		$("#agpid").val(result.pid);
		            	}else{
		            		$("#sagpname").html("请填写上家正确的微信号");
		            	}
		            },
		            error: function () {
		                console.log("error");
		            }
				});
		}
		$("#agpname").blur(function(){
			var agpname=$("#agpname").val().trim();
			if(agpname!=""&&!checkwx(agpname)){
				$("#sagpname").html("请填写上家正确的微信号");
				return;
			}else if(agpname!=""){
				$("#sagpname").html("");
				checkPWX(this.value);
			}else if(agpname==""){
				$("#sagpname").html("");
			}
		}) 
		
		$("#aglevel").keyup(function(){
			var aglevel=$("#aglevel").val().trim();
			if(!chekcLevel(aglevel)){
				$("#saglevel").html("请填写数字");
				return;
			}else{
				$("#saglevel").html("");
			}
		}) 
		
		$("#agauthorization").keyup(function(){
			var agauthorization = $("#agauthorization").val().trim();
			if(agauthorization==""||agauthorization.length<=0){
				$("#sagauthorization").html("请填写授权号");
				return;
			}else{
				$("#sagauthorization").html("");
			}
		}) 
	
		$("#agdeadline").keyup(function(){
			var agdeadline = $("#agdeadline").val().trim();
			if(agdeadline==""||agdeadline.length<=0){
				$("#sagdeadline").html("请选择授权时间");
				return;
			}else{
				$("#sagdeadline").html("");
			}
		}) 
		
    	function checkAdd(){
   			var agwxnum = $("#agwxnum").val().trim();
   			var agname = $("#agname").val().trim();
   			var agtel = $("#agtel").val().trim();
   			var agidcard = $("#agidcard").val().trim();
   			var agpid = $("#agpid").val().trim();
   			var aglevel = $("#aglevel").val().trim();
   			var agauthorization = $("#agauthorization").val().trim();
   			var agpassword = $("#agpassword").val().trim();
   			var agdeadline = $("#agdeadline").val().trim();
   			var agtype = $("#agtype").val();
   			var aggender = $("input[name='gender']:checked").val();
   			var agaddress = $("#s1").val().trim()+$("#s2").val().trim()+$("#s3").val().trim();
   			var agage = $("#agage").val().trim();

   			if (agname == "" || !checkCName(agname)) {
                $("#sagname").text("姓名不符合规则");
                return;
            }   
   			if (agwxnum == "" || !checkwx(agwxnum)) {
                $("#sagwxnum").text("微信号不符合规则");
                return;
            }
   			if (agaddress == "") {
                $("#sagaddress").text("地址不符合规则");
                return;
            }
   			if (agage == "" || !chekcLevel(agage)) {
                $("#sagage").text("年龄不符合规则");
                return;
            }   
   			if (agidcard == "" || (text=checkIdcard(agidcard))!= true) {
                $("#sagidcard").text("身份证不符合规则");
                return;
            }
   			if (agtel == "" || !checkMobile(agtel)) {
                $("#sagtel").text("电话不符合规则");
                return;
            }   
   			if (agpassword == "") {
                $("#sagpassword").text("密码不能为空");
                return;
            }
   			if (aglevel == "" || !chekcLevel(aglevel)) {
                $("#saglevel").text("等级不符合规则");
                return;
            }
   			if (agauthorization == "") {
                $("#sagauthorization").text("授权号不能为空");
                return;
            }   
   			if (agdeadline == "") {
                $("#sagdeadline").text("授权结束时间不能为空");
                return;
            } 
            $.ajax({
	            url: "AgentAction_addAgent",
	            type: "POST",
	            data: {
	            		"agent.agwxnum":agwxnum,
	            		"agent.agname":agname,
	            		"agent.agtel":agtel,
	            		"agent.agidcard":agidcard,
	            		"agent.agpid":agpid,
		            	"agent.aglevel":aglevel,
		            	"agent.agauthorization":agauthorization,
		            	"agent.agpassword":agpassword,
		            	"agent.agdeadline":agdeadline,
		            	"agent.agtype":agtype,
		            	"agent.aggender":aggender,
		            	"agent.agaddress":agaddress,
		            	"agent.agage":agage
	            	   },
	            dataType: "json",
	            success: function (result) { 
	            	if(result.code==1){
	            		noty({ text: "添加代理种类成功！", type: "success", layout: "topCenter", timeout: 2000 });
	            		setTimeout(function(){location.href="Agent/AgentList.jsp?active=menupage6_2"}, 2000);
	            	}else{
	            		noty({ text: "添加代理种类失败！", type: "warning", layout: "topCenter", timeout: 2000 });
	            		$("#errorplace").show();
	            	}
	            },
	            error: function () {
	                console.log("error");
	            }
			});
   		} 
   </script>
</Layout:overwrite> 
<%@ include file="/share/_Layout.jsp"%>