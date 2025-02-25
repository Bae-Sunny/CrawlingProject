from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException, TimeoutException
from datetime import datetime, timedelta
import re
import pandas as pd
import time
from tqdm import tqdm
import json
from django.http import JsonResponse, HttpResponse

def get_preprocessed_news_data():
    # 구단명을 변경하는 매핑 딕셔너리
    team_mapping = {
        "LG": "LG",
        "KT": "KT",
        "SK": "SSG",
        "NC": "NC",
        "OB": "두산",
        "HT": "KIA",
        "LT": "롯데",
        "SS": "삼성",
        "HH": "한화",
        "WO": "키움"
    }

    # teamList와 dateList 설정
    teamList = ["LG", "KT", "SK", "NC", "OB", "HT", "LT", "SS", "HH", "WO"]
    dateList = [(datetime.now().date() - timedelta(days=i)).strftime("%Y%m%d") for i in range(7)]

    news_data = []
    processed_articles = set()

    # Chrome 드라이버 생성
    driver = webdriver.Chrome()

    for team in tqdm(teamList, desc="구단별 진행 상황", leave=True):
        # 구단명을 변경하여 매핑된 구단명을 사용
        mapped_team = team_mapping.get(team, "기타")

        for date in tqdm(dateList, desc="날짜별 진행 상황", leave=True):
            url = f'https://sports.news.naver.com/kbaseball/news/index?isphoto=N&type=team&team={team}&date={date}'
            driver.get(url)
            # 기사 제목을 가져옵니다.
            try:
                news_titles = driver.find_element(By.CSS_SELECTOR, "div.news_list").find_elements(By.CSS_SELECTOR,
                                                                                                  "a.title")
            except NoSuchElementException:
                print("해당 요소를 찾을 수 없습니다.")
                continue  # 다음 날짜로 넘어감
            link_urls = [link.get_attribute('href') for link in news_titles]

            for link_url in link_urls:
                driver.get(link_url)
                time.sleep(1)

                req = driver.page_source
                soup = BeautifulSoup(req, 'html.parser')

                try:
                    # 기사 제목이 로드될 때까지 대기
                    title_element = WebDriverWait(driver, 10).until(
                        EC.presence_of_element_located((By.CLASS_NAME, 'NewsEndMain_article_title__kqEzS'))
                    )
                    # 기사 제목이 나타나면 해당 요소의 텍스트 가져오기
                    title = re.sub(r'\\"', '"', title_element.text.replace("\'", "'"))
                except TimeoutException:
                    # 시간 초과 오류 처리
                    print("기사 제목을 찾을 수 없습니다.")
                    title = None
                    continue

                # 중복 데이터 확인을 위한 고유한 식별자 생성
                article_identifier = f"{team}_{date}_{title}"

                if article_identifier in processed_articles:
                    # 이미 처리된 기사인 경우 건너뜁니다.
                    continue
                else:
                    processed_articles.add(article_identifier)

                # 기사 작성자 처리
                writer_element = soup.find('em', class_='NewsEndMain_name__lNckc')
                writer = writer_element.text if writer_element else "-"

                # 기사 출처 처리
                company_element = soup.find('div', class_='NewsEndMain_article_copyright__YgLDb')
                company_text = company_element.text if company_element else None
                # 정규표현식을 사용하여 Copyright ⓒ와 그 이후의 텍스트 제거
                if company_text:
                    company = company_element.text.replace('Copyright ⓒ ', '').replace(
                        '. All rights reserved. 무단 전재 및 재배포 금지.', '').replace(
                        '. All rights reserved. 무단 전재및 재배포,  AI학습 이용 금지.', '').replace(
                        '. All rights reserved. 무단 전재-재배포, AI 학습 및 활용 금지.', '').replace(
                        '. All rights reserved. 무단 전재, 재배포 및 크롤링 금지.', '')
                else:
                    company = "-"
                    continue

                # 기사 이미지 처리
                image = None
                image_elements = soup.select('.news_end_main img')
                if len(image_elements) > 1:
                    image = image_elements[1]['src']
                else:
                    image = "-"
                    continue

                # 기사 내용 처리
                content_xpath = '//*[@id="comp_news_article"]/div'
                # timeout 발생 시 현재 기사를 건너뛰고 다음 기사로 넘어감
                try:
                    content_element = WebDriverWait(driver, 10).until(
                        EC.presence_of_element_located((By.XPATH, content_xpath)))
                except TimeoutException:
                    img_desc_texts = "-"
                    continue

                # img_desc 요소의 텍스트 제거
                img_desc_texts = [e.text for e in content_element.find_elements(By.CLASS_NAME, 'img_desc')]
                full_text = content_element.text
                for desc_text in img_desc_texts:
                    # 정규 표현식을 사용하여 줄바꿈 문자열 제거
                    full_text = re.sub(r'\\n|\n', '', full_text)

                news_data.append({
                    'title': title,
                    'date': date,
                    'writer': soup.find('em', class_='NewsEndMain_name__lNckc').text if soup.find('em',
                                                                                                  class_='NewsEndMain_name__lNckc') else "작성자못찾음",
                    'newscompany': company,
                    'image': soup.select('.news_end_main img')[1]['src'] if len(
                        soup.select('.news_end_main img')) > 1 else None,
                    'content': full_text.strip(),
                    'team': mapped_team  # 변경된 구단명 사용
                })

                driver.execute_script("window.history.go(-1)")

    # 작업이 완료되면 드라이버 종료
    driver.quit()

    # 데이터프레임 생성
    df1 = pd.DataFrame(news_data)

    # 후처리 : 정규 표현식을 사용하여 \n 제거
    df1['content'] = df1['content'].apply(lambda x: re.sub(r'\n', '', x))
    df1['date'] = df1['date'].apply(lambda x: x[5:10])
    # 'idx' 열 추가
    df1['idx'] = range(1, len(df1) + 1)

    return df1


# 실행 예시
# preprocessed_data = get_preprocessed_news_data()


def extract_and_rank_top_players(df):
    def extract_top_players_with_rank(df):
        # 선수 이름 리스트
        players = [
            '곽도규', '윤영철', '이준영', '김사윤', '이형범', '최지민', '네일', '황동하', '김건국', '장현식', '전상현', '양현종', '김도현', '정해영', '김태군',
            '한준수', '박찬호', '김선빈', '김도영', '서건창', '홍종표', '박정우', '최원준', '이우성', '소크라테스', '최형우', '나성범', '이창진',
            '김영규', '채원후', '카스타노', '김시훈', '이용찬', '하트', '김재열', '류진욱', '신영우', '신민혁', '한재승', '전사민', '서의태', '박세혁', '김형준',
            '최정원', '도태훈', '박민우', '데이비슨', '오영수', '서호철', '김주원', '김세훈', '천재환', '손아섭', '권희동', '박건우', '김성욱',
            '김대우', '원태인', '이승현', '오승환', '이승민', '최하늘', '육선엽', '레예스', '임창민', '코너', '최성훈', '이호성', '이승현', '김재윤', '이병헌',
            '강민호', '김재상', '류지혁', '맥키넌', '김영웅', '김지찬', '김호진', '이재현', '이성규', '김헌곤', '김성윤', '김현준', '구자욱',
            '김유영', '임찬규', '김대현', '정우영', '이우찬', '손주영', '켈리', '엔스', '박명근', '이종준', '김진성', '유영찬', '우강훈', '박동원', '허도환',
            '김범석', '오지환', '문보경', '오스틴', '신민재', '김주성', '구본혁', '박해민', '김현수',
            '조병현', '송영진', '김광현', '앤더슨', '한두솔', '노경은', '이기순', '박민호', '문승원', '오원석', '엘리아스', '최민준', '이로운', '최현석', '김민식',
            '이지영', '안상현', '최정', '고명준', '박성한', '최경모',
            '박치국', '홍건희', '김강률', '이병헌', '김동주', '최지강', '곽빈', '브랜든', '이영하', '김호준', '최준호', '최원준', '김유성', '김택연', '양의지',
            '김기연', '허경민', '전민재', '강승호', '김재호', '양석환', '이유찬', '정수빈', '김재환', '김대한', '라모스',
            '김민', '문용익', '엄상백', '우규민', '김민수', '쿠에바스', '주권', '손동현', '벤자민', '한차현', '박영현', '원상현', '육청명', '장성우', '조대현',
            '황재균', '천성호', '장준원', '오윤석', '강백호', '박병호', '신본기', '김건형', '조용호', '문상철',
            '박윤성', '조상우', '문성현', '김재웅', '주승우', '오석주', '하영민', '김동혁', '김인범', '후라도', '김성민', '윤석원', '김시앙', '김재현', '김태진',
            '송성문', '임지열', '김혜성', '김휘집', '고영우', '이승원', '박수종', '이용규', '이주형', '예진원', '도슨', '변상권',
            '김기중', '이충호', '페냐', '이민우', '장시환', '황준서', '산체스', '장민재', '김범수', '박상원', '한승주', '김규연', '류현진', '최재훈', '박상언',
            '김태연', '안치홍', '정은원', '문현빈', '이도윤', '노시환', '황영묵', '이명기', '페라자', '최인호', '김강민',
            '한현희', '현도훈', '최준용', '박세웅', '김상수', '반즈', '진해수', '김원중', '나균안', '윌커슨', '최이준', '임준섭', '전미르', '손성빈', '유강남',
            '최항', '한동희', '나승엽', '박승욱', '오선진', '이주찬', '고승민', '정훈', '장두성', '김민석', '레이예스', '전준우', '윤동희'
        ]  # 선수 이름은 각자에 맞게 수정

        # 선수 이름을 추출하는 정규표현식
        player_names_regex = r'\b(?:' + '|'.join(players) + r')\b'

        # 선수 이름을 카운트할 딕셔너리 초기화
        player_count = {}

        # 모든 기사 내용(content)을 하나의 문자열로 합침
        all_content = ' '.join(df['content'])

        # 각 선수별로 등장 횟수를 카운트
        for player in players:
            count = all_content.count(player)
            if count > 0:
                player_count[player] = count

        # 상위 10명의 선수 추출 및 순위 부여
        top_players = sorted(player_count.items(), key=lambda x: x[1], reverse=True)[:10]
        top_players_with_rank = [(rank + 1, player, count) for rank, (player, count) in enumerate(top_players)]

        return top_players_with_rank

    def extract_top_players_with_rank_by_team(df):
        # 구단명을 추출
        teams = df['team'].unique()

        # 구단별로 선수별 등장 횟수를 저장할 딕셔너리 초기화
        team_player_counts = {team: {} for team in teams}

        # 각 구단별로 선수별 등장 횟수를 카운트
        for team in teams:
            team_df = df[df['team'] == team]
            team_player_counts[team] = extract_top_players_with_rank(team_df)

        return team_player_counts

    # 전체 데이터에서 top 10 선수 추출
    top_players_with_rank = extract_top_players_with_rank(df)
    top_players_df = pd.DataFrame(top_players_with_rank, columns=['Rank', 'Player', 'Count'])
    top_players_df.insert(0, 'Type', '전체')

    # 각 구단별로 top 10 선수 추출
    team_top_players_with_rank = extract_top_players_with_rank_by_team(df)
    team_top_players_dfs = []
    for team, top_players_with_rank in team_top_players_with_rank.items():
        team_top_players_df = pd.DataFrame(top_players_with_rank, columns=['Rank', 'Player', 'Count'])
        team_top_players_df.insert(0, 'Type', team)
        team_top_players_dfs.append(team_top_players_df)

    # 결과를 하나의 데이터프레임으로 합치기
    df2 = pd.concat([top_players_df] + team_top_players_dfs, ignore_index=True)

    return df2


def scrape_and_merge_data(df2, players):
    # Chrome 드라이버 생성
    driver = webdriver.Chrome()

    # 선수 이름과 이미지 소스를 담을 딕셔너리 생성
    player_images = {}

    try:
        # 각 선수에 대해 이미지 소스 가져오기
        for player in players:
            try:
                # Naver 이미지 검색 결과 페이지 URL 생성
                search_url = f'https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&ssc=tab.nx.all&query=야구선수+{player}'

                # 드라이버로 해당 URL 열기
                driver.get(search_url)
                time.sleep(1)

                # 이미지 소스 가져오기
                image_element = driver.find_element(By.CLASS_NAME, '_img')
                image_src = image_element.get_attribute('src')

                # 선수 구단 가져오기
                team_element = driver.find_element(By.CLASS_NAME, 'sub_title.first_elss')
                team_info = team_element.text.split()

                if len(team_info) > 1:
                    team_name = team_info[0]
                    if len(team_info) > 2:
                        position = team_info[2]
                    else:
                        position = '-'
                else:
                    team_name = '-'
                    position = '-'

                # 선수 이름과 포지션, 이미지 소스를 딕셔너리에 저장
                player_images[player] = [player, team_name, position, image_src]
            except NoSuchElementException:
                # 해당 선수의 이미지가 없을 경우 '-'로 표시
                player_images[player] = [player, '-','-','-']

        # 드라이버 종료
        driver.quit()

        # 데이터프레임 생성
        df3 = pd.DataFrame.from_dict(player_images, orient='index', columns=['player', 'team', 'position', 'image'])
        df3.index.name = 'player'

        # 'Player' 열 삭제
        df3.drop(columns=['player'], inplace=True)

        # df2와 df3를 'Player'를 기준으로 합치기
        merged_df = pd.merge(df2, df3, on='player', how='left')

        return merged_df

    except Exception as e:
        print(f"오류 발생: {e}")
        driver.quit()



# 실행 예시
# merged_data = scrape_and_merge_data(df2, players)
# print(merged_data)


def collect_process_and_save_data(save_path='Final_News.csv'):
    # 데이터 수집 및 전처리
    preprocessed_data = get_preprocessed_news_data()
    ranked_players_data = extract_and_rank_top_players(preprocessed_data)

    # 선수 이미지 스크랩 및 데이터 병합
    merged_data = scrape_and_merge_data(ranked_players_data, ranked_players_data['Player'].tolist())

    # CSV 파일로 저장
    try:
        merged_data.to_csv(save_path, index=False)
        print(f"데이터를 성공적으로 {save_path}에 저장했습니다.")
    except Exception as e:
        print(f"데이터 저장 중 오류가 발생했습니다: {e}")

# 실행
# collect_process_and_save_data('/home/ict/PycharmProject/teamProject')

def newsChart(request):
    # Get user IP address
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"User IP: {user_ip}")

    # Define the file path to the CSV
    pathv = '/home/ict/PycharmProject/teamProject/teamproject/static/json/Final_News.csv'
    df = pd.read_csv(pathv)

    with open('newsData.json', 'w', encoding='utf-8') as f:
        # 데이터프레임을 JSON 파일에 저장
        df.to_json(f, orient='records', force_ascii=False)

def open_json(request):
    #newsChart(request)
    with open('newsData.json', 'r', encoding='utf-8') as f:
        resJson = json.load(f)
        # 파일 열기
        return JsonResponse(resJson, safe=False)