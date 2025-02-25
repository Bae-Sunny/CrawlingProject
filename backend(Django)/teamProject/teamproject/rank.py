import pandas as pd
import json
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from django.http import JsonResponse, HttpResponse

import os
import time

def team_crawling(request) :
    # Selenium 웹 드라이버 서비스 설정, 실행
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 네이버 메인 페이지로 이동
    driver.get("https://www.naver.com")

    # 뉴스 탭의 링크 주소 얻기
    news_link = driver.find_element(By.XPATH, '//*[@id="shortcutArea"]/ul/li[5]/a')
    news_url = news_link.get_attribute('href')

    # 링크 URL로 직접 이동
    driver.get(news_url)
    time.sleep(2)

    # 스포츠 탭으로 이동
    sports_link = driver.find_element(By.XPATH, '/html/body/section/header/div[1]/div/div/div[1]/div/span[2]/a')
    sports_link.click()
    time.sleep(2)

    # 야구 탭으로 이동
    baseball_link = driver.find_element(By.XPATH, '//*[@id="lnb_list"]/li[2]/a')
    baseball_link.click()
    time.sleep(2)

    # 순위 탭으로 이동
    record_link = driver.find_element(By.XPATH, '//*[@id="lnb_sub_list"]/li[4]/a')
    record_link.click()
    time.sleep(2)

    # 데이터를 저장할 빈 리스트 생성
    TeamRecordList = []

    # 팀순위 테이블이 완전히 보이고 상호작용이 가능하도록 대기
    team_table = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="content"]/div[2]/div/div[2]/table')))

    # 테이블의 모든 행을 순회
    team_trs = team_table.find_elements(By.XPATH, '//*[@id="regularTeamRecordList_table"]/tr')
    for tr in team_trs:
        # 각 행에서 데이터 추출
        rank = tr.find_element(By.XPATH, './th/strong').text
        tds = tr.find_elements(By.XPATH, './td')

        team_info = {
            '순위': rank,
            '팀': tds[0].find_element(By.XPATH, './/span[starts-with(@id, "team_")]').text,
            '경기수': tds[1].text,
            '승': tds[2].text,
            '패': tds[3].text,
            '무': tds[4].text,
            '승률': tds[5].text,
            '게임차': tds[6].text,
            '연속': tds[7].text,
            '출루율': tds[8].text,
            '장타율': tds[9].text,
            '최근 10경기': tds[10].text
        }
        TeamRecordList.append(team_info)
    driver.quit()

    # 데이터프레임 생성
    df = pd.DataFrame(TeamRecordList)

    # csv 저장
    # 저장할 디렉토리 경로
    save_dir = "/home/ict/PycharmProject/teamProject/teamproject/static/json"

    # 파일명
    file_name = "baseballrank.csv"

    # 저장 경로 및 파일명 결합
    file_path = os.path.join(save_dir, file_name)

    # csv 저장
    df.to_csv(file_path, index=False)

def pr_crawling1(request) :
    # Selenium 웹 드라이버 서비스 설정, 실행
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 네이버 메인 페이지로 이동
    driver.get("https://www.naver.com")

    # 뉴스 탭의 링크 주소 얻기
    news_link = driver.find_element(By.XPATH, '//*[@id="shortcutArea"]/ul/li[5]/a')
    news_url = news_link.get_attribute('href')

    # 링크 URL로 직접 이동
    driver.get(news_url)
    time.sleep(2)

    # 스포츠 탭으로 이동
    sports_link = driver.find_element(By.XPATH, '/html/body/section/header/div[1]/div/div/div[1]/div/span[2]/a')
    sports_link.click()
    time.sleep(2)

    # 야구 탭으로 이동
    baseball_link = driver.find_element(By.XPATH, '//*[@id="lnb_list"]/li[2]/a')
    baseball_link.click()
    time.sleep(2)

    # 순위 탭으로 이동
    record_link = driver.find_element(By.XPATH, '//*[@id="lnb_sub_list"]/li[4]/a')
    record_link.click()
    time.sleep(2)

    # 투수순위 섹션으로 이동
    record_link = driver.find_element(By.XPATH, '//*[@id="_playerTypeList"]/li[1]/a')
    record_link.click()
    time.sleep(2)

    # 데이터를 저장할 빈 리스트 생성
    PitcherRecord1 = []

    # 투수순위 테이블1이 완전히 보이고 상호작용이 가능하도록 대기
    record_table1 = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="_pitcherRecord"]/table[1]')))

    # 테이블1의 모든 행을 순회
    record_trs = record_table1.find_elements(By.XPATH, './/tbody/tr')
    for tr in record_trs:
        # 각 행에서 데이터 추출
        rank = tr.find_element(By.XPATH, './th/strong').text
        tds = tr.find_elements(By.XPATH, './td')

        team = tds[0].find_element(By.XPATH, './/span[@class="team"]').text
        team_name = team.strip("()")

        record_info1 = {
            '순위': rank,
            '선수': tds[0].find_element(By.XPATH, './/a').text,
            '팀': team_name,
            '평균자책': tds[1].text,
            '경기수': tds[2].text,
            '이닝': tds[3].text,
            '승': tds[4].text,
            '패': tds[5].text,
            '세이브': tds[6].text,
            '홀드': tds[7].text,
            '탈삼진': tds[8].text,
            '피안타': tds[9].text,
            '피홈런': tds[10].text,
            '실점': tds[11].text,
            '볼넷': tds[12].text,
            '사구': tds[13].text,
            '승률': tds[14].text
        }
        PitcherRecord1.append(record_info1)
    driver.quit()

    # 데이터프레임 생성
    df = pd.DataFrame(PitcherRecord1)

    # csv 저장
    # 저장할 디렉토리 경로
    save_dir = "/home/ict/PycharmProject/teamProject/teamproject/static/json"

    # 파일명
    file_name = "baseballrankpr1.csv"

    # 저장 경로 및 파일명 결합
    file_path = os.path.join(save_dir, file_name)

    # csv 저장
    df.to_csv(file_path, index=False)

def pr_crawling2(request) :
    # Selenium 웹 드라이버 서비스 설정, 실행
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 네이버 메인 페이지로 이동
    driver.get("https://www.naver.com")

    # 뉴스 탭의 링크 주소 얻기
    news_link = driver.find_element(By.XPATH, '//*[@id="shortcutArea"]/ul/li[5]/a')
    news_url = news_link.get_attribute('href')

    # 링크 URL로 직접 이동
    driver.get(news_url)
    time.sleep(2)

    # 스포츠 탭으로 이동
    sports_link = driver.find_element(By.XPATH, '/html/body/section/header/div[1]/div/div/div[1]/div/span[2]/a')
    sports_link.click()
    time.sleep(2)

    # 야구 탭으로 이동
    baseball_link = driver.find_element(By.XPATH, '//*[@id="lnb_list"]/li[2]/a')
    baseball_link.click()
    time.sleep(2)

    # 순위 탭으로 이동
    record_link = driver.find_element(By.XPATH, '//*[@id="lnb_sub_list"]/li[4]/a')
    record_link.click()
    time.sleep(2)

    # 투수순위 섹션에서 > 버튼을 눌러서 테이블 2가 보이도록
    next_record_link = driver.find_element(By.XPATH, '//*[@id="_pitcherRecord"]/a[1]')
    next_record_link.click()
    time.sleep(2)

    PitcherRecord2 = []

    # 투수순위 테이블2이 완전히 보이고 상호작용이 가능하도록 대기
    record_table2 = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="_pitcherRecord"]/table[2]')))

    record_trs2 = record_table2.find_elements(By.XPATH, './/tbody/tr')

    for tr in record_trs2:
        # 각 행에서 데이터 추출
        rank = tr.find_element(By.XPATH, './th/strong').text
        tds = tr.find_elements(By.XPATH, './td')

        team = tds[0].find_element(By.XPATH, './/span[@class="team"]').text
        team_name = team.strip("()")

        record_info2 = {
            '순위': rank,
            '선수': tds[0].find_element(By.XPATH, './/a').text,
            '팀': team_name,
            'WHIP': tds[1].text,
            'K/9': tds[2].text,
            'BB/9': tds[3].text,
            'K/BB': tds[4].text,
            'K%': tds[5].text,
            'BB%': tds[6].text,
            'WPA': tds[7].text,
            'WAR': tds[8].text,
        }
        PitcherRecord2.append(record_info2)
    driver.quit()

    # 데이터프레임 생성
    df = pd.DataFrame(PitcherRecord2)

    # csv 저장
    # 저장할 디렉토리 경로
    save_dir = "/home/ict/PycharmProject/teamProject/teamproject/static/json"

    # 파일명
    file_name = "baseballrankpr2.csv"

    # 저장 경로 및 파일명 결합
    file_path = os.path.join(save_dir, file_name)

    # csv 저장
    df.to_csv(file_path, index=False)

def br_crawling1(request) :
    # Selenium 웹 드라이버 서비스 설정, 실행
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 네이버 메인 페이지로 이동
    driver.get("https://www.naver.com")

    # 뉴스 탭의 링크 주소 얻기
    news_link = driver.find_element(By.XPATH, '//*[@id="shortcutArea"]/ul/li[5]/a')
    news_url = news_link.get_attribute('href')

    # 링크 URL로 직접 이동
    driver.get(news_url)
    time.sleep(2)

    # 스포츠 탭으로 이동
    sports_link = driver.find_element(By.XPATH, '/html/body/section/header/div[1]/div/div/div[1]/div/span[2]/a')
    sports_link.click()
    time.sleep(2)

    # 야구 탭으로 이동
    baseball_link = driver.find_element(By.XPATH, '//*[@id="lnb_list"]/li[2]/a')
    baseball_link.click()
    time.sleep(2)

    # 순위 탭으로 이동
    record_link = driver.find_element(By.XPATH, '//*[@id="lnb_sub_list"]/li[4]/a')
    record_link.click()
    time.sleep(2)

    # 타자순위 섹션으로 이동
    record_link2 = driver.find_element(By.XPATH, '//*[@id="_playerTypeList"]/li[2]/a')
    record_link2.click()
    time.sleep(2)

    # 데이터를 저장할 빈 리스트 생성
    BatterRecord1 = []

    # 타자순위 테이블1이 완전히 보이고 상호작용이 가능하도록 대기
    record_table1 = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="_batterRecord"]/table[1]')))

    # 테이블1의 모든 행을 순회
    record_trs = record_table1.find_elements(By.XPATH, './/tbody/tr')
    for tr in record_trs:
        # 각 행에서 데이터 추출
        rank = tr.find_element(By.XPATH, './th/strong').text
        tds = tr.find_elements(By.XPATH, './td')

        team = tds[0].find_element(By.XPATH, './/span[@class="team"]').text
        team_name = team.strip("()")

        record_info = {
            '순위': rank,
            '선수': tds[0].find_element(By.XPATH, './/a').text,
            '팀': team_name,
            '타율': tds[1].text,
            '경기수': tds[2].text,
            '타수': tds[3].text,
            '안타': tds[4].text,
            '2루타': tds[5].text,
            '3루타': tds[6].text,
            '홈런': tds[7].text,
            '타점': tds[8].text,
            '득점': tds[9].text,
            '도루': tds[10].text,
            '볼넷': tds[11].text,
            '삼진': tds[12].text,
            '출루율': tds[13].text,
            '장타율': tds[14].text
        }
        BatterRecord1.append(record_info)
    driver.quit()

    # 데이터프레임 생성
    df = pd.DataFrame(BatterRecord1)

    # csv 저장
    # 저장할 디렉토리 경로
    save_dir = "/home/ict/PycharmProject/teamProject/teamproject/static/json"

    # 파일명
    file_name = "baseballrankbr1.csv"

    # 저장 경로 및 파일명 결합
    file_path = os.path.join(save_dir, file_name)

    # csv 저장
    df.to_csv(file_path, index=False)

def br_crawling2(request) :
    # Selenium 웹 드라이버 서비스 설정, 실행
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 네이버 메인 페이지로 이동
    driver.get("https://www.naver.com")

    # 뉴스 탭의 링크 주소 얻기
    news_link = driver.find_element(By.XPATH, '//*[@id="shortcutArea"]/ul/li[5]/a')
    news_url = news_link.get_attribute('href')

    # 링크 URL로 직접 이동
    driver.get(news_url)
    time.sleep(2)

    # 스포츠 탭으로 이동
    sports_link = driver.find_element(By.XPATH, '/html/body/section/header/div[1]/div/div/div[1]/div/span[2]/a')
    sports_link.click()
    time.sleep(2)

    # 야구 탭으로 이동
    baseball_link = driver.find_element(By.XPATH, '//*[@id="lnb_list"]/li[2]/a')
    baseball_link.click()
    time.sleep(2)

    # 순위 탭으로 이동
    record_link = driver.find_element(By.XPATH, '//*[@id="lnb_sub_list"]/li[4]/a')
    record_link.click()
    time.sleep(2)

    # 타자순위 섹션으로 이동
    record_link2 = driver.find_element(By.XPATH, '//*[@id="_playerTypeList"]/li[2]/a')
    record_link2.click()
    time.sleep(2)

    # 타자순위 > 버튼을 눌러서 테이블 2가 보이도록
    next_record_link2 = driver.find_element(By.XPATH, '//*[@id="_batterRecord"]/a[1]')
    next_record_link2.click()
    time.sleep(2)

    BatterRecord2 = []

    # 타자순위 테이블2이 완전히 보이고 상호작용이 가능하도록 대기
    record_table2 = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="_batterRecord"]/table[2]')))

    record_trs2 = record_table2.find_elements(By.XPATH, './/tbody/tr')

    for tr in record_trs2:
        # 각 행에서 데이터 추출
        rank = tr.find_element(By.XPATH, './th/strong').text
        tds = tr.find_elements(By.XPATH, './td')

        team = tds[0].find_element(By.XPATH, './/span[@class="team"]').text
        team_name = team.strip("()")

        record_info2 = {
            '순위': rank,
            '선수': tds[0].find_element(By.XPATH, './/a').text,
            '팀': team_name,
            'OPS': tds[1].text,
            'IsoP': tds[2].text,
            'BABIP': tds[3].text,
            'wOBA': tds[4].text,
            'wRC+': tds[5].text,
            'WPA': tds[6].text,
            'WAR': tds[7].text
        }
        BatterRecord2.append(record_info2)
    driver.quit()

    # 데이터프레임 생성
    df = pd.DataFrame(BatterRecord2)

    # csv 저장
    # 저장할 디렉토리 경로
    save_dir = "/home/ict/PycharmProject/teamProject/teamproject/static/json"

    # 파일명
    file_name = "baseballrankbr2.csv"

    # 저장 경로 및 파일명 결합
    file_path = os.path.join(save_dir, file_name)

    # csv 저장
    df.to_csv(file_path, index=False)

def crawl_data(request):
    # 팀 순위 크롤링
    team_crawling(request)

    # 투수 순위 크롤링
    pr_crawling1(request)
    pr_crawling2(request)

    # 타자 순위 크롤링
    br_crawling1(request)
    br_crawling2(request)

    return HttpResponse("Data crawled successfully!")

def loadJson(request):
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/baseballrank.csv'
    print(f"File path: {pathv}")

    try:
        # Attempt to load the CSV into a DataFrame
        df = pd.read_csv(pathv)
        print(df.head(2))

        # Convert DataFrame to JSON
        df.to_json('baseballrank.json', orient='records', force_ascii=False)

        # Read JSON from file
        with open('baseballrank.json', 'r') as f:
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

def loadJson2(request):
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/baseballrankpr1.csv'
    print(f"File path: {pathv}")

    try:
        # Attempt to load the CSV into a DataFrame
        df = pd.read_csv(pathv)
        print(df.head(2))

        # Convert DataFrame to JSON
        df.to_json('baseballrankpr1.json', orient='records', force_ascii=False)

        # Read JSON from file
        with open('baseballrankpr1.json', 'r') as f:
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

def loadJson3(request):
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/baseballrankpr2.csv'
    print(f"File path: {pathv}")

    try:
        # Attempt to load the CSV into a DataFrame
        df = pd.read_csv(pathv)
        print(df.head(2))

        # Convert DataFrame to JSON
        df.to_json('baseballrankpr2.json', orient='records', force_ascii=False)

        # Read JSON from file
        with open('baseballrankpr2.json', 'r') as f:
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

def loadJson4(request):
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/baseballrankbr1.csv'
    print(f"File path: {pathv}")

    try:
        # Attempt to load the CSV into a DataFrame
        df = pd.read_csv(pathv)
        print(df.head(2))

        # Convert DataFrame to JSON
        df.to_json('baseballrankbr1.json', orient='records', force_ascii=False)

        # Read JSON from file
        with open('baseballrankbr1.json', 'r') as f:
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

def loadJson5(request):
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/baseballrankbr2.csv'
    print(f"File path: {pathv}")

    try:
        # Attempt to load the CSV into a DataFrame
        df = pd.read_csv(pathv)
        print(df.head(2))

        # Convert DataFrame to JSON
        df.to_json('baseballrankbr2.json', orient='records', force_ascii=False)

        # Read JSON from file
        with open('baseballrankbr2.json', 'r') as f:
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