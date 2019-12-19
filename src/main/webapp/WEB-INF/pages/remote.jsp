<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%> 
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"> 
<title>遥控操作</title>
<link rel="stylesheet" href="css/index.css"/> 
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<link href="css/bootstrap-select.min.css"> 
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<script type="text/javascript" src="js/bootstrap-select.min.js"></script> 
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript">
    $(function () {
    	$(".seven").click(function(){
    		var checkOne = $(".one").val();
    		var checkTwo = $(".two").val();
    		var checkThree = $(".three").val();
    		/* var checkFour = $(".four").val();
    		var checkFive = $(".five").val();
    		var checkSix = $(".six").val();  */
    	})
    	$(".A1").click(function(){
    		var a=$(this).val();
    		var group=$(this).parent().parent().find("td").eq(0).text();
    		var name=$(this).parent().parent().find("td").eq(1).text();
    		if(a){ 
    			var b=$(this).find("option:selected").text();
    			var val=group+"-"+name+"("+b+")";
    			$("#ip").val(val);
    		}
    	})
    	$(".A2").click(function(){
    		var a=$(this).val();
    		var group=$(this).parent().parent().find("td").eq(0).text();
    		var name=$(this).parent().parent().find("td").eq(3).text();
    		if(a){ 
    			var b=$(this).find("option:selected").text();
    			var val=group+"-"+name+"("+b+")";
    			$("#ip").val(val);
    		}
    	})
    	$(".A3").click(function(){
    		var a=$(this).val();
    		var group=$(this).parent().parent().find("td").eq(0).text();
    		var name=$(this).parent().parent().find("td").eq(5).text();
    		if(a){ 
    			var b=$(this).find("option:selected").text();
    			var val=group+"-"+name+"("+b+")";
    			$("#ip").val(val);
    		}
    	})
    	$(".A4").click(function(){
    		var a=$(this).val();
    		var group=$(this).parent().parent().find("td").eq(0).text();
    		var name=$(this).parent().parent().find("td").eq(7).text();
    		if(a){ 
    			var b=$(this).find("option:selected").text();
    			var val=group+"-"+name+"("+b+")";
    			$("#ip").val(val);
    		}
    	})
    	$(".A5").click(function(){
    		var a=$(this).val();
    		var group=$(this).parent().parent().find("td").eq(0).text();
    		var name=$(this).parent().parent().find("td").eq(9).text();
    		if(a){ 
    			var b=$(this).find("option:selected").text();
    			var val=group+"-"+name+"("+b+")";
    			$("#ip").val(val);
    		}
    	})
    	$(".A6").click(function(){
    		var a=$(this).val();
    		var group=$(this).parent().parent().find("td").eq(0).text();
    		var name=$(this).parent().parent().find("td").eq(11).text();
    		if(a){ 
    			var b=$(this).find("option:selected").text();
    			var val=group+"-"+name+"("+b+")";
    			$("#ip").val(val);
    		}
    	})
    });
    </script>
</head>
<body style="background-color: #F0F0F0;">
<div class="nav-main"  style="margin-right: 10px;"> 
			<div class="nav-box"> 
				<div class="nav">     
					  <ul class="nav-ul" >   
					  	<li ><a href="pow/dangerInfo" class="home"><span style="font-size: 18px; ">首页</span></a></li>
					  	<li ><a href="pow/jiqiInfos" class="develop"><span style="font-size: 18px;">控制台</span></a></li>
					  	<li ><a href="pow/dangerInfos" class="develop"><span style="font-size: 18px;">报警记录</span></a></li>
					 	<li style="background: #629feb"><a href="pow/remote" class="develop"><span style="font-size: 18px;">遥控操作</span></a></li>
					  </ul>
				</div> 
			</div> 
		</div>
		<marquee bgcolor="#5bc0de" behavior="alternate">  
			    <span style="color:white;font-size: 18px;">一次只可设置一个参数</span>
			</marquee>
		<div style="width: 70%;margin: 0 auto;">
			<form action="" method="post" style="margin-top: 50px;text-align: center;">
				<div class="input-group" style="margin: 0 auto;">
				      <input type="text" name = "ip" required id="ip" class="form-control" value="${ip}"  style="width: 300px;font-size:15px;color:#d9534f; height: 50px; ">
				      <div class="input-group-addon"  style="width: 100px;color: white;background-color: #7266ba;font-size:18px;">
				      <button type="button" style="background-color: #7266ba;  width: 100px;border:none;height: 30px;">设&nbsp;置</button> 
				      </div>
				</div>
				<br/>
				<table class="table table-bordered" >
				<tr >
				  <td class="info" style="font-size: 20px;">电池组名</td>
				  <td class="info" style="font-size: 20px;">限流方式</td>
				  <td class="info" style="font-size: 20px;">充电开启/关闭</td> 
				  <td class="info" style="font-size: 20px;">放电开启/关闭</td>
				  <td class="info" style="font-size: 20px;">充电顺序</td>
				  <td class="info" style="font-size: 20px;">放电顺序</td> 
				  <td class="info" style="font-size: 20px;">充放电模式</td>
<!-- 			  <td class="info" style="font-size: 20px;">批量设置</td> -->
				</tr>
				<c:forEach items="${list }" var="list">
					<tr >
						<td style="font-size: 18px;line-height: 50px;" class="first">${list.group_name }</td>
						<td style="font-size: 18px;line-height: 50px;display: none" class="first">限流方式</td>
						<td style="font-size: 18px;line-height: 50px;">
							<select class="btn A1" name="commond_type"style="font-size: 18px;" >
								<option value="">请选择</option>
							    <option class="op" value="1">开启</option>
							    <option class="op" value="0">关闭</option>
							</select> 
						</td>
						<td style="font-size: 18px;line-height: 50px;display: none" class="first">充电</td>
						<td style="font-size: 18px;line-height: 50px;">
							<select class="btn A2" name=""style="font-size: 18px;">
								<option value="">请选择</option>
							    <option  value="1">开启</option>
							    <option  value="0">关闭</option> 
							</select> 
						</td>
						<td style="font-size: 18px;line-height: 50px;display: none" class="first">放电</td>
						<td style="font-size: 18px;line-height: 50px;" >
							<select class="btn A3" name=""style="font-size: 18px;">
								<option value="">请选择</option>
							    <option value="1">开启</option>
							    <option value="0">关闭</option>
							</select> 
						</td>
						<td style="font-size: 18px;line-height: 50px;display: none" class="first">充电顺序</td>
						<td style="font-size: 18px;line-height: 50px;">
							<select class="btn A4" name="" style="font-size: 18px;">
								<option value="">从小到大</option>
							    <option value="1">第一</option>
							    <option value="2">第二</option>
							    <option value="3">第三</option>
							    <option value="4">第四</option>
							    <option value="5">第五</option>
							    <option value="6">第六</option>
							</select> 
						</td>
						<td style="font-size: 18px;line-height: 50px;display: none" class="first">放电顺序</td>
						<td style="font-size: 18px;line-height: 50px;">
							<select class="btn A5" name="" style="font-size: 18px;">
								<option value="">从小到大</option>
							    <option value="1">第一</option>
							    <option value="2">第二</option>
							    <option value="3">第三</option>
							    <option value="4">第四</option>
							    <option value="5">第五</option>
							    <option value="6">第六</option>
							</select> 
						</td>
						<td style="font-size: 18px;line-height: 50px;display: none" class="first">充放电模式</td>
						<td style="font-size: 18px;line-height: 50px;">
							<select class="btn A6" name="" style="font-size: 18px;">
								<option value="">请选择</option>
							    <option value="1" >同充同放</option>
							    <option value="2">同充异放</option>
							    <option value="3">异充同放</option>
							    <option value="4">异充异放</option>  
							</select> 
						</td>
						<%-- <c:if test="${list.name!='1'}">   
							<td style="font-size: 18px;line-height: 50px;">
								<button type="button" class="btn seven">同上</button>
							</td>
						</c:if> --%> 
					</tr>
				</c:forEach>
			</table>
			</form>
		</div>  
</body>
</html>