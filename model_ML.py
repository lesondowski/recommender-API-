from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score
import pandas as pd
import numpy as np
from flask import Flask, request, jsonify

app = Flask(__name__)

# Load the data
data_set = pd.read_csv("customer.csv")

X = data_set[["Income", "Year_Birth"]]
y = data_set["Spent"]

# Chia dữ liệu thành tập huấn luyện và tập kiểm tra
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Khởi tạo mô hình Random Forest Regression
model = RandomForestRegressor(n_estimators=70, random_state=42)

# Huấn luyện mô hình
model.fit(X_train, y_train)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    income = data.get('Income')
    age = data.get('Year_Birth')

    if not income or not age:
        return jsonify({'error': 'Missing income or age'}), 400

    try:
        income = float(income)
        age = int(age)
    except ValueError:
        return jsonify({'error': 'Invalid income or age'}), 400

    input_data = [[income, age]]
    prediction = model.predict(input_data)[0]

    return jsonify({'spent': prediction})
if __name__ == '__main__':
    app.run(debug=True)