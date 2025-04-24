import os
import logging
from flask import Flask, request, jsonify
import pandas as pd
import numpy as np
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # 모든 도메인에서의 요청을 허용  

logging.basicConfig(level=logging.DEBUG)

# 데뷔일 유사도 계산 (최대 1점, 오래될수록 낮아짐)
def calculate_date_similarity(debut_date_1, debut_date_2):
    debut_date_1 = pd.to_datetime(debut_date_1, errors='coerce')
    debut_date_2 = pd.to_datetime(debut_date_2, errors='coerce')
    if pd.isna(debut_date_1) or pd.isna(debut_date_2):  # 날짜가 NaT면 유사도 0
        return 0
    return np.exp(-abs((debut_date_1 - debut_date_2).days) / 1825)  # 5년(=1825일) 기준 정규화

# 성별 유사도 (같으면 1, 다르면 0)
def calculate_gender_similarity(gender_1, gender_2):
    return 1 if gender_1.lower() == gender_2.lower() else 0

# 소속사 유사도 (같으면 1, 다르면 0)
def calculate_company_similarity(company_1, company_2):
    return 1 if company_1.lower() == company_2.lower() else 0

# find_related_artists 함수 정의
def find_related_artists(artist_no, df):
    related_artists = []
    related_rows = df[df['artist_no'] == artist_no]

    if related_rows.empty:
        return {"error": "입력하신 아티스트는 목록에 없습니다."}

    # 추천 아티스트 목록 생성
    for _, row in related_rows.iterrows():
        related_artists.append({
            "name": row["name"],
            "imagePath": row["imagePath"]
        })
    
    print(f"추천 아티스트 목록: {related_artists}")  # 서버 로그에서 확인
    return related_artists


@app.route('/recommend', methods=['POST'])
def recommend():
    try:
        data = request.get_json()
        logging.debug(f"Received data: {data}")  # 데이터 출력

        if not data:
            return jsonify({"error": "No JSON data received"}), 400

        # artist_no를 정수로 변환
        artist_no = int(data.get('artistDto', {}).get('artist_no'))
        logging.debug(f"Received artist_no: {artist_no}")  # artist_no 값 확인

        if not artist_no:
            return jsonify({"error": "'artist_no' not found in request"}), 400

        # 절대 경로를 사용하여 CSV 파일 로드
        df = pd.read_csv(os.path.join(os.getcwd(), "artist_data2.csv"), encoding="cp949")
        df["korean_name"] = df["korean_name"].fillna("")
        df["Debut"] = df["Debut"].fillna("")

        artist_data = []
        for _, row in df.iterrows():
            artist_data.append({
                "artist_no": row["artist_no"],
                "name": row["name"],
                "korean_name": row["korean_name"],
                "debut": row["Debut"],
                "gender": row["Gender"],
                "company": row["Company"],
                "imagePath": row["imagePath"],
                "artist_no": row["artist_no"]
            })

        # 추천 아티스트 실행
        result = recommend_artists_by_no(artist_data, artist_no, df)

        return jsonify(result)

    except Exception as e:
        logging.error(f"Error: {e}")
        return jsonify({"error": str(e), "traceback": repr(e)}), 500

# 추천 아티스트 목록 생성
def recommend_artists_by_no(artist_data, user_artist_no, df):
    try:
        user_artist = next((artist for artist in artist_data if artist["artist_no"] == user_artist_no), None)
        if not user_artist:
            return {"error": "입력하신 아티스트는 목록에 없습니다."}

        # find_related_artists 함수 호출
        related_artists = find_related_artists(user_artist_no, df)

        if "error" in related_artists:
            return related_artists  # 오류가 있으면 바로 반환

        # 유사도 계산
        similarity_scores = []
        for artist in artist_data:
            if artist["artist_no"] == user_artist["artist_no"]:
                continue  # 자기 자신 제외

            gender_score = calculate_gender_similarity(user_artist["gender"], artist["gender"])
            company_score = calculate_company_similarity(user_artist["company"], artist["company"])
            date_score = calculate_date_similarity(user_artist["debut"], artist["debut"])

            final_score = (gender_score * 0.5) + (company_score * 0.3) + (date_score * 0.2)

            similarity_scores.append({
                "name": artist["name"],
                "korean_name": artist["korean_name"],
                "score": final_score,
                "debut": artist["debut"],
                "gender": artist["gender"],
                "company": artist["company"],
                "imagePath": artist["imagePath"],  # imagePath 추가
                "artist_no": artist["artist_no"]
            })

        similarity_scores = sorted(similarity_scores, key=lambda x: x["score"], reverse=True)[:10]

        # recommendations 리스트에 name과 imagePath를 포함하여 반환
        recommendations = [{"name": artist["name"], "imagePath": artist["imagePath"], "artist_no": artist["artist_no"]} for artist in similarity_scores]
        return {
            "searched_artist": user_artist["name"],
            "recommendations": recommendations
        }

    except Exception as e:
        return {"error": f"Error in recommend_artists_by_no: {str(e)}", "traceback": repr(e)}


if __name__ == '__main__':
    app.run(debug=True, port=5001)
