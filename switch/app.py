"""
light switch
"""

from flask import jsonify, Flask, request
import paho.mqtt.client as paho

app = Flask(__name__, static_url_path='')

light = False

@app.route("/")
def index():
    """
    index.html
    """
    return app.send_static_file('index.html')


@app.route('/api/status')
def get_status():
    """
    get switch status
    """
    return jsonify(status=light)


@app.route('/api/status', methods=['POST'])
def set_status():
    """
    set switch status
    """
    content = request.get_json(silent=True)
    global light
    light = content["status"]
    publish(light)
    return jsonify(status=light)


def publish(status):
    client.publish("status/switch", payload='switch light=' + str(status), qos=0, retain=True)


def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    publish(light)

if __name__ == "__main__":
    client = paho.Client()
    client.on_connect = on_connect
    client.connect("mosca", 1883, 60)
    client.loop_start()
    app.run(port=5000, host='0.0.0.0', debug=True)
