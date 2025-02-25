import pandas as pd
import json
from django.http import JsonResponse, HttpResponse

def loadJson_1(request):
    # 사용자 IP 주소 가져오기
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"사용자 IP: {user_ip}")

    # CSV 파일 경로 정의
    pathv1 = '/home/ict/PycharmProject/teamProject/teamproject/static/json/naver_stocks.csv'
    print(f"파일 경로: {pathv1}")

    try:
        # CSV 파일을 DataFrame으로 로드 시도
        df = pd.read_csv(pathv1)
        print(df.head(2))  # 첫 두 행 출력

        # DataFrame을 JSON으로 변환
        df.to_json('naver_stocks.json', orient='records', force_ascii=False)

        # 파일에서 JSON 읽기
        with open('naver_stocks.json', 'r') as f:
            resJson = json.load(f)
            print(resJson)

        # JSON 응답 반환
        return JsonResponse(resJson, safe=False)

    except FileNotFoundError:
        print("오류: 지정된 경로에서 파일을 찾을 수 없습니다.")
        # 적절하게 오류 처리 (예: 오류 응답 반환)
        return JsonResponse({'error': 'File not found'}, status=404)

    except Exception as e:
        print(f"오류: {e}")
        # 필요에 따라 다른 예외 처리
        return JsonResponse({'error': str(e)}, status=500)


def loadJson_2(request):
    # 사용자 IP 주소 가져오기
    user_ip = request.META.get('REMOTE_ADDR')
    print(f"사용자 IP: {user_ip}")

    # CSV 파일 경로 정의
    pathv2 = '/home/ict/PycharmProject/teamProject/teamproject/static/json/weather_info.csv'
    print(f"파일 경로: {pathv2}")

    try:
        # CSV 파일을 DataFrame으로 로드 시도
        df = pd.read_csv(pathv2)
        print(df.head(2))  # 첫 두 행 출력

        # DataFrame을 JSON으로 변환
        df.to_json('weather_info.json', orient='records', force_ascii=False)

        # 파일에서 JSON 읽기
        with open('weather_info.json', 'r') as f:
            resJson = json.load(f)
            print(resJson)

        # JSON 응답 반환
        return JsonResponse(resJson, safe=False)

    except FileNotFoundError:
        print("오류: 지정된 경로에서 파일을 찾을 수 없습니다.")
        # 적절하게 오류 처리 (예: 오류 응답 반환)
        return JsonResponse({'error': 'File not found'}, status=404)

    except Exception as e:
        print(f"오류: {e}")
        # 필요에 따라 다른 예외 처리
        return JsonResponse({'error': str(e)}, status=500)
