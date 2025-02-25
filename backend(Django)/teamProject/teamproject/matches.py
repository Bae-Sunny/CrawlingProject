import pandas as pd
from django.contrib.sessions.backends import file
from django.contrib.sites import requests
from django.shortcuts import render
import json
# RestAPI로 json으로 응답 객체
from django.http import JsonResponse, HttpResponse
from django.shortcuts import get_object_or_404
#Pandas의 DataFrame을 가지고 있는 메서드
# from resapi.models import make_dfall
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
from datetime import datetime, timedelta


def load_json_data(request):
    try:
        # 파일 경로 정의
        file_path = '/home/ict/PycharmProject/teamProject/teamproject/static/json/projectbok'

        # CSV 파일을 DataFrame으로 읽기
        df = pd.read_csv(file_path)

        # DataFrame 가공
        df['date'] = df['date'].apply(lambda x: f'{x:.2f}')

        # DataFrame을 JSON 파일로 저장
        json_file_path = 'projectbok.json'
        df.to_json(json_file_path, orient='records', force_ascii=False)

        # JSON 파일 읽기
        with open(json_file_path) as f:
            res_json = json.load(f)

        # JSON 응답 반환
        json_callback = request.GET.get('callback')
        if json_callback:  # jsonp 방식
            response = HttpResponse("%s(%s);" % (json_callback, json.dumps(res_json, ensure_ascii=False)))
            response["Content-Type"] = "text/javascript; charset=utf-8"
            return response
        else:  # 기존의 json 데이터 방식으로 처리
            return JsonResponse(res_json, safe=False)

    except FileNotFoundError:
        print("Error: File not found at the specified path.")
        return JsonResponse({'error': 'File not found'}, status=404)

    except Exception as e:
        print(f"Error: {e}")
        return JsonResponse({'error': str(e)}, status=500)


def scrape_baseball_schedule(start_date, end_date):
    # WebDriver 초기화
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 페이지 로드
    num_days = (datetime.strptime(end_date, '%Y-%m-%d') - datetime.strptime(start_date, '%Y-%m-%d')).days + 1
    lists = []

    try:
        for i in range(num_days):
            target_date = (datetime.strptime(start_date, '%Y-%m-%d') + timedelta(days=i)).strftime('%Y-%m-%d')
            url = f'https://m.sports.naver.com/kbaseball/schedule/index?date={target_date}'

            driver.get(url)
            time.sleep(3)  # 페이지 로드 대기

            # ul 요소 찾기
            ul = driver.find_element(By.XPATH, '//*[@id="content"]/div/div[4]/div/ul')
            # ul의 자식 li 요소들 찾기
            lis = ul.find_elements(By.XPATH, './li/div/div[2]/a')

            for index, li in enumerate(lis):
                if index > 0:
                    # 이전 페이지로 돌아가기
                    driver.back()
                    time.sleep(2)  # 페이지 로드 대기

                # 링크 클릭
                driver.execute_script("arguments[0].click();", li)
                time.sleep(2)  # 페이지 로드 대기

                # 데이터 수집
                teams1 = driver.find_element(By.CSS_SELECTOR, 'div.MatchBox_home__MPL6D > div > div > em').text.replace(
                    '홈', '')
                teams2 = driver.find_element(By.CSS_SELECTOR, 'div.MatchBox_away__1rDsC > div > div > em').text.replace(
                    '홈', '')
                state_text = driver.find_element(By.CLASS_NAME, 'MatchBox_state__2AzL_').text

                if '경기취소' in state_text or '경기전' in state_text:
                    score1 = '-'
                    score2 = '-'
                else:
                    score1 = driver.find_element(By.CSS_SELECTOR,
                                                 'div.MatchBox_home__MPL6D > div > strong').text.replace('점수\n', '')
                    score2 = driver.find_element(By.CSS_SELECTOR,
                                                 'div.MatchBox_away__1rDsC > div > strong').text.replace('점수\n', '')

                date = driver.find_element(By.CSS_SELECTOR, 'div.MatchBox_info__2l4DE > p.MatchBox_date__1bJ9G').text[
                       :5]
                time_info = driver.find_element(By.CSS_SELECTOR,
                                                'div.MatchBox_info__2l4DE > p.MatchBox_date__1bJ9G > span').text
                location = driver.find_element(By.CLASS_NAME, 'MatchBox_stadium__17mQ4').text

                # 이닝별 스코어 수집
                def find_element(row_num, col_num):
                    try:
                        selector = f'div.ScoreBox_result__3atD0 > table > tbody > tr:nth-child({row_num}) > td:nth-child({col_num})'
                        element = driver.find_element(By.CSS_SELECTOR, selector).text
                        return element
                    except:
                        return '-'

                innings1 = [find_element(1, i) for i in range(2, 14)]
                innings2 = [find_element(2, i) for i in range(2, 14)]
                RHEB1 = [find_element(1, i) for i in range(1, 5)]
                RHEB2 = [find_element(2, i) for i in range(1, 5)]

                # 정보를 사전에 저장
                game_info = {
                    'teams1': teams1,
                    'teams2': teams2,
                    'score1': score1,
                    'score2': score2,
                    'date': date,
                    'time': time_info,
                    'location': location,
                    'game_status': state_text,
                    'innings1': innings1,
                    'innings2': innings2,
                    'RHEB1': RHEB1,
                    'RHEB2': RHEB2
                }
                lists.append(game_info)

    except Exception as e:
        print(f"Error occurred: {e}")

    finally:
        # WebDriver 종료
        driver.quit()

    return lists

# 예시: 2024-03-09부터 2024-08-29까지 일정 수집
start_date = '2024-03-09'
end_date = '2024-08-29'
#schedule_data = scrape_baseball_schedule(start_date, end_date)
#print(schedule_data)

