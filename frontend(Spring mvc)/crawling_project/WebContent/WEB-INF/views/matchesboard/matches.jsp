<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%-- 야구경기 경기일정 --%>
<style>

.match-info {
    display: none; /* 초기에 숨김 처리 */
}

table .blind {
	font-size: 1.2rem;
	margin: 20px 20px;
}

table td {
	font-size: 1.1rem;
	padding: 8px;
	background-color: #f7f7f7 !important;
	font-weight: 500;
}

#mainth {
	background-color: #294faa ! important;
	color: #ffffff;
	font-weight: 500;
}

#scoreboard-click{
	font-size: 1.1rem;
	padding: 8px;
	background-color: #f7f7f7 !important;
	font-weight: 500;
}
#datepickerContainer{
	text-align: center; /* 내부 요소의 가로 정렬을 가운데로 설정 */
    display: flex; /* 내부 요소를 가로로 정렬하기 위해 Flexbox 사용 */
    justify-content: center; /* 내부 요소를 수평으로 가운데 정렬 */
    align-items: center; /* 내부 요소를 수직으로 가운데 정렬 */
    
}

.team-logo {
        width: 100px; /* 이미지 너비 조절 */
        height: auto; /* 이미지 높이는 자동으로 조절됩니다. */
}

.scoreboard-click-detail:hover{
	cursor: pointer;
	background-color: #294faa !important;
	color: white;
}

.scoreboard-details{
	background-color: #294faa14 !important;
	border-spacing: 10px;
	width: 5%;
	font-weight: bold;
}

.scoreboard-details2{
	background-color: #294faa87 !important;
	border-spacing: 10px;
	width: 5%;
	font-weight: bold;
}
.scoreboard-details3{
	background-color: #596a928a !important;
	border-spacing: 10px;
	width: 5%;
	font-weight: bold;
}

 .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 

 .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 

 .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 

 .ui-state-default,
 .ui-widget-content .ui-state-default,
 .ui-widget-header .ui-state-default,
 .ui-button,
 html .ui-button.ui-state-disabled:hover,
 html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 

 .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 

 .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 

 .ui-widget.ui-widget-content { border: 1px solid #eee; } 

 #datepicker:focus>.ui-datepicker { display: block; } 

 .ui-datepicker-prev,
 .ui-datepicker-next { cursor: pointer; } 

 .ui-datepicker-next { float: right; } 

 .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 

 .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 

 .ui-datepicker-calendar { width: 100%; } 

 .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 

 .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

 .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 

 .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 

 .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 

 .ui-state-hover,
 .ui-widget-content .ui-state-hover,
 .ui-widget-header .ui-state-hover,
 .ui-state-focus,
 .ui-widget-content .ui-state-focus,
 .ui-widget-header .ui-state-focus,
 .ui-button:hover,
 .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 

 .ui-widget-header .ui-icon { background-image: url('resources/img/btns.png'); } 

 .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 

 .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 

 .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 

 .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 

 .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 

 .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 

 .ui-state-highlight,
 .ui-widget-content .ui-state-highlight,
 .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 

 .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 

 .inp:focus { outline: none; background-color: #eee; } 
</style>
<section id="matches">
	<div class="matches_gamesch">
		<div class="container">
			<div class="row">
				<h2>
					<em>KBO리그 경기일정</em>
				</h2>

				<%-- 달력표시 --%>
                <div id="datepickerContainer" class="d-inline-block text-center">                     
                        <div id="datepicker"></div>
                </div>
                <%-- 달력표시 --%>
                
				<%-- 경기결과 영역 --%>
				<div class="matches_info" style="cursor: pointer;">				
					<table>
						<thead>
							<tr>
								<th id="mainth" colspan="6">홈팀</th>
								<th id="mainth" colspan="8">경기정보</th>
								<th id="mainth" colspan="6">원정팀</th>
							</tr>	
						</thead>
						<tbody id="matchesTableBody" style="text-align: center;">												
						</tbody>																	
					</table>					
				</div>
				<%-- 경기결과 영역 --%>
				
				<%-- 크롤링 출처 --%>
				<div class="info-provider">(정보제공: <img src="resources/img/naver_logo.png" alt="naver" style="width: 80px; margin: auto;"> 야구)</div>
				<%-- 크롤링 출처 --%>
				
				<%-- 메인화면 돌아가는 영역 --%>
				<p style="text-align: center; margin-bottom: 50px;">
					<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;메인화면으로 돌아가기</a>
				</p>
				<%-- 메인화면 돌아가는 영역 --%>
				
				
			</div>
		</div>
	</div>



</section>
<%@include file="../temp/footer.jsp"%>
<script>
    $(document).ready(function() {
        // 페이지 로드 시 자동으로 데이터 가져오기
        $.ajax({
        	url: 'http://192.168.0.45:9000/teamproject/load_json_data',
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function(data) {
            	 // 클릭 이벤트 - "스코어보드 Click" 행을 클릭하여 숨겨진 테이블 보이기
                $(document).on('click', 'tr.scoreboard-click', function() {
				    // 현재 클릭된 tr 요소에 대해 다음에 오는 모든 scoreboard-details 요소를 선택
				    var detailsRows = $(this).nextUntil('tr.scoreboard-click').filter('tr.scoreboard-details');
				
				    // 선택된 모든 scoreboard-details 요소의 표시 상태를 토글
				    detailsRows.toggle();
				});
                // 데이터 가져오기 성공 시 테이블 표시
                displayMatchesTable(data);
                // Datepicker 초기화 (인라인 모드)
                $('#datepicker').datepicker({
                    dateFormat: 'm.d',
                    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                    beforeShowDay: function(date) {
                        // 월요일(1)인 경우 false를 반환하여 클릭 불가능하게 만듭니다.
                        return [date.getDay() !== 1, '']; // 월요일(1)을 클릭할 수 없도록 설정
                    },
                    onSelect: function(selectedDate) {
                    
                        var parts = selectedDate.split('.');
                        var selectedMonth = parts[0];
                        var selectedDay = ('0' + parts[1]).slice(-2);

                        // 데이터 필터링
                        var filteredMatches = data.filter(function(match) {
                            var matchDateParts = match.date.split('.');
                            var matchMonth = matchDateParts[0];
                            var matchDay = ('0' + matchDateParts[1]).slice(-2);

                            return matchMonth === selectedMonth && matchDay === selectedDay;
                        });
                        
                    

                        // 필터링된 일정 테이블로 표시
                        displayMatchesTable(filteredMatches);
                    },
                    beforeShow: function(input, inst) {
                        inst.dpDiv.css({
                            position: 'absolute',
                            top: $(input).offset().top + $(input).outerHeight(),
                            left: $(input).offset().left
                        });
                    }
                });
                var today = new Date();
                var formattedToday = (today.getMonth() + 1) + '.' + ('0' + today.getDate()).slice(-2);
                $('#datepicker').datepicker('setDate', formattedToday);
            },
            error: function(xhr, status, error) {
                console.error('Failed to load data:', error);
            }
        });

        // 팀 이미지 정보
        var teamImages = {
            'KIA': 'resources/img/KIATIGERS.svg',
            'KT': 'resources/img/KTWIZ.svg',
            'LG': 'resources/img/LGTWINS.svg',
            'NC': 'resources/img/NCDINOS.svg',
            'SSG': 'resources/img/SSGLADERS.svg',
            '두산': 'resources/img/DOOSANBEARS.svg',
            '롯데': 'resources/img/LOTTEGIANTS.svg',
            '삼성': 'resources/img/SAMSUNGLIONS.svg',
            '키움': 'resources/img/KIWOOMHEROES.svg',
            '한화': 'resources/img/HANWHAEAGLES.svg'
        };

        // 한글 팀 이름에 매칭되는 영문 팀 이름을 반환하는 함수
        function getEnglishTeamName(koreanTeamName) {
            switch (koreanTeamName) {
                case 'DOOSANBEARS':
                    return '두산';
                case 'LOTTEGIANTS':
                    return '롯데';
                case 'SAMSUNGLIONS':
                    return '삼성';
                case 'KIWOOMHEROES':
                    return '키움';
                case 'HANWHAEAGLES':
                    return '한화';
                case 'SSGLADERS':
                    return 'SSG';
                case 'NCDINOS':
                    return 'NC';
                case 'LGTWINS':
                    return 'LG';
                case 'KTWIZ':
                    return 'KT';
                case 'KIATIGERS':
                    return 'KIA';
                default:
                    return koreanTeamName;
            }
        }

        // 팀 이미지 반환
        function getTeamImage(teamName) {
            var englishTeamName = getEnglishTeamName(teamName);
            if (englishTeamName in teamImages) {
                return '<img src="' + teamImages[englishTeamName] + '" alt="' + teamName + '" class="team-logo">';
            } else {
                return teamName; // 이미지가 없는 경우 팀 이름 그대로 반환
            }
        }

        // 경기 일정을 테이블로 표시하는 함수
        function displayMatchesTable(matches) {
            var container = $('#matchesTableBody');
            container.empty(); // 이전 데이터 삭제
            matches.forEach(function(match) {
                var row =   '<tr>' +
                '<td colspan="4" rowspan="3"><p>' + getTeamImage(match.teams1) + '</p>' + match.teams1 + '</td>' +
                '<td colspan="2" rowspan="3">' + match.score1 + '</td>' +
                '<td colspan="8"><b>' + match.game_status + '</b></td>' + // 이 부분이 수정되었습니다.
                '<td colspan="2" rowspan="3">' + match.score2 + '</td>' +
                '<td colspan="4" rowspan="3"><p>' + getTeamImage(match.teams2) + '</p>' + match.teams2 + '</td>' +
                '</tr>' +
                '<tr>' +             
                '<td colspan="8">' + match.date + ' ' + match.time + '</td>' +
                '</tr>' +
                '<tr>' +               
                '<td colspan="8">' + match.location + '</td>' +                
                '</tr>' +
                '<tr class="scoreboard-click">' + '<td colspan="20" class="scoreboard-click-detail">'+ "스코어보드 [더보기]" +'</td>' +'</tr>' +
                '<tr class="scoreboard-details" style="display:none;">' +
                '<td colspan="4" class="scoreboard-details2" style="width:20%;">'+ "<b>팀</b>" +'</td>' +
                '<td class="scoreboard-details2">'+ "1" +'</td>' +
                '<td class="scoreboard-details2">'+ "2" +'</td>' +
                '<td class="scoreboard-details2">'+ "3" +'</td>' +
                '<td class="scoreboard-details2">'+ "4" +'</td>' +
                '<td class="scoreboard-details2">'+ "5" +'</td>' +
                '<td class="scoreboard-details2">'+ "6" +'</td>' +
                '<td class="scoreboard-details2">'+ "7" +'</td>' +
                '<td class="scoreboard-details2">'+ "8" +'</td>' +
                '<td class="scoreboard-details2">'+ "9" +'</td>' +
                '<td class="scoreboard-details2">'+ "10" +'</td>' +
                '<td class="scoreboard-details2">'+ "11" +'</td>' +
                '<td class="scoreboard-details2">'+ "12" +'</td>' +
                '<td class="scoreboard-details2">'+ "R" +'</td>' +
                '<td class="scoreboard-details2">'+ "H" +'</td>' +
                '<td class="scoreboard-details2">'+ "E" +'</td>' +
                '<td class="scoreboard-details2">'+ "B" +'</td>' +
                '</tr>' +
                '<tr class="scoreboard-details" style="display:none;">' +
                '<td colspan="4" class="scoreboard-details" style="width:20%;">'+ '<b>'+match.teams1+'</b>' +'</td>' +
                '<td class="scoreboard-details">'+ match["1_1_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_2_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_3_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_4_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_5_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_6_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_7_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_8_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_9_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_10_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_11_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["1_12_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["1_R_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["1_H_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["1_E_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["1_B_inning"] +'</td>' +
                '</tr>' +
                '<tr class="scoreboard-details" style="display:none;">' +
                '<td colspan="4" class="scoreboard-details" style="width:20%;">'+ '<b>'+match.teams2+'</b>' +'</td>' +
                '<td class="scoreboard-details">'+ match["2_1_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_2_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_3_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_4_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_5_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_6_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_7_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_8_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_9_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_10_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_11_inning"] +'</td>' +
                '<td class="scoreboard-details">'+ match["2_12_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["2_R_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["2_H_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["2_E_inning"] +'</td>' +
                '<td class="scoreboard-details3">'+ match["2_B_inning"] +'</td>' +
                '</tr>';

                

                container.append(row);
            });
        }
    });
</script>



