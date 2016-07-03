<!-- 
		这是自定义标签模板，如果用不到哪个标签请删除，不然会报错
 -->
<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
I am title
</Layout:overwrite>
<%-- <Layout:overwrite name="Mycss"></Layout:overwrite> --%>

<Layout:overwrite name="MyContent">
<form action="testaction_upload2" method="post" enctype="multipart/form-data">
  		上传文件1：<input type="file" name="upload"><br>
  		<input type="submit" value="提交">${result}
  	</form>
  <input type="file" id="file1" name="file" />
			</br>
			<input type="file" id="file2" name="file" />
			</br>
			<input type="file" id="file3" name="file" />
			<input type="button" onclick="fileUpload();" value="上传"> 
			<table id="down">
				</table>
</Layout:overwrite>
 <Layout:overwrite name="MyScript">
 <script src="Scripts/bootstrap/ajaxfilesupload.js"></script>
 <script>
 function fileUpload() {
			var files = [ 'file1', 'file2', 'file3' ];  //将上传三个文件 ID 分别为file2,file2,file3
			$.ajaxFileUpload( {
				url : 'testaction_fileUpload',     //用于文件上传的服务器端请求地址  
				secureuri : false,            //一般设置为false  
				fileElementId : files,        //文件上传空间的id属性  <input type="file" id="file" name="file" />  
				dataType : 'json',            //返回值类型 一般设置为json  
				success : function(data) {
					alert(data.code);
					alert(data.filePath);
					var filePaths = data.filePath;     //返回的文件地址 
					for(var i=0;i<data.filePaths.length;i++){
						//将上传后的文件 添加到页面中 以进行下载
						$("#down").after("<tr><td height='25'>"+filePaths[i]+
								"</td><td><a href='downloadFile?downloadFilePath="+filePaths[i]+"'>下载</a></td></tr>")
					}
				}
			})
		}

 
   </script>
</Layout:overwrite> 
<%@ include file="/share/_Layout.jsp"%>
  
