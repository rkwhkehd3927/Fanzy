from flask import Flask, request, jsonify
from transformers import pipeline

# Flask 애플리케이션 초기화
app = Flask(__name__)

# 감정 분석 모델 로드
classifier = pipeline("sentiment-analysis", model="nlptown/bert-base-multilingual-uncased-sentiment")

def analyze_sentiment(text):
    result = classifier(text)
    label = result[0]['label']
    
    # 감정 결과에 따른 반환
    if label == '1 star':  # 부정적 감정
        return "부정적"
    elif label == '5 stars':  # 긍정적 감정
        return "긍정적"
    else:
        return "중립적"

# POST 요청을 통해 텍스트를 받아 감정 분석 결과를 반환
@app.route('/analyzeSentiment', methods=['POST'])
def analyze_sentiment_route():
    data = request.json
    text = data.get("text", "")
    
    # 받은 텍스트와 감정 분석 결과를 터미널에 출력
    sentiment = analyze_sentiment(text)
    print(f"Received text: {text}")  # 받은 텍스트 출력
    print(f"Sentiment: {sentiment}")  # 감정 분석 결과 출력
    
    return jsonify({"sentiment": sentiment})

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)
