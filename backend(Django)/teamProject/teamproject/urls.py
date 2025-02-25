from django.urls import path
from teamproject import views, news, matches, newsplayerrank, rank

urlpatterns = [
    path('loadJson_1', views.loadJson_1), # 증권
    path('loadJson_2', views.loadJson_2), # 날씨
    path('loadDf3Json', news.loadDf3Json), # news 게시판
    path('show_json', news.show_json), # news 게시판
    path('load_json_data', matches.load_json_data), # 경기일정
    path('open_json', newsplayerrank.open_json), # news rank
    path('loadJson', rank.loadJson), # 팀순위,개인순위
    path('loadJson2', rank.loadJson2),
    path('loadJson3', rank.loadJson3),
    path('loadJson4', rank.loadJson4),
    path('loadJson5', rank.loadJson5),

]