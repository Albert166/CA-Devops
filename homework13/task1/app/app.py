# app/app.py

from flask import Flask, request, jsonify
import redis
import os

app = Flask(__name__)

# Connect to Redis using the REDIS_URL environment variable
redis_url = os.environ.get('REDIS_URL', 'redis://localhost:6379')
r = redis.Redis.from_url(redis_url)

@app.route('/enqueue', methods=['POST'])
def enqueue_job():
    job_data = request.json.get('job')  # Get job data from the request
    r.lpush('job_queue', job_data)  # Add job data to the Redis queue
    return jsonify({"message": "Job added to the queue!"}), 201

@app.route('/')
def index():
    return "Welcome to the Flask Job Queue App!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

