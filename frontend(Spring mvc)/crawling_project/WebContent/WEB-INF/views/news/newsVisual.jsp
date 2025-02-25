<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../temp/header.jsp"%>
<style>
.highcharts-figure, .highcharts-data-table table {
	min-width: 320px;
	max-width: 800px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #ebebeb;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	font-size: 1.5em;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.highcharts-description {
	margin-bottom: 20px;
}
</style>
<figure class="highcharts-figure">
	<h2>구단을 클릭해보세요!</h2>
	<div id="container"></div>
	<div class="highcharts-description">
		<div id="container1"></div>
	</div>
	<p style="text-align: center; margin-bottom: 50px;">
		<a href="newsList"><i class="fa-solid fa-rotate-left"></i>&nbsp;뉴스
			게시판으로 돌아가기</a>
	</p>
</figure>
<script>
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : 'http://192.168.0.45:9000/teamproject/show_json',
									method : "GET",
									success : function(data) {
										Highcharts
												.chart(
														'container',
														{
															chart : {
																height : '100%'
															},
															colors : [ 'transparent' ]
																	.concat(Highcharts
																			.getOptions().colors),
															title : {
																text : '이번주 HOT Player',
																style: {
																	fontSize: '24px'  // 제목 폰트 크기 변경
																}
															},
															subtitle : {
																text : '7일동안 뉴스에서 <a href="https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)">가장 많이 언급된 선수들</a>',
																style: {
																		fontSize: '18px'  // 부제목 폰트 크기 변경
																}	
															},
															series : [ {
																type : 'sunburst',
																data : data,
																name : 'Root',
																allowDrillToNode : true,
																borderRadius : 3,
																cursor : 'pointer',
																dataLabels : {
																	format : '{point.name}',
																	filter : {
																		property : 'innerArcLength',
																		operator : '>',
																		value : 16
																	},
																	style: {
																		fontSize: '16px'  // 데이터 레이블 폰트 크기 변경
																	}
																},
																levels : [
																		{
																			level : 1,
																			levelIsConstant : false,
																			dataLabels : {
																				filter : {
																					property : 'outerArcLength',
																					operator : '>',
																					value : 64
																				}
																			}
																		},
																		{
																			level : 2,
																			colorByPoint : true
																		},
																		{
																			level : 3,
																			colorVariation : {
																				key : 'brightness',
																				to : -0.5
																			}
																		},
																		{
																			level : 4,
																			colorVariation : {
																				key : 'brightness',
																				to : 0.5
																			}
																		} ]
															} ],
															tooltip : {
																headerFormat : '',
																pointFormat : '<b>{point.parent} {point.name}</b> 선수 언급 수 : <b>{point.value}</b>',
																style: {
																	fontSize: '14px'  // 툴팁 폰트 크기 변경
																}
															}
														});
									}
								});
					});
</script>
<%@include file="../temp/footer.jsp"%>