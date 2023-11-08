from flask import Flask, jsonify, request
from flask_cors import CORS
from joblib import load

# instantiate the app
app = Flask(__name__)
app.config.from_object(__name__)

# enable CORS
CORS(app, resources={r"/*": {"origins": "*"}})

# Load model and scaler
classifier = load("model.joblib")
scaler = load("scaler.joblib")


# health check route
@app.route("/health", methods=["GET"])
def health():
    return ""


# sanity check route
@app.route("/ping", methods=["GET"])
@app.route("/check", methods=["GET"])
@app.route("/api/ping", methods=["GET"])
@app.route("/api/check", methods=["GET"])
@app.route("/", methods=["GET"])
def ping_pong():
    return jsonify("Server is up and running!")


# sanity check route
@app.route("/predict", methods=["POST"])
@app.route("/api/predict", methods=["POST"])
def predict():
    data = request.json
    app.logger.debug(f"Prediction: {data}")
    age = data.get("age")
    salary = data.get("salary")
    result = classifier.predict(scaler.transform([[age, salary]]))
    app.logger.info(f"Predicted class: {result}")
    return jsonify({"class": int(result[0])})


if __name__ == "__main__":
    app.run()
