import os
from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)
ipv4 = os.popen('ip addr show eth0').read().split("inet ")[1].split("/")[0]

@app.route('/')
def hello():
    count = redis.incr('hits')
    return '[IP: {0}] Hello World! I have been seen {1} times.\n'.format(ipv4, count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)

