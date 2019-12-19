<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html> 
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1" >  
<title>电池信息</title>
	<link rel="stylesheet" href="css/index.css"/> 
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/> 
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <style>
    	#box{   
    		margin-left: 15%;    
    		width: 1100px;
    	}   
    	form input{
    		margin-left: 10px;
    	}
    	label{ 
    		font-size: 15px;
    	}
    	input{
    		text-align: center;
    	}
    </style>  
</head>
<body style="background-color:#F0F0F0;">
	<div class="nav-main"  style="margin-right: 10px;"> 
			<div class="nav-box"> 
				<div class="nav">    
					  <ul class="nav-ul" > 
					  	<li ><a href="pow/dangerInfo" class="home"><span style="font-size: 18px; ">首页</span></a></li>
					  	<li ><a href="pow/jiqiInfos" class="develop"><span style="font-size: 18px;">控制台</span></a></li>
					  	<li style="background: #629feb"><a href="#" class="develop"><span style="font-size: 18px;">电池组</span></a></li>
					  	<li ><a href="pow/dangerInfos" class="develop"><span style="font-size: 18px;">报警记录</span></a></li>
					  </ul>
				</div>
			</div> 
	</div> 
	<div id="box"> 
			<div class="page-header">
				    <h1 style="color:#005AB5;" >${cooperate_name}
				        <small>电池组信息</small>
				    </h1>
			</div>
		<div class="row">
		  <div class="col-sm-12 col-md-12">
		    <div class="thumbnail">
		      <div class="caption" style="margin-top: 20px;margin-left: 20px;">
		      	<c:forEach items="${groupList}" var="list">
					<form class="form-inline">
					  <div class="form-group">   
					    <label style="">电池组名:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.group_name}">
					    <label style="width: 20px;"></label>  
					    <label>单体个数:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.indi_m}">
					    <label style="width: 20px;"></label> 
					    <label>中点电压:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.middle_v}">
					    <label style="width: 20px;"></label>
					    <label>剩余放电时长:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.surplus_time}">
					    <label style="width: 20px;"></label> 
					    <label>温度数:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.indi_n}">
					   	<label style="width: 20px;"></label>  
					   	<label>实际容量:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.group_ah}">
					   	<label style="width: 20px;"></label>  
					    <label>工作电流:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.group_a}">
					   	<label style="width: 20px;"></label>  
					   	<label>工作电压:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.group_v}">
					    <label style="width: 20px;"></label>
					    <label>电池放电时长:</label>
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.group_total_time}">
					    <label style="width: 20px;"></label>    
					    <label style="width: 49px;">DOD:</label> 
					    <input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="${list.dod}">
					    <br/><br/>
			   		  </div>
					</form>
				</c:forEach> 
		      </div>
		    </div>
		     <c:if test="${warnlog.prostatus==0&&warnlog.warnstatus==0&&warnlog.otherstatus==0}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >保护故障</button> 
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#warn" data-backdrop="static" >报警故障</button> 
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
							  <c:if test="${warnlog.prostatus==0&&warnlog.warnstatus==0&&warnlog.otherstatus==1}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#warn"  data-backdrop="static" >报警故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >保护故障</button> 
							  		<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
							  <c:if test="${warnlog.prostatus==0&&warnlog.warnstatus==1&&warnlog.otherstatus==0}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >保护故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#warn" data-backdrop="static" >报警故障</button> 
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
							  <c:if test="${warnlog.prostatus==1&&warnlog.warnstatus==0&&warnlog.otherstatus==0}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >保护故障</button> 
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#warn" data-backdrop="static" >报警故障</button> 
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
							  <c:if test="${warnlog.prostatus==1&&warnlog.warnstatus==1&&warnlog.otherstatus==0}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >保护故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#warn" data-backdrop="static" >报警故障</button> 
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
							  <c:if test="${warnlog.prostatus==1&&warnlog.warnstatus==0&&warnlog.otherstatus==1}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >保护故障</button> 
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#warn" data-backdrop="static" > 报警故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
							  <c:if test="${warnlog.prostatus==1&&warnlog.warnstatus==1&&warnlog.otherstatus==1}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >保护故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#warn" data-backdrop="static" >报警故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
							  <c:if test="${warnlog.prostatus==0&&warnlog.warnstatus==1&&warnlog.otherstatus==1}">
							  <div style="text-align: right;">
									<button class="btn" style="background: #4390EE  ;color: white;" type="button" data-toggle="modal" data-target="#proModal" data-backdrop="static" >保护故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#warn" data-backdrop="static" >报警故障</button> 
									<button class="btn" style="background: #CA4040  ;color: white;" type="button" data-toggle="modal" data-target="#other" data-backdrop="static" >其他故障</button>
							  </div>
							  </c:if>
		  </div>
		</div>
	</div>
	<!-- 保护故障Modal -->
	<div class="modal fade" id="proModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg"  style="width: 860px;" role="document">
	    <div class="modal-content" >
	      <div class="modal-header" >
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h2 class="modal-title" id="myModalLabel" style="color:#005AB5;">${cooperate_name}-保护故障</h2>
	      </div>
	      <div class="modal-body" >
	        <div class="row">
			  <div class="col-sm-12 col-md-12">
			    <div class="thumbnail">
			      <div class="caption" style="margin-top: 20px;margin-left: 50px;">
			      <c:forEach items="${proList}" var="list">
			      <form class="form-inline">
					<div class="form-group">  
				      	<label style="color:">电池组名:</label>
						<input type="text" style="width: 180px;" disabled="disabled" class="form-control" id="" value="${list.group_name}">
						<label style="width: 20px;"></label>
						<c:if test="${list.lipower==0}">
							<label style="color:">锂电电池:</label>
							<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
							<label style="width: 20px;"></label> 
						</c:if>
						<c:if test="${list.lipower==1}">
							<label style="color:">锂电电池:</label>
							<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="电池失效">
							<label style="width: 20px;"></label> 
						</c:if>
						<c:if test="${list.powervhigher==0&&list.powervlower==0}"> 
							<label style="width: 94px;">电池电压:</label>
							<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
							<label style="width: 20px;"></label> 
						</c:if> 
						<c:if test="${list.powervhigher==1&&list.powervlower==0}"> 
							<label style="width: 94px;">电池电压:</label> 
							<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="过压保护">
							<label style="width: 20px;"></label> 
						</c:if>
						<c:if test="${list.powervhigher==0&&list.powervlower==1}"> 
							<label style="width: 94px;">电池电压:</label>
							<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="欠压保护">
							<label style="width: 20px;"></label> 
						</c:if>
						<br/> 
						<label style="color:">更新时间:</label>
						<input type="text" style="width: 180px;" disabled="disabled" class="form-control" id="" value="${list.warntime}">
						<label style="width: 20px;"></label> 
						<c:if test="${list.templower==0&&list.temphigher==0}">
							<label style="color:">电池温度:</label>
							<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
							<label style="width: 20px;"></label>
						</c:if>
						<c:if test="${list.templower==0&&list.temphigher==1}">
							<label style="color:">电池温度:</label>
							<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="温度过高">
							<label style="width: 20px;"></label>
						</c:if>
						<c:if test="${list.templower==1&&list.temphigher==0}">
							<label style="color:">电池温度:</label>
							<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="温度过低">
							<label style="width: 20px;"></label>
						</c:if>
						<c:if test="${list.indivhigher==0&&list.indivlower==0}">
							<label style="color:">单体电池电压:</label>
							<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
							<label style="width: 20px;"></label> 
						</c:if>
						<c:if test="${list.indivhigher==0&&list.indivlower==1}">
							<label style="color:">单体电池电压:</label>
							<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="电压过低">
							<label style="width: 20px;"></label> 
						</c:if>
						<c:if test="${list.indivhigher==1&&list.indivlower==0}">
							<label style="color:">单体电池电压:</label>
							<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="电压过高">
							<label style="width: 20px;"></label> 
						</c:if>
						<br/><br/>
					</div>
				  </form>
			      </c:forEach>
			      </div>
			    </div>
			  </div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 报警故障Modal -->
	<div class="modal fade" id="warn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg" role="document" style="width: 1020px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h2 class="modal-title" id="myModalLabel" style="color:#005AB5;">${cooperate_name}-报警故障</h2>
	      </div>
	      <div class="modal-body">
	        <div class="row">
			  <div class="col-sm-12 col-md-12">
			    <div class="thumbnail">
			      <div class="caption" style="margin-top: 20px;margin-left: 20px;">
			       	 <c:forEach items="${warnList}" var="list">
			      	 <form class="form-inline">
			      	 	<div class="form-group">  
					      	<label style="color:">电池组名:</label>
							<input type="text" style="width: 180px;" disabled="disabled" class="form-control" id="" value="${list.group_name}">
							<label style="width: 20px;"></label>
							<c:if test="${list.powerahigher==0 }">
								<label style="color:">电池电流:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.powerahigher==1 }">
								<label style="color:">电池电流:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="电流过大">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.powertemplower==0&&list.powertemphigher==0}">
								<label style="width: 71px;">电池温度:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.powertemplower==1&&list.powertemphigher==0}">
								<label style="width: 71px;">电池温度:</label> 
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="温度过低">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.powertemplower==0&&list.powertemphigher==1}">
								<label style="width: 71px;">电池温度:</label> 
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="温度过高">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.indivhighers==0&&list.indivlowers==0}">
								<label style="color:">单体电池电压:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.indivhighers==1&&list.indivlowers==0}">
								<label style="color:">单体电池电压:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="过压警告">
								<label style="width: 20px;"></label>
							</c:if> 
							<c:if test="${list.indivhighers==0&&list.indivlowers==1}">
								<label style="color:">单体电池电压:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="欠压警告">
								<label style="width: 20px;"></label>
							</c:if>
							<br/>
							<label style="color:">更新时间:</label>
							<input type="text" style="width: 180px;" disabled="disabled" class="form-control" id="" value="${list.warntime}">
							<label style="width: 20px;"></label>
							<c:if test="${list.groupvhigher==0&&list.groupvlower==0}"> 
								<label style="color:">电池电压:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label> 
							</c:if>
							<c:if test="${list.groupvhigher==1&&list.groupvlower==0}">
								<label style="color:">电池电压:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="过压警告">
								<label style="width: 20px;"></label> 
							</c:if>
							<c:if test="${list.groupvhigher==0&&list.groupvlower==1}">
								<label style="color:">电池电压:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="欠压警告">
								<label style="width: 20px;"></label> 
							</c:if>
							<c:if test="${list.bmu==0}">
								<label style="">BMU通讯:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.bmu==1}">
								<label style="">BMU通讯:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="通讯故障">
								<label style="width: 20px;"></label>
							</c:if>
							<br/><br/>
						</div>
			      	 </form>
			      	 </c:forEach>
			      </div>
			    </div>
			  </div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 其他故障Modal -->
	<div class="modal fade" id="other" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h2 class="modal-title" id="myModalLabel"  style="color:#005AB5;">${cooperate_name}-其他故障</h2>
	      </div>
	      <div class="modal-body">
	        <div class="row">
			  <div class="col-sm-12 col-md-12">
			    <div class="thumbnail">
			      <div class="caption" style="margin-top: 20px;margin-left: 40px;">
			       	 <c:forEach items="${otherList}" var="list">
			      	 <form class="form-inline">
			      	 	<div class="form-group">  
					      	<label style="color:">电池组名:</label>
							<input type="text" style="width: 180px;" disabled="disabled" class="form-control" id="" value="${list.group_name}">
							<label style="width: 20px;"></label>
							<c:if test="${list.inpower==0}">
								<label style="color:">充电支路故障:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.inpower==1}">
								<label style="color:">充电支路故障:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="故障">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.middlev==0}">
								<label style="color:">中点电压偏差故障:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.middlev==1}">
								<label style="color:">中点电压偏差故障:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="故障">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.power==0}">
								<label style="color:">电池故障:</label>
								<input type="text" style="width: 180px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.power==1}">
								<label style="color:">电池故障:</label>
								<input type="text" style="width: 180px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="故障">
								<label style="width: 20px;"></label> 
							</c:if>
							<c:if test="${list.outpower==1}">
								<label style="color:">放电支路故障:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="故障">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.outpower==0}">
								<label style="color:">放电支路故障:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.ahlower==0}">
								<label style="color:">剩余容量过低故障:</label>
								<input type="text" style="width: 100px;" disabled="disabled" class="form-control" id="" value="正常">
								<label style="width: 20px;"></label>
							</c:if>
							<c:if test="${list.ahlower==1}">
								<label style="color:">剩余容量过低故障:</label>
								<input type="text" style="width: 100px;background-color:#d9534f;color:white;" disabled="disabled" class="form-control" id="" value="故障">
								<label style="width: 20px;"></label>
							</c:if>
							<br/><br/>
						</div>
			      	 </form>
			      	 </c:forEach>
			      </div>
			    </div>
			  </div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>