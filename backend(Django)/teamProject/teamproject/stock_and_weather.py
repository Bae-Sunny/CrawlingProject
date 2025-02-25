import time
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def collect_stock_data():
    # Selenium 웹 드라이버 서비스 설정, 실행
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 네이버 메인 페이지로 이동
    driver.get("https://www.naver.com")

    # 증권 탭의 링크 주소 얻기
    finance_link = driver.find_element(By.XPATH, '//*[@id="shortcutArea"]/ul/li[6]/a')
    finance_url = finance_link.get_attribute('href')

    # 링크 URL로 직접 이동
    driver.get(finance_url)
    time.sleep(2)

    # 검색 페이지 URL 저장
    search_page_url = driver.current_url

    # 검색할 종목 코드 설정
    search_codes = {'000270': '기아',
                    '030200': 'KT',
                    '003550': 'LG',
                    '036570': '엔씨소프트',
                    '004170': '신세계',
                    '000150': '두산',
                    '004990': '롯데지주',
                    '005930': '삼성전자',
                    '039490': '키움증권',
                    '000880': '한화'}

    all_stock_data = []  # 모든 종목의 데이터를 저장할 리스트

    for search_code in search_codes:
        # 검색 페이지로 다시 이동
        driver.get(search_page_url)
        time.sleep(2)

        # 검색 필드가 로드될 때까지 기다리기
        search_field = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.ID, "stock_items"))
        )

        # 검색 필드 초기화
        search_field.clear()

        # JavaScript를 사용하여 검색 필드에 값 설정
        driver.execute_script("arguments[0].value = arguments[1];", search_field, search_code)

        # ENTER 키를 보내 검색 실행
        search_field.send_keys(Keys.ENTER)
        time.sleep(5)

        # 종목의 시세 페이지로 이동
        market_price_link = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.XPATH, '//*[@id="content"]/ul/li[2]/a'))
        )
        market_price_link.click()
        time.sleep(2)

        # 일별 시세 테이블이 iframe에 있음
        iframe_url = f"{finance_url}/item/sise_day.naver?code={search_code}"

        # iframe URL로 직접 이동
        driver.get(iframe_url)

        # 데이터를 저장할 빈 리스트 생성
        stock_data = []

        for page_num in range(1, 13):
            table = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'table.type2')))
            trs = table.find_elements(By.CSS_SELECTOR, 'tbody > tr')
            paginate = driver.find_element(By.XPATH, '/html/body/table[2]/tbody/tr/td')

            # 현재 몇 페이지 크롤링 중인지, 출력
            print("현재 페이지: ", page_num)

            # 테이블에서 모든 행을 순회
            for tr in trs:
                spans = tr.find_elements(By.TAG_NAME, 'span')

                # 각 행에서 기대하는 최소한의 span 수 확인
                if len(spans) < 8:
                    continue  # span 요소가 8개 미만이면 다음 행으로 넘어감

                # 야구 정규 시즌 3월 부터 시작
                target_date = '2024.02.29'
                date_text = spans[0].text
                # print("읽은 날짜:", date_text)  # 디버깅을 위한 출력

                if date_text == target_date:
                    print("목표 날짜에 도달했습니다. 데이터 수집을 종료합니다.")
                    break  # 내부 반복문 종료

                # 유효한 행인 경우, 데이터 추출
                stock_info = {
                    '종목명': search_codes[search_code],  # 종목명을 딕셔너리에서 가져와 저장
                    '날짜': spans[0].text,
                    '종가': spans[1].text,
                    '전일비상태': spans[2].text,
                    '전일비': spans[3].text,
                    '시가': spans[4].text,
                    '고가': spans[5].text,
                    '저가': spans[6].text,
                    '거래량': spans[7].text
                }
                stock_data.append(stock_info)

            if date_text == target_date:
                # print("외부 반복문을 종료합니다.")
                break

            # 다음 페이지로 이동
            try:
                # 페이지가 1~9, 11~19, 21~29
                if page_num % 10 != 0:
                    next_link = driver.find_element(By.XPATH, f"//a[contains(text(), '{page_num + 1}')]")
                    next_link.click()
                # 페이지가 10, 20, 30,...
                else:
                    next_link = driver.find_element(By.XPATH, "//a[contains(text(), '다음')]")
                    next_link.click()
                time.sleep(2)
            except:
                print("마지막 페이지에 도달했습니다.")
                break

        all_stock_data.extend(stock_data)  # 각 종목의 데이터를 전체 데이터 리스트에 추가

    # 종료
    driver.quit()

    # 모든 데이터를 DataFrame으로 변환
    df = pd.DataFrame(all_stock_data)

    # '날짜' 컬럼에서 '월'을 추출하여 정수로 변환
    df['월'] = df['날짜'].apply(lambda x: int(x.split('.')[1]))

    # CSV 파일로 저장
    file_path= '/home/ict/PycharmProject/teamProject/teamproject/static/json'
    df.to_csv(f'{file_path}/naver_stocks.csv', index=False, encoding='utf-8-sig')

    return all_stock_data

# 함수 호출
collect_stock_data()


def collect_weather_data(locations):
    # Selenium 웹 드라이버 서비스 설정, 실행
    chrome_driver_path = '/home/ict/PycharmProject/teamProject/teamproject/chromedriver'
    service = Service(chrome_driver_path)
    driver = webdriver.Chrome(service=service)

    # 최종 데이터를 저장할 리스트
    weather_data = []

    for location in locations:
        driver.get("https://www.naver.com")
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "query")))
        search_input = driver.find_element(By.ID, "query")
        search_input.send_keys(f"{location} 날씨")
        search_input.send_keys(Keys.ENTER)
        time.sleep(2)

        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, "week_item")))
        week_items = driver.find_elements(By.CLASS_NAME, "week_item")

        for item in week_items:
            day = item.find_element(By.CSS_SELECTOR, ".cell_date .day").text
            date = item.find_element(By.CSS_SELECTOR, ".cell_date .date").text

            weather_am = item.find_elements(By.CSS_SELECTOR, ".weather_inner")[0]
            am_rainfall = weather_am.find_element(By.CSS_SELECTOR, "span.rainfall").text
            am_description = weather_am.find_element(By.CSS_SELECTOR, "i.wt_icon span.blind").text

            weather_pm = item.find_elements(By.CSS_SELECTOR, ".weather_inner")[1]
            pm_rainfall = weather_pm.find_element(By.CSS_SELECTOR, "span.rainfall").text
            pm_description = weather_pm.find_element(By.CSS_SELECTOR, "i.wt_icon span.blind").text

            low_temp = item.find_element(By.CSS_SELECTOR, ".lowest").text.replace("최저기온\n", "").strip()
            high_temp = item.find_element(By.CSS_SELECTOR, ".highest").text.replace("최고기온\n", "").strip()

            weather_info = {
                '지역': location,
                '날짜': date,
                '요일': day,
                '오전 강수확률': am_rainfall,
                '오전 날씨상태': am_description,
                '오후 강수확률': pm_rainfall,
                '오후 날씨상태': pm_description,
                '최저기온': low_temp,
                '최고기온': high_temp
            }
            weather_data.append(weather_info)

    # 웹 드라이버 종료
    driver.quit()

    # 모든 데이터를 DataFrame으로 변환
    df = pd.DataFrame(weather_data)
    # 요일 데이터 변경
    df.loc[df['요일'] == '오늘', '요일'] = '화'
    df.loc[df['요일'] == '내일', '요일'] = '수'
    # '날짜' 열의 마지막 점 제거
    df['날짜'] = df['날짜'].str.rstrip('.')

    # 지역 데이터 기반으로 컬럼 추가
    # (예)'지역' 컬럼이 '잠실야구장'인 경우 'city' 컬럼에 'Jamsil'을 저장
    # '지역' 컬럼을 기반으로 'city' 컬럼을 설정
    def map_city(region):
        if region == '잠실야구장':
            return 'Jamsil'
        elif region == '고척스카이돔':
            return 'Gocheok'
        elif region == '수원KT위즈파크':
            return 'Suwon'
        elif region == '인천문학경기장':
            return 'Incheon'
        elif region == '대구삼성라이온즈파크':
            return 'Daegu'
        elif region == '한화생명이글스파크':
            return 'Daejeon'
        elif region == '부산사직종합운동장사직야구장':
            return 'Busan'
        elif region == '창원NC파크':
            return 'Changwon'
        elif region == '광주기아챔피언스필드':
            return 'Gwangju'
        else:
            return None  # 지역이 목록에 없는 경우 None 반환

    # 'city' 컬럼 생성
    df['city'] = df['지역'].apply(map_city)
    # CSV 파일로 저장
    file_path = '/home/ict/PycharmProject/teamProject/teamproject/static/json'
    df.to_csv(f'{file_path}/weather_info.csv', index=False, encoding='utf-8-sig')

    return weather_data
#
# # 함수 호출
locations = ["잠실야구장", "고척스카이돔", "수원KT위즈파크", "인천문학경기장", "대구삼성라이온즈파크", "한화생명이글스파크", "부산사직종합운동장사직야구장", "창원NC파크",
             "광주기아챔피언스필드"]
collect_weather_data(locations)
