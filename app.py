from flask import Flask, jsonify
import os
import psycopg2

app = Flask(__name__)

@app.route('/hello')
def hello():
    try:
        conn = psycopg2.connect(
            host=os.environ.get("DB_HOST"),
            dbname=os.environ.get("DB_NAME"),
            user=os.environ.get("DB_USER"),
            password=os.environ.get("DB_PASS"),
            sslmode='require',
            connect_timeout=3,
        )
        return jsonify({"message": "Connected to PostgreSQL successfully!"})
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)
