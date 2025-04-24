from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

@app.route('/hello', methods=['GET'])
def hello():
    return jsonify({"message": "Hellooooo"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
