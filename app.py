from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/hello')
def hello():
    try:
        return jsonify({"message": "Connected to PostgreSQL successfully!"})
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == '__main__':
    app.run()
