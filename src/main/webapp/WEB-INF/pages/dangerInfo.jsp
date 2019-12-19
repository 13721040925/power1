<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<link rel="icon" href="img/wdt.jpg" type="image/x-icon" > 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>故障分析</title>
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="css/animsition.min.css" />
<link rel="stylesheet" href="css/drop-down.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/system.css" /> 
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/index.css"/>
</head>
<body>
	<div class="data_wrap" style="background: #efeff5; width: 1040px; padding: 10px; overflow: hidden;"> 
		    <div class="animsition">
				<div style="background: white; solid #efeff5; width: 1020px; overflow: hidden;">
					<div id="main" style="height:350px; width: 1000px; float: left;"></div>
					<div id="main2" style="height:350px; width: 305px; float: left;"></div>
					<div class="row" >
	                    <div class="col-sm-7" style="margin-top: 20px;">
	                        <div class="row row-sm text-center" >
	                            <div class="col-xs-6">
	                                <div class="panel padder-v item" style="height: 138px;background-color: #4390EE;">
	                                    <div class="h1 text-info font-thin h1" style="color: white;">${otherCount }</div>
	                                    <span class="text-muted text-xs">其他故障</span>
	                                </div>
	                            </div>
	                            <div class="col-xs-6">
	                                <div class="panel padder-v item bg-info"style="height: 138px">
	                                    <div class="h1 text-fff font-thin h1">${proCount}</div>
	                                    <span class="text-muted text-xs">保护故障</span>
	                                </div>
	                            </div>
	                            <div class="col-xs-6">
	                                <div class="panel padder-v item bg-primary" style="height: 138px">
	                                    <div class="h1 text-fff font-thin h1">${warnCount }</div>
	                                    <span class="text-muted text-xs">报警故障</span>
	                                </div>
	                            </div> 
	                            <div class="col-xs-6">
	                                <div class="panel padder-v item" style="height: 138px;background-color: #d9534f;color: white;">
	                                    <div class="font-thin h1">${allWarnCounts }</div> 
	                                    <span class="text-muted text-xs">总报警数</span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</div>
		    </div>
		   <!--  <form action="pow/upload" method="post" enctype="multipart/form-data"> 
		    	<input type="file"  name="file" id="picpath" />  
		    	<button class="btn btn-info">上传</button>
		    </form> 
		    <img alt="" src="E:/java项目/maven/power/power/src/main/webapp/img/wdt.jpg"> -->
		</div>
		<div class="nav-main"  style="margin-right: 10px;"> 
			<div class="nav-box"> 
				<div class="nav">   
					  <ul class="nav-ul" >  
					  	<li style="background: #629feb"><a href="pow/dangerInfo" class="home"><span style="font-size: 18px; ">首页</span></a></li>
					  	<li ><a href="pow/jiqiInfos" class="develop"><span style="font-size: 18px;">控制台</span></a></li>
					  	<li ><a href="pow/dangerInfos" class="develop"><span style="font-size: 18px;">报警记录</span></a></li>
					  </ul>
				</div> 
			</div> 
		</div>
		<script type="text/javascript" src="js/jquery-3.0.0.js" ></script>
		<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
		<script src="http://www.jq22.com/jquery/jquery-ui-1.11.0.js"></script>
		<script src="js/select-widget-min.js"></script>
		<script src="js/jquery.animsition.min.js"></script>
		<script src="https://cdn.bootcss.com/echarts/3.5.3/echarts.min.js"></script>
		<script src="js/macarons .js"></script>
		<script src="js/common.js"></script>
		<script src="js/dangerInfo.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			  //初始化切换
			  $(".animsition").animsition({
			  
			    inClass               :   'fade-in-right',
			    outClass              :   'fade-out',
			    inDuration            :    1500,
			    outDuration           :    800,
			    linkElement           :   '.animsition-link',
			    // e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'
			    loading               :    true,
			    loadingParentElement  :   'body', //animsition wrapper element
			    loadingClass          :   'animsition-loading',
			    unSupportCss          : [ 'animation-duration',
			                              '-webkit-animation-duration',
			                              '-o-animation-duration'
			                            ],
			    //"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
			    //The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
			    
			    overlay               :   false,
			    
			    overlayClass          :   'animsition-overlay-slide',
			    overlayParentElement  :   'body'
			  });
			  
			   // 基于准备好的dom，初始化echarts实例
		        var myChart = echarts.init(document.getElementById('main'),'macarons');
				var myChart2 = echarts.init(document.getElementById('main2'),'macarons');
				var otherCount=${otherCount };/*其他故障 */
				var proCount=${proCount};/*保护故障 */
				var warnCount=${warnCount };/*告警故障  */
				var allWarnCounts=${allWarnCounts }/*报警总数 */
		        // 指定图表的配置项和数据
		        /*横坐标值*/  
				var arr = ['${arr[29]}','${arr[28]}','${arr[27]}','${arr[26]}','${arr[25]}','${arr[24]}','${arr[23]}','${arr[22]}','${arr[21]}','${arr[20]}',
				'${arr[19]}','${arr[18]}','${arr[17]}','${arr[16]}','${arr[15]}','${arr[14]}','${arr[13]}','${arr[12]}','${arr[11]}','${arr[10]}',
				'${arr[9]}','${arr[8]}','${arr[7]}','${arr[6]}','${arr[5]}','${arr[4]}','${arr[3]}','${arr[2]}','${arr[1]}','${arr[0]}'];
				
				/*纵坐标值*/
				function my_data(){
					var data = [];
					data[0]=${arry[0]};
					data[1]=${arry[1]};
					data[2]=${arry[2]};
					data[3]=${arry[3]};
					data[4]=${arry[4]};
					data[5]=${arry[5]};
					data[6]=${arry[6]};
					data[7]=${arry[7]};
					data[8]=${arry[8]};
					data[9]=${arry[9]};
					data[10]=${arry[10]};
					data[11]=${arry[11]};
					data[12]=${arry[12]};
					data[13]=${arry[13]};
					data[14]=${arry[14]};
					data[15]=${arry[15]};
					data[16]=${arry[16]};
					data[17]=${arry[17]};
					data[18]=${arry[18]};
					data[19]=${arry[19]};
					data[20]=${arry[20]};
					data[21]=${arry[21]};
					data[22]=${arry[22]};
					data[23]=${arry[23]};
					data[24]=${arry[24]};
					data[25]=${arry[25]};
					data[26]=${arry[26]};
					data[27]=${arry[27]};
					data[28]=${arry[28]};
					data[29]=${arry[29]}; 
					/* for( var i =0; i<30; i++){
						data[i]=${arry[i]};  
					};   */
					return data;
				}
				
				var option = {
				    tooltip: { 
				        trigger: 'axis',
				        /*formatter: function(data){
				        	//console.log(data)
				        	 myChart.setOption({
						        title : {
							        text: '会员数量' + data.value,
							    }
						    });
							
						   return data.name + '</br>' + '新增数：' + data.value + '</br>';
						}*/
				        
				    },
				    title: {
				        text: '报警总数',/*历史记录以来*/
				        /*subtext: '昨日新增：',
				        subtextStyle: {
							fontSize:14,
							color : '#ff4a84'
						}*/
				    },
				     
				    toolbox: {
				        show : true,
				         feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: true},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {}
				        }
				    },
				    calculable : true,
				    xAxis: {
				        type : 'category',
				        boundaryGap : false,
				        data : arr
				    },
				    yAxis: {
				        type: 'value',
				        boundaryGap: [0, '100%']
				    },
				    dataZoom: [{
				        type: 'inside',
				        start: 84,
				        end: 100
				    }, {
				        start: 84,
				        end: 100,
				        handleSize: '80%',
				        handleStyle: {
				            color: '#fff',
				            shadowBlur: 3,
				            shadowColor: 'rgba(0, 0, 0, 0.6)',
				            shadowOffsetX: 2,
				            shadowOffsetY: 2
				        }
				    }],
				    /*时间视图*/
				    series: [
				        {
				            name:'报警数',
				            type:'line',
				            smooth:true,
				            itemStyle: {
				                normal: {
				                    color: 'rgb(255, 70, 131)'
				                }
				            },
				            areaStyle: {
				                normal: {
				                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				                        offset: 0,
				                        color: 'rgb(255, 158, 68)'
				                    }, {
				                        offset: 1,
				                        color: 'rgb(255, 70, 131)'
				                    }])
				                }
				            },
				            data : my_data()
				        }
				    ]
				};

				var option2 = {
				    tooltip: {
				        trigger: 'item',
				        formatter: function(data){
				        	//console.log(data)
							 /*myChart.setOption({
						        title : {
							        text: '报警数量' + data.value,
							    } 
						    });*/
							return data.name + '</br>' + '报警总数：' + data.value + '</br>占比：' + data.percent + '%'+'</br>';
						}
				    },
				    toolbox: {
				        show : true,
				         feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    legend: {
				    	orient: 'horizontal', // 'vertical'
				    	icon:'pie',
				       // orient: 'vertical',
				        x: 'right',
				        y: 'bottom',
				        selectedMode:true,
				        data:['保护故障','其他故障','告警故障']
				    }, 
				    /*数据视图*/
				    series: [
				        {
				            name:'各种报警次数',
				            center:['50%','50%'],
				            type:'pie',
				            radius: ['50%', '65%'],
				            avoidLabelOverlap: false,
				            label: {
				                normal: {
				                    show: false,
				                    position: 'center',
				                },
				                emphasis: {
				                    show: true,
				                    textStyle: {
				                        fontSize: '20',
				                        fontWeight: 'bold'
				                    }
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false
				                }
				            },
				            data:[
				                {value:proCount, name:'保护故障'},
				                {value:otherCount, name:'其他故障'},
				                {value:warnCount, name:'告警故障'}  
				                /*{value:135, name:'VIP会员'},
				                {value:1548, name:'超级VIP会员'}*/
				            ]
				        }
				    ]
				};
				
		        // 使用刚指定的配置项和数据显示图表。
		        myChart.setOption(option); 
			 	myChart2.setOption(option2);
			 	
			});
			
		</script>
</body>
</html>