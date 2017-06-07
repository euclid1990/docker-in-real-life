#!/bin/bash

APP_PATH="./app"

# Create a file called app.py in your project directory
cat <<EOF >${APP_PATH}/app.py
from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
    count = redis.incr('hits')
    return 'Hello World! I have been seen {} times.\n'.format(count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
EOF

# Create another file called requirements.txt / define the application’s dependencies
cat <<EOF >${APP_PATH}/requirements.txt
flask
redis
EOF
