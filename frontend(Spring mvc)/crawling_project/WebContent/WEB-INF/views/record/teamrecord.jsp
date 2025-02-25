<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%-- 팀순위 --%>
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
		<h2>팀/개인순위</h2>
		<div id="record-container">
			<div>
				<div id="container" style="min-width: 300px; height: 400px;"></div>
				<div class="record-btn">
					<input type="button" class="search-button" value="팀별 승률, 출루율, 장타율"
						id="jsonLoad"> <input type="button" class="search-button2"
						value="투수 순위(평균자책 기준)" id="jsonLoad2"> <input
						type="button" class="search-button2" value="투수 순위(WHIP 기준)"
						id="jsonLoad3"> <input type="button"
						class="search-button3" value="타자 순위(타율 기준)" id="jsonLoad4">
					<input type="button" class="search-button3" value="타자 순위(OPS 기준)"
						id="jsonLoad5">
					<div class="target">(기준:getCurrentDate())</div>
					<div class="info-provider">
						(정보제공: <img src="resources/img/naver_logo.png" alt="naver"
							style="width: 80px; margin: auto;"> 야구)
					</div>
					<p style="text-align: center; margin-bottom: 20px;">
						<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;메인화면으로
							돌아가기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(function() {
		// 페이지 로드 시 초기 차트 생성
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
					categories.push(item.팀);
					winRates.push(parseFloat(item.승률));
					onBasePercentages.push(parseFloat(item.출루율));
					sluggingPercentages.push(parseFloat(item.장타율));
				});

				Highcharts.chart('container', {
					chart : {
						type : 'column'
					},
					title : {
						text : '팀별 승률, 출루율, 장타율'
					},
					xAxis : {
						categories : categories,
						crosshair : true
					},
					yAxis : {
						title : {
							text : '비율'
						}
					},
					series : [ {
						name : '승률',
						data : winRates
					}, {
						name : '출루율',
						data : onBasePercentages
					}, {
						name : '장타율',
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

		// 현재 날짜를 가져오는 함수 정의
		function getCurrentDate() {
			var currentDate = new Date();
			var year = currentDate.getFullYear();
			var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
			var day = ('0' + currentDate.getDate()).slice(-2);
			return year + '-' + month + '-' + day;
		}

		// 페이지 로딩 시 현재 날짜를 가져와서 target 요소에 삽입
		$('.target').text('(기준: ' + getCurrentDate() + ')');

		// 버튼 클릭 이벤트 처리
		$('#jsonLoad').click(function() {
			// AJAX 요청 등 처리
		});

		$('#jsonLoad2').click(function() {
			// AJAX 요청 등 처리
		});

		$('#jsonLoad3').click(function() {
			// AJAX 요청 등 처리
		});

		$('#jsonLoad4').click(function() {
			// AJAX 요청 등 처리
		});

		$('#jsonLoad5').click(function() {
			// AJAX 요청 등 처리
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
						categories.push(item.팀);
						winRates.push(parseFloat(item.승률));
						onBasePercentages.push(parseFloat(item.출루율));
						sluggingPercentages.push(parseFloat(item.장타율));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '팀별 승률, 출루율, 장타율'
						},
						xAxis : {
							categories : categories,
							crosshair : true
						},
						yAxis : {
							title : {
								text : '비율'
							}
						},
						series : [ {
							name : '승률',
							data : winRates
						}, {
							name : '출루율',
							data : onBasePercentages
						}, {
							name : '장타율',
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
						categories.push(item.팀);
						playername.push(item.선수);
						era.push(parseFloat(item.평균자책));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '투수 순위(평균자책 기준)'
						},
						xAxis : {
							categories : playername,
							crosshair : true
						},
						yAxis : {
							title : {
								text : '평균자책'
							}
						},
						series : [ {
							name : '평균자책',
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
						categories.push(item.팀);
						playername.push(item.선수);
						whip.push(parseFloat(item.WHIP));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '투수 순위(WHIP 기준)'
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
						categories.push(item.팀);
						playername.push(item.선수);
						battingaverage.push(parseFloat(item.타율));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '타자 순위(타율 기준)'
						},
						xAxis : {
							categories : playername,
							crosshair : true
						},
						yAxis : {
							title : {
								text : '타율'
							}
						},
						series : [ {
							name : '타율',
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
						categories.push(item.팀);
						playername.push(item.선수);
						ops.push(parseFloat(item.OPS));
					});

					Highcharts.chart('container', {
						chart : {
							type : 'column'
						},
						title : {
							text : '타자 순위(OPS 기준)'
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