<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>"> 
<link rel="icon" href="img/wdt.jpg" type="image/x-icon" charset="UTF-8"> 
<title>报警记录</title> 
<link rel="stylesheet" href="css/index.css"/>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript">
    </script>
</head>
<body>
<body style="background-color: #FCFCFC;">
		<div class="nav-main"  style="margin-right: 10px;"> 
			<div class="nav-box"> 
				<div class="nav">  
					  <ul class="nav-ul" >  
					  	<li ><a href="pow/dangerInfo" class="home"><span style="font-size: 18px; ">首页</span></a></li>
					  	<li ><a href="pow/jiqiInfos" class="develop"><span style="font-size: 18px;">控制台</span></a></li> 
					  	<li ><a href="pow/dangerInfos" class="develop"><span style="font-size: 18px;">报警记录</span></a></li>
					  	<li style="background: #629feb"><a href="pow/dangerInfos" class="develop"><span style="font-size: 18px;">报警详细</span></a></li>
					  </ul>
				</div>
			</div>
		</div> 
	<div style="width: 70%;margin: 0 auto;">
		<form action="pow/dangerInfos" method="post" style="margin-top: 130px;text-align: center;">
			<br/>
			<table class="table table-bordered" >
				<tr >
				  <td class="info" style="font-size: 20px;">ip</td>
				  <td class="info" style="font-size: 20px;">报警时间</td> 
				  <td class="info" style="font-size: 20px;">报警电池组</td>
				  <td class="danger" style="font-size: 20px;">故障原因</td> 
				</tr>
				<tr>
					  <td class="" style="line-height:35px;font-size: 17px; ">${pro.ip }</td> 
					  <td class="" style="line-height:35px;font-size: 17px; ">${pro.warntime }</td>
					  <td class="" style="line-height:35px ;font-size: 17px;">${pro.group_name }</td>
					  <c:if test="${pro.lipower==1}">
					  	<td class="" style="line-height:35px ;font-size: 17px;">锂电电池失效</td>
					  </c:if>
					  <c:if test="${pro.templower==1}">
					  	<td class="" style="line-height:35px ;font-size: 17px;">电池温度过低</td>
					  </c:if>
					  <c:if test="${pro.temphigher==1}">
					  	<td class="" style="line-height:35px ;font-size: 17px;">电池温度过高</td>
					  </c:if>
					  <c:if test="${pro.indivhigher==1}">
					  	<td class="" style="line-height:35px ;font-size: 17px;">单体电池过压</td>
					  </c:if>
					  <c:if test="${pro.indivlower==1}">
					  	<td class="" style="line-height:35px ;font-size: 17px;">单体电池欠压</td>
					  </c:if>
					  <c:if test="${pro.powervhigher==1}">
					  	<td class="" style="line-height:35px ;font-size: 17px;">电池过压</td>
					  </c:if>
					  <c:if test="${pro.powervlower==1}">
					  	<td class="" style="line-height:35px ;font-size: 17px;">电池欠压</td> 
					  </c:if>
				</tr>
			</table>
		</form>
	</div> 
</body>
</html>