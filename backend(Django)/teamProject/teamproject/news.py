from django.shortcuts import render
import os
import time
import json
from datetime import datetime, timedelta
import pandas as pd
import re
from sqlalchemy import Sequence
import konlpy
from konlpy.tag import Okt, Hannanum, Kkma
import cx_Oracle
import sqlalchemy as sa
from sqlalchemy import create_engine, inspect
from django.http import JsonResponse, HttpResponse
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

def cut_loadDf3Json():
    # # Get user IP address
    # user_ip = request.META.get('REMOTE_ADDR')
    # print(f"User IP: {user_ip}")

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/test.csv'
    print(f"File path: {pathv}")

    try:
        # Attempt to load the CSV into a DataFrame
        df = pd.read_csv(pathv)

        df['num'] = range(1, len(df) + 1)
        # Convert DataFrame to JSON
        df.to_json('newsBigData.json', orient='records', force_ascii=False)

        # to_sql
        userid,password,db = 'ictserver','ictserver','192.168.0.45:1521/xe'
        engine = create_engine(f'oracle://{userid}:{password}@{db}')
        inspector = inspect(engine)
        schema = inspector.default_schema_name
        mytype = {
            'title': sa.types.VARCHAR(100),
            'gdate': sa.types.VARCHAR(30),
            'writer': sa.types.VARCHAR(30),
            'company': sa.types.VARCHAR(50),
            'imgn': sa.types.VARCHAR(255),
            'content': sa.types.CLOB,
            'ctg': sa.types.VARCHAR(20),
            'num': sa.types.INT
        }
        df.to_sql(name='baseball_news_mk6', con=engine, dtype=mytype, if_exists='replace',index=False)

        # Read JSON from file
        with open('newsData.json', 'r') as f:
            resJson = json.load(f)
            print(resJson)

        # Return JSON response
        return JsonResponse(resJson, safe=False)

    except FileNotFoundError:
        print("Error: File not found at the specified path.")
        # Handle the error appropriately, such as returning an error response
        return JsonResponse({'error': 'File not found'}, status=404)

    except Exception as e:
        print(f"Error: {e}")
        # Handle other exceptions as needed
        return JsonResponse({'error': str(e)}, status=500)


def loadDf3Json(request):
    #cut_loadDf3Json()
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")
    with open('newsBigData.json', 'r') as f:
        resJson = json.load(f)
        return JsonResponse(resJson, safe=False)

def newsChart():

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/test.csv'
    df = pd.read_csv(pathv)
    okt = Okt()
    df_text = (df['내용']).str.cat(sep=' ')
    news_text = okt.morphs(df_text)
    team_players = {
        'KIA': [
            '이범호', '진갑용', '정재훈', '조재영', '박기남', '홍세완', '이현곤', '타케시', '이동걸',
            '곽도규', '윤영철', '이준영', '김사윤', '이형범', '최지민', '네일', '황동하', '김건국',
            '장현식', '전상현', '양현종', '김도현', '정해영', '김태군', '한준수', '박찬호', '김선빈',
            '김도영', '서건창', '홍종표', '박정우', '최원준', '이우성', '소크라테스', '최형우', '나성범',
            '이창진'
        ],
        'NC': [
            '강인권', '전상렬', '전형도', '진종길', '전민수', '송지만', '박석진', '윤수강', '이종욱',
            '김수경', '김영규', '채원후', '카스타노', '김시훈', '이용찬', '하트', '김재열', '류진욱',
            '신영우', '신민혁', '한재승', '전사민', '서의태', '박세혁', '김형준', '최정원', '도태훈',
            '박민우', '데이비슨', '오영수', '서호철', '김주원', '김세훈', '천재환', '손아섭', '권희동',
            '박건우', '김성욱'
        ],
        '삼성': [
            '박진만', '손주인', '배영섭', '정민태', '이진영', '이정식', '박찬도', '권오준', '강명구',
            '이병규', '김대우', '원태인', '이승현', '오승환', '이승민', '최하늘', '육선엽', '레예스',
            '임창민', '코너', '최성훈', '이호성', '이승현', '김재윤', '이병헌', '강민호', '김재상',
            '류지혁', '맥키넌', '김영웅', '김지찬', '김호진', '이재현', '이성규', '김헌곤', '김성윤',
            '김현준', '구자욱'
        ],
        'LG': [
            '염경엽', '이호준', '김경태', '김일경', '박경완', '김정준', '정수성', '박용근', '모창민',
            '김광삼', '김유영', '임찬규', '김대현', '정우영', '이우찬', '손주영', '켈리', '엔스',
            '박명근', '이종준', '김진성', '유영찬', '우강훈', '박동원', '허도환', '김범석', '오지환',
            '문보경', '오스틴', '신민재', '김주성', '구본혁', '박해민', '김현수'
        ],
        'SSG': [
            '이숭용', '강병식', '조원우', '임재현', '와타나베', '스즈키', '조동화', '송신영', '이승호',
            '배영수', '조병현', '송영진', '김광현', '앤더슨', '한두솔', '노경은', '이기순', '박민호',
            '문승원', '오원석', '엘리아스', '최민준', '이로운', '최현석', '김민식', '이지영', '안상현',
            '최정', '고명준', '박성한', '최경모'
        ],
        '두산': [
            '이승엽', '박흥식', '김한수', '세리자와', '박정배', '김지용', '정진호', '고토', '이영수',
            '조성환', '박치국', '홍건희', '김강률', '이병헌', '김동주', '최지강', '곽빈', '브랜든',
            '이영하', '김호준', '최준호', '최원준', '김유성', '김택연', '양의지', '김기연', '허경민',
            '전민재', '강승호', '김재호', '양석환', '이유찬', '정수빈', '김재환', '김대한', '라모스'
        ],
        'KT': [
            '이강철', '김태균', '김강', '장재중', '박기혁', '김호', '유한준', '제춘모', '최만호',
            '전병두', '김민', '문용익', '엄상백', '우규민', '김민수', '쿠에바스', '주권', '손동현',
            '벤자민', '한차현', '박영현', '원상현', '육청명', '장성우', '조대현', '황재균', '천성호',
            '장준원', '오윤석', '강백호', '박병호', '신본기', '김건형', '조용호', '문상철'
        ],
        '키움': [
            '홍원기', '김창현', '오윤', '문찬종', '마정길', '권도영', '이승호', '박도현', '박정음',
            '박윤성', '조상우', '문성현', '김재웅', '주승우', '오석주', '하영민', '김동혁', '김인범',
            '후라도', '김성민', '윤석원', '김시앙', '김재현', '김태진', '송성문', '임지열', '김혜성',
            '김휘집', '고영우', '이승원', '박수종', '이용규', '이주형', '예진원', '도슨', '변상권'
        ],
        '한화': [
            '최원호', '강동우', '박승민', '정경배', '윤규진', '박재상', '김남형', '김재걸', '김우석',
            '김정민', '김기중', '이충호', '페냐', '이민우', '장시환', '황준서', '산체스', '장민재',
            '김범수', '박상원', '한승주', '김규연', '류현진', '최재훈', '박상언', '김태연', '안치홍',
            '정은원', '문현빈', '이도윤', '노시환', '황영묵', '이명기', '페라자', '최인호', '김강민'
        ],
        '롯데': [
            '김태형', '유재신', '김민호', '정상호', '이재율', '김광수', '주형광', '임훈', '김주찬',
            '고영민', '한현희', '현도훈', '최준용', '박세웅', '김상수', '반즈', '진해수', '김원중',
            '나균안', '윌커슨', '최이준', '임준섭', '전미르', '손성빈', '유강남', '최항', '한동희',
            '나승엽', '박승욱', '오선진', '이주찬', '고승민', '정훈', '장두성', '김민석', '레이예스',
            '전준우', '윤동희'
        ]
    }
    team_counts = {team: {player: df_text.count(player) for player in players} for team, players in
                   team_players.items()}

    team_rankings = {}
    for team, players in team_counts.items():
        total_counts = sum(players.values())
        sorted_players = sorted(players.items(), key=lambda x: x[1], reverse=True)[:5]  # 상위 5명 추출
        team_rankings[team] = [(player, count, rank + 1) for rank, (player, count) in enumerate(sorted_players)]

    data = []
    data_dict = {}
    data.append({'id': '구단', 'parent': '', 'name': '이번주의 핫한 선수'})
    for team, rankings in team_rankings.items():
        data.append({'id': f'{team}', 'parent': '구단', 'name': f'{team}'})
        for player, count, rank in rankings:
            data.append({'id': f'{player}', 'parent': f'{team}', 'name': f'{player}', 'value': count})
    # JSON 형식으로 변환
    json_data = json.dumps(data, ensure_ascii=False, indent=2)
    print(json_data)

    # JSON 파일로 저장 (선택 사항)
    with open('player.json', 'w', encoding='utf-8') as f:
        f.write(json_data)


def show_json(request):
    #newsChart()
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")
    with open('player.json', 'r') as f:
        resJson = json.load(f)
        return JsonResponse(resJson, safe=False)


def urlAround():
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    teamList = ["LG", "KT", "SK", "NC", "OB", "HT", "LT", "SS", "HH", "WO"]
    # teamList=["KT"]
    dateList = [(datetime.now().date() - timedelta(days=i)).strftime("%Y%m%d") for i in range(7)]
    teamName = ""

    all_data = {"title": [], "writer": [], "gdate": [], "company": [], "imgn": [], "content": [], "ctg": []}

    for team in teamList:
        for date in dateList:
            url = f'https://sports.news.naver.com/kbaseball/news/index?isphoto=N&type=team&team={team}&date={date}'
            driver.get(url)

            news_titles = driver.find_elements(By.CSS_SELECTOR, "div.news_list a.title")
            link_urls = [link.get_attribute('href') for link in news_titles]

            for link_url in link_urls:
                driver.get(link_url)
                time.sleep(1)

                try:
                    newsTitle = driver.find_element(By.TAG_NAME, 'h2').text
                except NoSuchElementException:
                    print("제목 요소를 찾을 수 없습니다.")
                    newsTitle = ''
                try:
                    newsDate = driver.find_element(By.CSS_SELECTOR, 'em.NewsEndMain_date__xjtsQ').text
                except NoSuchElementException:
                    print("날짜 요소를 찾을 수 없습니다.")
                    newsDate = ''
                try:
                    newsWriter = driver.find_element(By.CSS_SELECTOR, 'em.NewsEndMain_name__lNckc').text
                except NoSuchElementException:
                    print("작성자 요소를 찾을 수 없습니다.")
                    newsWriter = ''
                try:
                    newsCompany = driver.find_element(By.CSS_SELECTOR, 'div.NewsEndMain_article_copyright__YgLDb').text
                    newsCompany = re.sub(r'Copyright ⓒ |. All rights reserved.*', '', newsCompany)
                except NoSuchElementException:
                    print("Company 요소를 찾을 수 없습니다.")
                    newsCompany = ''
                try:
                    img_list = driver.find_element(By.CSS_SELECTOR, '.NewsEndMain_image_wrap__djL-o img')
                    if img_list:
                        newsImg = img_list.get_attribute('src')
                except NoSuchElementException:
                    print("이미지 요소를 찾을 수 없습니다.")
                    newsImg = "-"
                    continue
                # print(img_list[0].text)
                # newsImg = img_list[0].get_attribute('src') if len(img_list) > 1 and 'src' in img_list[1].get_attribute('src') else ''

                full_text = driver.find_element(By.CSS_SELECTOR, 'div._article_content').text
                full_text = re.sub(r'\\n|\n', '', full_text)
                full_text = re.sub(r'\\"|\"', '', full_text)
                full_text = re.sub(r"\\'|\'", '', full_text)

                if team == "SK":
                    teamName = "SSG"
                elif team == "OB":
                    teamName = "두산"
                elif team == "HT":
                    teamName = "KIA"
                elif team == "LT":
                    teamName = "롯데"
                elif team == "SS":
                    teamName = "삼성"
                elif team == "HH":
                    teamName = "한화"
                elif team == "WO":
                    teamName = "키움"
                else:
                    teamName = team

                all_data["title"].append(newsTitle)
                all_data["gdate"].append(newsDate)
                all_data["writer"].append(newsWriter)
                all_data["company"].append(newsCompany)
                all_data["imgn"].append(newsImg)
                all_data["content"].append(full_text)
                all_data["ctg"].append(f'{teamName}')

                # driver.execute_script("window.history.go(-1)")
            print(team, date)
    driver.quit()
    for key in all_data:
        print(key)
    df = pd.DataFrame(all_data)
    df.to_csv("test.csv", index=False)
    return all_data
