from flask import Flask
import redis


app = Flask(__name__)

r = redis.Redis(host='redis', port=6379)

@app.route("/")
def home():
    return "Welcome to the Flask + Redis demo!"

@app.route("/count")
def count():
    visits = redis_client.incr("visit_count")
    return f"Visit count: {visits}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)