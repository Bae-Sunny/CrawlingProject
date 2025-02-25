<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%-- ���� ���� ���� --%>
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
				<em>���� ���� ����</em>
			</h2>
			<div class="containers">
				<%-- �޴� ���� ���� --%>
				<div class="team-dropdown">
					<div class="team-dropdown-selected">���� ����</div>
					<ul class="team-dropdown-menu">
						<li data-value="�λ�"><img
							src="resources/img/initial_Doosan.png" alt="�λ꺣�"
							style="width: 30px;"> �λ꺣� (�����ڵ�: 000150)</li>
						<li data-value="��ȭ"><img
							src="resources/img/initial_Hanwha.png" alt="��ȭ�̱۽�"
							style="width: 30px;"> ��ȭ�̱۽� (�����ڵ�: 000880)</li>
						<li data-value="���"><img src="resources/img/initial_KIA.png"
							alt="KIAŸ�̰���" style="width: 30px;"> KIAŸ�̰��� (�����ڵ�: 000270)</li>
						<li data-value="Ű������"><img
							src="resources/img/initial_Kiwoom.png" alt="Ű���������"
							style="width: 30px;"> Ű��������� (�����ڵ�: 039490)</li>
						<li data-value="KT"><img src="resources/img/initial_KT.png"
							alt="KT����" style="width: 30px;"> KT���� (�����ڵ�: 030200)</li>
						<li data-value="LG"><img src="resources/img/initial_LG.png"
							alt="LGƮ����" style="width: 30px;"> LGƮ���� (�����ڵ�: 003550)</li>
						<li data-value="�Ե�����"><img
							src="resources/img/initial_Lotte.png" alt="�Ե����̾���"
							style="width: 30px;"> �Ե����̾��� (�����ڵ�: 004990)</li>
						<li data-value="��������Ʈ"><img
							src="resources/img/initial_NC.png" alt="NC���̳뽺"
							style="width: 30px;"> NC���̳뽺 (�����ڵ�: 036570)</li>
						<li data-value="�Ｚ����"><img
							src="resources/img/initial_Samsung.png" alt="�Ｚ���̿���"
							style="width: 30px;"> �Ｚ���̿��� (�����ڵ�: 005930)</li>
						<li data-value="�ż���"><img src="resources/img/initial_SSG.png"
							alt="SSG������" style="width: 30px;"> SSG������ (�����ڵ�: 004170)</li>
					</ul>
				</div>
				<div class="month-dropdown">
					<div class="month-dropdown-selected">�� ����</div>
					<ul class="month-dropdown-menu">
						<li data-value="3">3��</li>
						<li data-value="4">4��</li>
						<li data-value="5">5��</li>
					</ul>
				</div>

				<button id="loadData">
					<i class="fa-solid fa-magnifying-glass"></i>&nbsp;���� ���� Ȯ��
				</button>
			</div>
			<%-- //�޴� ���� ���� --%>
			<%-- ��Ʈ���� --%>
			<div id="chart-container"
				style="min-width: 310px; height: 400px; margin: 50px 50px;">
				<div class="loading-indicator" style="display: none;">
					<img src="resources/img/loading.gif" alt="Loading...1"
						style="width: 100px;" />
				</div>
				<%-- //��Ʈ���� --%>
				<div class="loading-indicator2">
					<img src="resources/img/capture.jpeg" alt="Loading...2" style="width: 700px;">
				</div>
			</div>
			<div class="info-provider">
				(��������: <img src="resources/img/naver_logo.png" alt="naver"
					style="width: 80px; margin: auto;"> ����)
			</div>
		</div>

		<p style="text-align: center; margin-bottom: 50px;">
			<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;����ȭ������
				���ư���</a>
		</p>
	</div>
</section>
<script>
$(document).ready(function(){
    let selectedTeamCode = null;
    let selectedMonth = null;
    
    // ��Ӵٿ� �޴� ����/�ݱ� �̺�Ʈ
    $(".team-dropdown-selected, .month-dropdown-selected").click(function(){
        $(this).next("ul").toggle();
    });

    // ��Ӵٿ� ������ ���� �̺�Ʈ
    $(".team-dropdown-menu li, .month-dropdown-menu li").click(function(event){
        event.stopPropagation();
        let dataValue = $(this).data("value");

        if ($(this).closest(".team-dropdown").length) {
            selectedTeamCode = dataValue;
            $(".team-dropdown-selected").html($(this).html()); // HTML ���� ����
        } else if ($(this).closest(".month-dropdown").length) {
            selectedMonth = dataValue;
            $(".month-dropdown-selected").text($(this).text().trim()); // �ؽ�Ʈ�� �ʿ�
        }
        $(this).parents("ul").hide();
    });

    // �ܺ� Ŭ�� �� ��Ӵٿ� �޴� �����
    $(document).click(function(e) {
        if (!$(e.target).closest('.team-dropdown, .month-dropdown').length) {
            $(".team-dropdown-menu, .month-dropdown-menu").hide();
        }
    });	
    
    // ������ �ε� ��ư Ŭ�� �̺�Ʈ
    $('#loadData').click(function() {
        if (!selectedTeamCode || !selectedMonth) {
            alert('���ܰ� ���� �����ϼ���.');
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
                alert("������ �ε� ����: " + error);
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
        let filteredData = data.filter(d => d.����� === selectedTeamCode && d.�� === selectedMonth);
        let dataPointsMap = {};
        let title = '';

        if (filteredData.length > 0) {
            title = filteredData[0]["�����"] + ' �ְ� �� �ŷ���'; // ������� �������� ����
        }
        filteredData.forEach(function(item) {
        	let dateString = String(item["��¥"]);
        	let dateParts = dateString.split("."); // "2024.04.30" -> ["2024", "04", "30"]
        	let year = dateParts[0]; // �⵵
        	let month = dateParts[1]; // ��
        	let day = dateParts[2]; // ��
        	let formattedDate = year+'-'+ month + '-' + day;
            
  			dataPointsMap[formattedDate] = {
                date: formattedDate,
                close: parseInt(item["����"].replace(/,/g, '')),
                volume: parseInt(item["�ŷ���"].replace(/,/g, ''))
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
                   format: '{value}��', 
                   style: { 
                      color: Highcharts.getOptions().colors[1] 
                   } 
                },
                title: { 
                   text: '���� �ŷ���', 
                   style: {
                        color: Highcharts.getOptions().colors[1],
                        fontSize: '14px'
                    } 
                }
            }, {
                title: { 
                   text: '���� ����', 
                   style: { 
                      color: Highcharts.getOptions().colors[0],
                      fontSize: '14px'
                  } 
            },
                labels: { 
                   format: '{value} ��', 
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
                        (point.series.name === '���� ����' ? '��' : '��') + '<br/>';
                    });
                    return tooltipHtml;
                },
                style: {
                    fontSize: '12px'
                }
            },
            series: [{
                name: '���� ����',
                type: 'spline',
                yAxis: 1,
                data: closes,
                tooltip: { valueSuffix: '��' },
                zIndex: 2
            }, {
                name: '���� �ŷ���',
                type: 'column',
                data: volumes,
                tooltip: { valueSuffix: '��' },
                zIndex: 1
            }]
        });
    }
});
</script>

<%@include file="../temp/footer.jsp"%>