<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%-- ������ --%>
<style>
#record-container {
	padding: 20px;
	position: relative;
	width: 1280px;
	margin-bottom: -80px;
}

.search-button {
	background-color: #000000;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	margin-bottom: 20px;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.search-button2 {
	background-color: #b80c3b;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	margin-bottom: 20px;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.search-button3 {
	background-color: #004aad;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	margin-bottom: 20px;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.record-btn {
	margin: 110px;
}

.search-button:hover {
	background-color: #333333;
	color: #f8f8f8;
	opacity: 0.5;
}

.search-button2:hover {
	background-color: #d11a45;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}

.search-button3:hover {
	background-color: #005bcc;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}
</style>
<section id="records">
	<div class="container">
		<h2>��/���μ���</h2>
		<div id="record-container">
			<div>
				<div id="container" style="min-width: 300px; height: 400px;"></div>
				<div class="record-btn">
					<input type="button" class="search-button" value="���� �·�, �����, ��Ÿ��"
						id="jsonLoad"> <input type="button" class="search-button2"
						value="���� ����(�����å ����)" id="jsonLoad2"> <input
						type="button" class="search-button2" value="���� ����(WHIP ����)"
						id="jsonLoad3"> <input type="button"
						class="search-button3" value="Ÿ�� ����(Ÿ�� ����)" id="jsonLoad4">
					<input type="button" class="search-button3" value="Ÿ�� ����(OPS ����)"
						id="jsonLoad5">
					<div class="target">(����:getCurrentDate())</div>
					<div class="info-provider">
						(��������: <img src="resources/img/naver_logo.png" alt="naver"
							style="width: 80px; margin: auto;"> �߱�)
					</div>
					<p style="text-align: center; margin-bottom: 20px;">
						<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;����ȭ������
							���ư���</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(function() {
		// ������ �ε� �� �ʱ� ��Ʈ ����
		$.ajax({
			url : 'http://192.168.0.45:9000/teamproject/loadJson',
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				var categories = [];
				var winRates = [];
				var onBasePercentages = [];
				var sluggingPercentages = [];

				$.each(data, function(index, item) {
					categories.push(item.��);
					winRates.push(parseFloat(item.�·�));
					onBasePercentages.push(parseFloat(item.�����));
					sluggingPercentages.push(parseFloat(item.��Ÿ��));
				});

				Highcharts.chart('container', {
					chart : {
						type : 'column'
					},
					title : {
						text : '���� �·�, �����, ��Ÿ��'
					},
					xAxis : {
						categories : categories,
						crosshair : true
					},
					yAxis : {
						title : {
							text : '����'
						}
					},
					series : [ {
						name : '�·�',
						data : winRates
					}, {
						name : '�����',
						data : onBasePercentages
					}, {
						name : '��Ÿ��',
						data : sluggingPercentages
					} ],
					colors : [ '#000000', '#B40404', '#0404B4' ]
				});
			},
			error : function(xhr, status, error) {
				console.log("Error occurred: " + error);
				console.log("Status: " + status);
				console.dir(xhr);
			}
		});

		// ���� ��¥�� �������� �Լ� ����
		function getCurrentDate() {
			var currentDate = new Date();
			var year = currentDate.getFullYear();
			var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
			var day = ('0' + currentDate.getDate()).slice(-2);
			return year + '-' + month + '-' + day;
		}

		// ������ �ε� �� ���� ��¥�� �����ͼ� target ��ҿ� ����
		$('.target').text('(����: ' + getCurrentDate() + ')');

		// ��ư Ŭ�� �̺�Ʈ ó��
		$('#jsonLoad').click(function() {
			// AJAX ��û �� ó��
		});

		$('#jsonLoad2').click(function() {
			// AJAX ��û �� ó��
		});

		$('#jsonLoad3').click(function() {
			// AJAX ��û �� ó��
		});

		$('#jsonLoad4').click(function() {
			// AJAX ��û �� ó��
		});

		$('#jsonLoad5').click(function() {
			// AJAX ��û �� ó��
		});
	});

	$(function() {
		$('#jsonLoad').click(function() {
			$.ajax({
				url : 'http://192.168.0.45:9000/teamproject/loadJson',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var categories = [];
					var winRates = [];
					var onBasePercentages = [];
					var sluggingPercentages = [];

					$.each(data, function(index, item) {
						categories.push(item.��);
						winRates.push(parseFloat(item.�·�));
						onBasePercentages.push(parseFloat(item.�����));
						sluggingPercentages.push(parseFloat(item.��Ÿ��));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '���� �·�, �����, ��Ÿ��'
						},
						xAxis : {
							categories : categories,
							crosshair : true
						},
						yAxis : {
							title : {
								text : '����'
							}
						},
						series : [ {
							name : '�·�',
							data : winRates
						}, {
							name : '�����',
							data : onBasePercentages
						}, {
							name : '��Ÿ��',
							data : sluggingPercentages
						} ],
						colors : [ '#000000', '#B40404', '#0404B4' ]
					});
				},
				error : function(xhr, status, error) {
					console.log("Error occurred: " + error);
					console.log("Status: " + status);
					console.dir(xhr);
				}
			});
		});
	});

	$(function() {
		$('#jsonLoad2').click(function() {
			$.ajax({
				url : 'http://192.168.0.45:9000/teamproject/loadJson2',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var categories = [];
					var playername = [];
					var era = [];

					$.each(data, function(index, item) {
						categories.push(item.��);
						playername.push(item.����);
						era.push(parseFloat(item.�����å));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '���� ����(�����å ����)'
						},
						xAxis : {
							categories : playername,
							crosshair : true
						},
						yAxis : {
							title : {
								text : '�����å'
							}
						},
						series : [ {
							name : '�����å',
							data : era
						} ],
						colors : [ '#B40404' ]
					});
				},
				error : function(xhr, status, error) {
					console.log("Error occurred: " + error);
					console.log("Status: " + status);
					console.dir(xhr);
				}
			});
		});
	});

	$(function() {
		$('#jsonLoad3').click(function() {
			$.ajax({
				url : 'http://192.168.0.45:9000/teamproject/loadJson3',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var categories = [];
					var playername = [];
					var whip = [];

					$.each(data, function(index, item) {
						categories.push(item.��);
						playername.push(item.����);
						whip.push(parseFloat(item.WHIP));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '���� ����(WHIP ����)'
						},
						xAxis : {
							categories : playername,
							crosshair : true
						},
						yAxis : {
							title : {
								text : 'WHIP'
							}
						},
						series : [ {
							name : 'WHIP',
							data : whip
						} ],
						colors : [ '#B40404' ]
					});
				},
				error : function(xhr, status, error) {
					console.log("Error occurred: " + error);
					console.log("Status: " + status);
					console.dir(xhr);
				}
			});
		});
	});

	$(function() {
		$('#jsonLoad4').click(function() {
			$.ajax({
				url : 'http://192.168.0.45:9000/teamproject/loadJson4',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var categories = [];
					var playername = [];
					var battingaverage = [];

					$.each(data, function(index, item) {
						categories.push(item.��);
						playername.push(item.����);
						battingaverage.push(parseFloat(item.Ÿ��));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : 'Ÿ�� ����(Ÿ�� ����)'
						},
						xAxis : {
							categories : playername,
							crosshair : true
						},
						yAxis : {
							title : {
								text : 'Ÿ��'
							}
						},
						series : [ {
							name : 'Ÿ��',
							data : battingaverage
						} ],
						colors : [ '#0404B4' ]
					});
				},
				error : function(xhr, status, error) {
					console.log("Error occurred: " + error);
					console.log("Status: " + status);
					console.dir(xhr);
				}
			});
		});
	});

	$(function() {
		$('#jsonLoad5').click(function() {
			$.ajax({
				url : 'http://192.168.0.45:9000/teamproject/loadJson5',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var categories = [];
					var playername = [];
					var ops = [];

					$.each(data, function(index, item) {
						categories.push(item.��);
						playername.push(item.����);
						ops.push(parseFloat(item.OPS));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : 'Ÿ�� ����(OPS ����)'
						},
						xAxis : {
							categories : playername,
							crosshair : true
						},
						yAxis : {
							title : {
								text : 'OPS'
							}
						},
						series : [ {
							name : 'OPS',
							data : ops
						} ],
						colors : [ '#0404B4' ]
					});
				},
				error : function(xhr, status, error) {
					console.log("Error occurred: " + error);
					console.log("Status: " + status);
					console.dir(xhr);
				}
			});
		});
	});
</script>
<%@include file="../temp/footer.jsp"%>