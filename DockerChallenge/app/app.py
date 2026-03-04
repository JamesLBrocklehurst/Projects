from flask import Flask
import redis
import os

app = Flask(__name__)

redis_client = redis.Redis(
    host=os.getenv("REDIS_HOST", "redis"),
    port=6379,
    db=0,
    decode_responses=True
)

@app.route("/")
def home():
    return "Welcome to the Flask + Redis demo!"

@app.route("/count")
def count():
    visits = redis_client.incr("visit_count")
    return f"Visit count: {visits}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)