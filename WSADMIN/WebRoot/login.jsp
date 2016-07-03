<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>登录</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="Content/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="Content/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<link href="Content/bootstrap/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="Content/bootstrap/style-metro.css" rel="stylesheet" type="text/css"/>
	<link href="Content/bootstrap/style.css" rel="stylesheet" type="text/css"/>
	<link href="Content/bootstrap/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="Content/bootstrap/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="Content/bootstrap/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="Content/bootstrap/login-soft.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="Content/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<img src="Content/image/logo-big.png" alt="" /> 
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form  method="post"> 
			<h3 class="form-title" style="text-align: center;">管理员登录</h3>
			<div class="alert alert-error" id="errorplace" style="display:none;">
				<button class="close" data-dismiss="alert"></button>
				<span>Incorrect username or password.</span>
			</div>

			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Username" id="adminname" value="xiaonima"/>
					</div>
					<span id="spanadminname" style="color:red;"></span>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="password" placeholder="Password" id="adminpassword" name="admin.adminpassword" value="xiaonima123"/>
					</div>
					<span id="spanadminpassword" style="color:red;"></span>
				</div>
			</div>

			<div class="form-actions">
				<!-- <label class="checkbox">
				<input type="checkbox" name="remember" value="1"/> Remember me
				</label> -->
				<a  class="btn blue pull-right" onclick="checkLogin()">
				Login <i class="m-icon-swapright m-icon-white"></i>
				</a>            
			</div>

		</form>

		<!-- END LOGIN FORM -->        

	
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<script src="Scripts/bootstrap/jquery-1.9.1.js" type="text/javascript"></script>
	<script src="Scripts/bootstrap/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>      
	<script src="Scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="media/js/excanvas.min.js"></script>
	<script src="media/js/respond.min.js"></script>  
	<![endif]-->   
	<!-- <script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script> -->
	<script src="Scripts/bootstrap/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="Scripts/bootstrap/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="Scripts/bootstrap/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="Scripts/jquery.validate.min.js" type="text/javascript"></script>
	<script src="Scripts/bootstrap/jquery.backstretch.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="Scripts/bootstrap/app.js" type="text/javascript"></script>
 	<script src="Scripts/bootstrap/login-soft.js" type="text/javascript"></script>  
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script>
		jQuery(document).ready(function() {     
		  App.init();
		  jQuery('.register-form').show();
		   $.backstretch([
		  		        "Content/image/bg/1.jpg",
		  		        "Content/image/bg/2.jpg",
		  		        "Content/image/bg/3.jpg",
		  		        "Content/image/bg/4.jpg"
		  		        ], {
		  		          fade: 1000,
		  		          duration: 8000
		  		      });

		});
		$("#adminname").keyup(function(){
			var adminname=$("#adminname").val().trim();
			if(adminname==""||adminname.length<=0){
				$("#spanadminname").html("Username is required!");
				return;
			}else{
				$("#spanadminname").html("");
			}
		})
		$("#adminpassword").keyup(function(){
			var adminpassword=$("#adminpassword").val().trim();
			if(adminpassword==""||adminpassword.length<=0){
				$("#spanadminpassword").html("Password is required!");
				return;
			}else{
				$("#spanadminpassword").html("");
			}
		})
		function checkLogin(){
			var adminname=$("#adminname").val().trim();
			if(adminname==""||adminname.length<=0){
				$("#spanadminname").html("Username is required!");
				return;
			}else{
				$("#spanadminname").html("");
			}
			var adminpassword=$("#adminpassword").val().trim();
			if(adminpassword==""||adminpassword.length<=0){
				$("#spanadminpassword").html("Password is required!");
				return;
			}else{
				$("#spanadminpassword").html("");
			}
			$.ajax({
	            url: "AdminAction_checkAdmin",
	            type: "POST",
	            data: {"admin.adname":adminname,"admin.adpassword":adminpassword },
	            dataType: "json",
	            success: function (result) { 
	            	if(result.code==1){
	            		location.href="home/index.jsp";
	            	}else{
	            		$("#errorplace").show();
	            	}
	            },
	            error: function () {
	                console.log("error");
	            }
			});
		} 
	</script>
	<!-- END JAVASCRIPTS -->
<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>
<!-- END BODY -->
</html>