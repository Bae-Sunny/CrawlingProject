<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%-- 구단 증권 정보 --%>
<style>
.chart-container {
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	gap: 10px;
	background-color: #f7f7f7;
	padding: 20px;
	border-radius: 8px;
	font-size: 1.1rem;
	justify-content: center;
}

.loading-indicator2 {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
}

.containers {
	text-align: center;
}

.team-dropdown, .month-dropdown {
	display: inline-flex;
	position: relative;
	align-items: center;
	margin-right: 20px;
	width: auto;
}

.team-dropdown-selected, .month-dropdown-selected {
	padding: 10px;
	background-color: #f0f0f0;
	cursor: pointer;
	width: 300px;
	border: 1px solid #ccc;
	border-radius: 4px;
	border: 1px solid #ccc;
}

.team-dropdown-menu, .month-dropdown-menu {
	position: absolute;
	width: 100%;
	top: 100%;
	background-color: white;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	display: none;
	z-index: 1000;
}

.team-dropdown-menu li, .month-dropdown-menu li {
	padding: 10px;
	cursor: pointer;
	list-style: none;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.team-dropdown-menu li:hover, .month-dropdown-menu li:hover {
	background-color: #f0f0f0;
	opacity: 0.5;
}

#loadData {
	margin-left: 10px;
}

#stock {
	margin-right: 10px;
	font-size: 1.1rem;
	border-radius: 4px;
	left: 30px;
}

#chart {
	margin: 20px 20px;
}

button {
	background-color: #000000;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 200px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	opacity: 1;
	transition: opacity 0.3s ease;
}

button:hover {
	background-color: #333333;
	color: #f8f8f8;
	opacity: 0.5;
}

.loading-indicator {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<section id="stock">
	<div class="teams_stock">
		<div class="container">
			<h2>
				<em>구단 증권 정보</em>
			</h2>
			<div class="containers">
				<%-- 메뉴 선택 영역 --%>
				<div class="team-dropdown">
					<div class="team-dropdown-selected">구단 선택</div>
					<ul class="team-dropdown-menu">
						<li data-value="두산"><img
							src="resources/img/initial_Doosan.png" alt="두산베어스"
							style="width: 30px;"> 두산베어스 (종목코드: 000150)</li>
						<li data-value="한화"><img
							src="resources/img/initial_Hanwha.png" alt="한화이글스"
							style="width: 30px;"> 한화이글스 (종목코드: 000880)</li>
						<li data-value="기아"><img src="resources/img/initial_KIA.png"
							alt="KIA타이거즈" style="width: 30px;"> KIA타이거즈 (종목코드: 000270)</li>
						<li data-value="키움증권"><img
							src="resources/img/initial_Kiwoom.png" alt="키움히어로즈"
							style="width: 30px;"> 키움히어로즈 (종목코드: 039490)</li>
						<li data-value="KT"><img src="resources/img/initial_KT.png"
							alt="KT위즈" style="width: 30px;"> KT위즈 (종목코드: 030200)</li>
						<li data-value="LG"><img src="resources/img/initial_LG.png"
							alt="LG트윈스" style="width: 30px;"> LG트윈스 (종목코드: 003550)</li>
						<li data-value="롯데지주"><img
							src="resources/img/initial_Lotte.png" alt="롯데자이언츠"
							style="width: 30px;"> 롯데자이언츠 (종목코드: 004990)</li>
						<li data-value="엔씨소프트"><img
							src="resources/img/initial_NC.png" alt="NC다이노스"
							style="width: 30px;"> NC다이노스 (종목코드: 036570)</li>
						<li data-value="삼성전자"><img
							src="resources/img/initial_Samsung.png" alt="삼성라이온즈"
							style="width: 30px;"> 삼성라이온즈 (종목코드: 005930)</li>
						<li data-value="신세계"><img src="resources/img/initial_SSG.png"
							alt="SSG랜더스" style="width: 30px;"> SSG랜더스 (종목코드: 004170)</li>
					</ul>
				</div>
				<div class="month-dropdown">
					<div class="month-dropdown-selected">월 선택</div>
					<ul class="month-dropdown-menu">
						<li data-value="3">3월</li>
						<li data-value="4">4월</li>
						<li data-value="5">5월</li>
					</ul>
				</div>

				<button id="loadData">
					<i class="fa-solid fa-magnifying-glass"></i>&nbsp;증권 정보 확인
				</button>
			</div>
			<%-- //메뉴 선택 영역 --%>
			<%-- 차트영역 --%>
			<div id="chart-container"
				style="min-width: 310px; height: 400px; margin: 50px 50px;">
				<div class="loading-indicator" style="display: none;">
					<img src="resources/img/loading.gif" alt="Loading...1"
						style="width: 100px;" />
				</div>
				<%-- //차트영역 --%>
				<div class="loading-indicator2">
					<img src="resources/img/capture.jpeg" alt="Loading...2" style="width: 700px;">
				</div>
			</div>
			<div class="info-provider">
				(정보제공: <img src="resources/img/naver_logo.png" alt="naver"
					style="width: 80px; margin: auto;"> 증권)
			</div>
		</div>

		<p style="text-align: center; margin-bottom: 50px;">
			<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;메인화면으로
				돌아가기</a>
		</p>
	</div>
</section>
<script>
$(document).ready(function(){
    let selectedTeamCode = null;
    let selectedMonth = null;
    
    // 드롭다운 메뉴 열기/닫기 이벤트
    $(".team-dropdown-selected, .month-dropdown-selected").click(function(){
        $(this).next("ul").toggle();
    });

    // 드롭다운 아이템 선택 이벤트
    $(".team-dropdown-menu li, .month-dropdown-menu li").click(function(event){
        event.stopPropagation();
        let dataValue = $(this).data("value");

        if ($(this).closest(".team-dropdown").length) {
            selectedTeamCode = dataValue;
            $(".team-dropdown-selected").html($(this).html()); // HTML 내용 포함
        } else if ($(this).closest(".month-dropdown").length) {
            selectedMonth = dataValue;
            $(".month-dropdown-selected").text($(this).text().trim()); // 텍스트만 필요
        }
        $(this).parents("ul").hide();
    });

    // 외부 클릭 시 드롭다운 메뉴 숨기기
    $(document).click(function(e) {
        if (!$(e.target).closest('.team-dropdown, .month-dropdown').length) {
            $(".team-dropdown-menu, .month-dropdown-menu").hide();
        }
    });	
    
    // 데이터 로드 버튼 클릭 이벤트
    $('#loadData').click(function() {
        if (!selectedTeamCode || !selectedMonth) {
            alert('구단과 월을 선택하세요.');
            return;
        }
        $('.loading-indicator').show();
        loadDataFromServer();
    });
    
    function loadDataFromServer() {
        $.ajax({
            url: 'http://192.168.0.45:9000/teamproject/loadJson_1',
            type: 'GET',
            dataType: 'json',
            success: processData,
            error: function(xhr, status, error) {
                alert("데이터 로드 실패: " + error);
            },
            complete: function() {
                $('.loading-indicator').hide();
            }
        });
    }    

    function processData(data) {
    	console.log(data)
        let chartData = prepareChartData(data);
        renderChart(chartData);
    }
    
    function prepareChartData(data) {
        let filteredData = data.filter(d => d.종목명 === selectedTeamCode && d.월 === selectedMonth);
        let dataPointsMap = {};
        let title = '';

        if (filteredData.length > 0) {
            title = filteredData[0]["종목명"] + ' 주가 및 거래량'; // 종목명을 제목으로 설정
        }
        filteredData.forEach(function(item) {
        	let dateString = String(item["날짜"]);
        	let dateParts = dateString.split("."); // "2024.04.30" -> ["2024", "04", "30"]
        	let year = dateParts[0]; // 년도
        	let month = dateParts[1]; // 월
        	let day = dateParts[2]; // 일
        	let formattedDate = year+'-'+ month + '-' + day;
            
  			dataPointsMap[formattedDate] = {
                date: formattedDate,
                close: parseInt(item["종가"].replace(/,/g, '')),
                volume: parseInt(item["거래량"].replace(/,/g, ''))
            };
  			
        });

        let dataPoints = Object.values(dataPointsMap);
        dataPoints.sort((a, b) => a.date.localeCompare(b.date));

        return {
            title: title,
            dates: dataPoints.map(dp => dp.date),
            closes: dataPoints.map(dp => dp.close),
            volumes: dataPoints.map(dp => dp.volume)
        };
    }

    function renderChart({ title, dates, closes, volumes }) {
        Highcharts.chart('chart-container', {
            chart: {
                zoomType: 'xy'
            },
            title: {
                text: title,
                style: {
                    fontSize: '20px'
                }
            },
            xAxis: [{
                categories: dates,
                crosshair: true,
                type: 'datetime',
                dateTimeLabelFormats: { day: '%Y-%m-%d' },
                labels: {
                    style: {
                        fontSize: '12px' 
                    }
                }
            }],
            yAxis: [{
                labels: { 
                   format: '{value}건', 
                   style: { 
                      color: Highcharts.getOptions().colors[1] 
                   } 
                },
                title: { 
                   text: '일일 거래량', 
                   style: {
                        color: Highcharts.getOptions().colors[1],
                        fontSize: '14px'
                    } 
                }
            }, {
                title: { 
                   text: '일일 종가', 
                   style: { 
                      color: Highcharts.getOptions().colors[0],
                      fontSize: '14px'
                  } 
            },
                labels: { 
                   format: '{value} 원', 
                   style: { 
                      color: Highcharts.getOptions().colors[0], 
                      fontSize: '12px'
                   } 
                },
                opposite: true
            }],
            tooltip: {
                shared: true,
                useHTML: true,
                formatter: function () {
                    let tooltipHtml = '<b>' + this.x + '</b><br/>';
                    this.points.forEach(point => {
                        tooltipHtml += '<b>' + point.series.name + ': </b>' + 
                        Highcharts.numberFormat(point.y, 0, '.', ',') + 
                        (point.series.name === '일일 종가' ? '원' : '건') + '<br/>';
                    });
                    return tooltipHtml;
                },
                style: {
                    fontSize: '12px'
                }
            },
            series: [{
                name: '일일 종가',
                type: 'spline',
                yAxis: 1,
                data: closes,
                tooltip: { valueSuffix: '원' },
                zIndex: 2
            }, {
                name: '일일 거래량',
                type: 'column',
                data: volumes,
                tooltip: { valueSuffix: '건' },
                zIndex: 1
            }]
        });
    }
});
</script>

<%@include file="../temp/footer.jsp"%>