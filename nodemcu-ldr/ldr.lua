-- publish LDR sensor data on MQTT

MQTT_BROKER = "pi-manager"
WIFI_ID = "my-wifi"
WIFI_PASSWORD = "****"

m = mqtt.Client("nodemcu-ldr", 120, "user", "password")

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


function publishLdrValue()
    value = adc.read(0)
    message = "ldr light="..value
    m:publish("sensors/ldr", message, 0, 1, function(client) print("sent value "..value) end)
end


function setupMqtt()
    m:on("connect", function(client) print ("MQTT connected") end)
    m:on("offline", function(client) print ("MQTT offline") end)
    m:connect(MQTT_BROKER, 1883, 0, function () tmr.alarm(1, 100, tmr.ALARM_AUTO, publishLdrValue) end, function(client, reason) print("MQTT failed reason: "..reason) end)
end
