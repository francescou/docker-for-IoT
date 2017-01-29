-- subscribe to MQTT sensors/ldr and status/switch topics, then automatically adapt the light color

MQTT_BROKER = "pi-manager"
WIFI_ID = "my-wifi"
WIFI_PASSWORD = "****"

m = mqtt.Client("nodemcu-rgb", 120, "user", "password")

wifi.setmode(wifi.STATION)
wifi.sta.config(WIFI_ID, WIFI_PASSWORD)
wifi.sta.connect()

tmr.alarm(1, 1000, 1, function()
     if wifi.sta.getip() == nil then
         print("Connecting...")
     else
         tmr.stop(1)
         print("Connected, IP is "..wifi.sta.getip())
         setupMqtt()
     end
end)

on = True

function split(s, expr)
    t = {}
    i = 1
    for k in string.gmatch(s, expr) do
      t[i] = (k)
      i = i + 1
    end
    return t
end


function setup_rgb()
    pwm.setup(1,200,1023)
    pwm.start(1)
    pwm.setup(2,200,1023)
    pwm.start(2)
    pwm.setup(3,200,1023)
    pwm.start(3)
end


function rgb (b,r,g)
    if not on then
      r = 0
      g = 0
      b = 0
    end
    pwm.setduty(1, (255-r)*1023/255)
    pwm.setduty(2, (255-g)*1023/255)
    pwm.setduty(3, (255-b)*1023/255)
end


function manageMessage(client, topic, data)
    print(topic)
    if data == nil then
        print("empty message")
    elseif topic == "sensors/ldr" then
        data = split(data, "%S+")
        value = split(data[2], '([^\=]+)')[2]
        v1 = math.floor(0 + (150) * value / 1024)
        v2 = math.floor(50 + (210-50) * value / 1024)
        rgb(255, v1, v2)

    elseif topic == "status/switch" then
        data = split(data, "%S+")
        status = split(data[2], '([^\=]+)')[2]
        on = (status == "True")
    end
end


function subscriptions()
    m:on("message", manageMessage)
    m:subscribe("sensors/+", 0, function() print("sensors subscribe success") end)
    m:subscribe("status/+", 0, function() print("status subscribe success") end)
end


function setupMqtt()
    m:on("connect", function(client) print ("MQTT connected") end)
    m:on("offline", function(client) print ("MQTT offline") end)
    m:connect(MQTT_BROKER, 1883, 0, subscriptions, function(client, reason) print("MQTT failed reason: "..reason) end)
end


setup_rgb()