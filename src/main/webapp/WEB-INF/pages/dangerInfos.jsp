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
<link rel="icon" href="img/wdt.jpg" type="image/x-icon" > 
<title>报警记录</title> 
<link rel="stylesheet" href="css/index.css"/> 
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="js/paging.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$(".go").click(function(){
    			var pageNum=$("#pageNum").val();
    			var ip=$("#ip").val();
    			location="<%=basePath%>pow/dangerInfos?pageNum="+pageNum+"&ip="+ip;
    		})
    		$(".info").click(function(){
    			var ip=$(this).parent().parent().find("td").eq(0).text();
    			var warntime=$(this).parent().parent().find("td").eq(1).text();
    			var guzhang=$(this).parent().parent().find("td").eq(3).text();
    			if(guzhang=="三大故障"){
    				location="<%=basePath%>pow/warnAll?ip="+ip+"&warntime="+warntime; 
    			}
    			if(guzhang=="保护故障"){
    				location="<%=basePath%>pow/pro?ip="+ip+"&warntime="+warntime;
    			}
    			if(guzhang=="告警故障"){
    				location="<%=basePath%>pow/warn?ip="+ip+"&warntime="+warntime; 
    			}
    			if(guzhang=="其他故障"){
    				location="<%=basePath%>pow/other?ip="+ip+"&warntime="+warntime;
    			}
    			if(guzhang=="保护故障和告警故障"){
    				location="<%=basePath%>pow/proAndWarn?ip="+ip+"&warntime="+warntime;
    			}    
    			if(guzhang=="告警故障和其他故障"){
    				location="<%=basePath%>pow/warnAndOther?ip="+ip+"&warntime="+warntime;
    			}
    			if(guzhang=="保护故障和其他故障"){
    				location="<%=basePath%>pow/proAndOther?ip="+ip+"&warntime="+warntime;
    			}
    		})
    	})
    </script>
</head>
<body style="background-color: #FCFCFC;">
		<div class="nav-main"  style="margin-right: 10px;"> 
			<div class="nav-box"> 
				<div class="nav">  
					  <ul class="nav-ul" >   
					  	<li ><a href="pow/dangerInfo" class="home"><span style="font-size: 18px; ">首页</span></a></li>
					  	<li ><a href="pow/jiqiInfos" class="develop"><span style="font-size: 18px;">控制台</span></a></li> 
					  	<li style="background: #629feb"><a href="pow/dangerInfos" class="develop"><span style="font-size: 18px;">报警记录</span></a></li>
					  </ul>
				</div>
			</div>
		</div> 
	<div style="width: 70%;margin: 0 auto;">
		<form action="pow/dangerInfos" method="post" style="margin-top: 80px;text-align: center;">
			<div class="input-group" style="margin: 0 auto;">
			      <input type="text" name = "ip" id="ip" class="form-control" placeholder="输入机器名" value="${ip}"  style="width: 300px;height: 50px; ">
			      <div class="input-group-addon"  style="width: 100px;color: white;background-color: #7266ba;font-size:18px;">
			      <button type="submit" style="background-color: #7266ba;  width: 100px;border:none;height: 30px;">查&nbsp;找</button> 
			      </div>
			</div>  
			<br/>
			<table class="table table-bordered" >
				<tr >
				  <td class="info" style="font-size: 20px;">ip</td>
				  <td class="info" style="font-size: 20px;">报警时间</td> 
				  <td class="info" style="font-size: 20px;">管理器温度</td>
				  <td class="danger" style="font-size: 20px;">故障类型</td> 
				  <td class="info" style="font-size: 20px;">操作</td>
				</tr>
			<c:forEach items="${page.list}"  var="page">
				<tr>
				  <td class="" style="line-height:35px;font-size: 17px; ">${page.ip }</td> 
				  <td class="" style="line-height:35px;font-size: 17px; ">${page.warntime }</td>
				  <td class="" style="line-height:35px ;font-size: 17px;">${page.glqtemp }</td>
				  <c:if test="${page.prostatus==1&&page.warnstatus==0&&page.otherstatus==0 }">
				  <td class="" style="line-height:35px;font-size: 17px; ">保护故障</td>   
				  </c:if>
				  <c:if test="${page.prostatus==0&&page.warnstatus==1&&page.otherstatus==0 }">
				  <td class="" style="line-height:35px;font-size: 17px; ">告警故障</td> 
				  </c:if>
				  <c:if test="${page.prostatus==0&&page.warnstatus==0&&page.otherstatus==1 }">
				  <td class="" style="line-height:35px;font-size: 17px; ">其他故障</td> 
				  </c:if>
				  <c:if test="${page.prostatus==1&&page.warnstatus==1&&page.otherstatus==0 }">
				  <td class="" style="line-height:35px;font-size: 17px; ">保护故障和告警故障</td> 
				  </c:if>
				  <c:if test="${page.prostatus==1&&page.warnstatus==1&&page.otherstatus==1 }">
				  <td class="" style="line-height:35px ;font-size: 17px; ">三大故障</td> 
				  </c:if>
				  <c:if test="${page.prostatus==0&&page.warnstatus==1&&page.otherstatus==1 }">
				  <td class="" style="line-height:35px;font-size: 17px; ">告警故障和其他故障</td> 
				  </c:if>
				  <c:if test="${page.prostatus==1&&page.warnstatus==0&&page.otherstatus==1 }">
				  <td class="" style="line-height:35px;font-size: 17px; ">保护故障和其他故障</td> 
				  </c:if>
				  <td class="" style="line-height:35px;font-size: 17px; ">
				  	<button class="btn btn-danger info" type="button">查看详细</button>
				  </td>
				</tr>
			</c:forEach>
			</table>
			<div id="pages">
					<div class="form-inline" >  
					<a href="pow/dangerInfos?pageNum=1&ip=${ip}" class="btn btn-primary">首页</a> 
					<a href="pow/dangerInfos?pageNum=${page.pageNum-1}&ip=${ip}" class="btn btn-primary"><span class="glyphicon glyphicon-backward" aria-hidden="true"></span>&nbsp;上一页</a> 
					<a href="pow/dangerInfos?pageNum=${page.pageNum+1}&ip=${ip}" class="btn btn-primary" class="btn btn-primary">下一页&nbsp;<span class="glyphicon glyphicon-forward" aria-hidden="true"></span></a>
					<a href="pow/dangerInfos?pageNum=${page.totalPage}&ip=${ip}" class="btn btn-primary" class="btn btn-primary">尾页</a>  
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
	</div> 
</body>
</html>