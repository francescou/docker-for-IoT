var app = require('http').createServer(handler)
var io = require('socket.io')(app);
var fs = require('fs');
var mqtt = require('mqtt')


var client  = mqtt.connect('mqtt://mosca')

client.on('connect', function () {
  client.subscribe('sensors/#');
});

app.listen(8180);

function handler (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end('Error loading index.html');
    }

    res.writeHead(200);
    res.end(data);
  });
}

io.on('connection', function (socket) {

  client.on('message', function (topic, message) {

    var value = message.toString().split('=')[1];
    socket.emit('news', {
      value: value
    });

  });

});
