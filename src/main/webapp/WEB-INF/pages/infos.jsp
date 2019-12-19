<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1" >  
<link rel="icon" href="img/wdt.jpg" type="image/x-icon" >  
<title>电池详细</title>
	<link rel="stylesheet" href="css/index.css"/> 
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="js/paging.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$(".go").click(function(){
    			var pageNum=$("#pageNum").val();
    			var cooperate_name=$("#jiqiname").val();
    			var state=$("#selected").val();  
    			//兼容ie
    			location="<%=basePath%>pow/jiqiInfos?pageNum="+pageNum+"&cooperate_name="+cooperate_name+"&state="+state;
    		})
    		$(".pk").click(function(){ 
        		var cooperate_name=$(this).parent().parent().find("h3").text();
        		location="<%=basePath%>pow/dcInfos?cooperate_name="+cooperate_name;   
    		})
    		$(".remote").click(function(){ 
        		var cooperate_name=$(this).parent().parent().find("h3").text();
        		location="<%=basePath%>pow/remote?cooperate_name="+cooperate_name;   
    		})
		}); 
</script> 
</head>
<body style="background-color: #F0F0F0;"> 
		<form class="form-inline" action="pow/jiqiInfos" method="post" style="text-align: center;margin-left:13% ;width:75%; margin-top: 80px;"><!-- 1420px -->   
		  <div class="form-group" style="margin-bottom: 20px;">
		  			<select  class="btn btn-default"  name="state" id="selected" style="height:50px;font-size:18px;">
						<!-- <option>请选择权限</option> --> 
						<c:if test="${state==''}">   
							<option value="" selected="selected" >全部</option>
							<option value="0">正常</option>   
							<option value="1" style="background-color: #CA4040 ;color:white; ">异常</option> 
						</c:if>
						<c:if test="${state=='0'}">   
							<option value="" >全部</option>
							<option value="0" selected="selected">正常</option>   
							<option value="1" style="background-color: #CA4040 ;color:white;" >异常</option> 
						</c:if>
						<c:if test="${state=='1'}">   
							<option value="" >全部</option> 
							<option value="0" >正常</option>    
							<option value="1" selected="selected" style="background-color: #CA4040 ;color:white;">异常</option> 
						</c:if>
					</select>
			    <div class="input-group">
			      <input type="text" name = "cooperate_name" id="jiqiname" class="form-control" placeholder="输入机器名" value="${cooperate_name}" style="width: 300px;height: 50px; ">
			      <div class="input-group-addon"  style="width: 100px;color: white;background-color: #7266ba;font-size:18px;">
			      <button type="submit" style="background-color: #7266ba;  width: 100px;border:none;height: 30px;">查&nbsp;找</button> 
			      </div>
			    </div>  
		  	</div>
			<div class="row"> 
				<c:forEach items="${page.list}"  var="page"> 
				  <div class="col-sm-6 col-md-3" style="padding-right:4px;width: 20%;"> <!-- width: 282.5px;height:206px; -->
				   <c:if test="${page.state=='1'}"> 
				    <div class="thumbnail" style="background-color:#d9534f;"><!-- width: 263.5px;height:186px; -->
				      <div class="caption" >  
				        <h3 style="color:white;margin-top:10px;">${page.cooperate_name}</h3> 
				        <p>放电倒计时:&nbsp;<span style="color:#FCFCFC">${page.fdtime}</span></p>
				        <p>放电总时长:&nbsp;<span style="color:#FCFCFC">${page.totaltime}</span></p>
				        <p>电池组在线数量:&nbsp;<span style="color:#FCFCFC">${page.onlioncount}</span></p> 
				        <p> 
							<button type="button" class="btn btn-warning pk"  >详细信息</button>
							<button type="button" style="background-color:#FF8604;color:white;" class="btn remote"  >遥控操作</button>  
				        </p> 
				      </div>
				    </div> 
				   </c:if> 
				   <c:if test="${page.state=='0'}"> 
				    <div class="thumbnail" ><!-- style="width: 263.5px;height:186px;" -->
				      <div class="caption"> 
				        <h3 style="color:#005AB5;margin-top:10px;">${page.cooperate_name}</h3> 
				        <p>放电倒计时:&nbsp;<span style="color:#007500">${page.fdtime}</span></p>
				        <p>放电总时长:&nbsp;<span style="color:#007500">${page.totaltime}</span></p>
				        <p>电池组在线数量:&nbsp;<span style="color:#007500">${page.onlioncount}</span></p> 
				        <p>
							<button type="button" class="btn btn-info pk" >详细信息</button>
							<!-- <button type="button" style="background-color:#4390EE;color:white;" class="btn remote"  >遥控操作</button>  -->
				        	<button type="button" class="btn btn-default remote" >遥控操作</button>
				        </p>
				      </div>
				    </div>  
				   </c:if>  
				  </div>
				 </c:forEach>
			</div>
			<div id="pages">
					<div class="form-inline" >  
					<a href="pow/jiqiInfos?pageNum=1&cooperate_name=${cooperate_name}&state=${state}" class="btn btn-primary">首页</a> 
					<a href="pow/jiqiInfos?pageNum=${page.pageNum-1}&cooperate_name=${cooperate_name}&state=${state}" class="btn btn-primary"><span class="glyphicon glyphicon-backward" aria-hidden="true"></span>&nbsp;上一页</a> 
					<a href="pow/jiqiInfos?pageNum=${page.pageNum+1}&cooperate_name=${cooperate_name}&state=${state}" class="btn btn-primary">下一页&nbsp;<span class="glyphicon glyphicon-forward" aria-hidden="true"></span></a>
					<a href="pow/jiqiInfos?pageNum=${page.totalPage}&cooperate_name=${cooperate_name}&state=${state}" class="btn btn-primary">尾页</a>  
						<div class="form-group">
							<input type="text" class="form-control" style="color:#6A6AFF;width: 90px;text-align: center;" disabled="disabled" placeholder="共${page.totalPage}页" >
							<span id="spn">第</span>
							<input type="number" min="1"  value="${page.pageNum}" style="width: 70px;text-align: center;" class="form-control" id="pageNum"/>
							<span id="spn">页</span>
						</div>
						<button type="button" class="go btn btn-success"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;页面跳转</button>  
						<!-- <button type="button" class="checkOutxls btn btn-danger"><span class="glyphicon glyphicon-export" aria-hidden="true"></span>&nbsp;导出Excel</button>  -->
				</div>
			</div> 
		</form>
		<div class="nav-main"  style="margin-right: 10px;"> 
			<div class="nav-box"> 
				<div class="nav">  
					  <ul class="nav-ul" >  
					  	<li ><a href="pow/dangerInfo" class="home"><span style="font-size: 18px; ">首页</span></a></li>
					  	<li style="background: #629feb"><a href="pow/jiqiInfos" class="develop"><span style="font-size: 18px;">控制台</span></a></li>
					  	<li ><a href="pow/dangerInfos" class="develop"><span style="font-size: 18px;">报警记录</span></a></li>
					  </ul>
				</div>
			</div>
		</div>
</body>
</html>