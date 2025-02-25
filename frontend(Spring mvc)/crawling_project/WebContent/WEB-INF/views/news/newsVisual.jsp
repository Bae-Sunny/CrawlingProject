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
	<h2>������ Ŭ���غ�����!</h2>
	<div id="container"></div>
	<div class="highcharts-description">
		<div id="container1"></div>
	</div>
	<p style="text-align: center; margin-bottom: 50px;">
		<a href="newsList"><i class="fa-solid fa-rotate-left"></i>&nbsp;����
			�Խ������� ���ư���</a>
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
																text : '�̹��� HOT Player',
																style: {
																	fontSize: '24px'  // ���� ��Ʈ ũ�� ����
																}
															},
															subtitle : {
																text : '7�ϵ��� �������� <a href="https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)">���� ���� ��޵� ������</a>',
																style: {
																		fontSize: '18px'  // ������ ��Ʈ ũ�� ����
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
																		fontSize: '16px'  // ������ ���̺� ��Ʈ ũ�� ����
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
																pointFormat : '<b>{point.parent} {point.name}</b> ���� ��� �� : <b>{point.value}</b>',
																style: {
																	fontSize: '14px'  // ���� ��Ʈ ũ�� ����
																}
															}
														});
									}
								});
					});
</script>
<%@include file="../temp/footer.jsp"%>