express = require 'express'
socketio = require 'socket.io'
assets = require 'connect-assets'

app = express()

app.configure ->
	app.use assets
		src: __dirname + '/public'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.static(__dirname + '/public')
	app.use app.router
	app.set 'views', 'views'

app.get '/', (req, res) ->
	res.render 'index.jade'

server = http.createServer app
io = socketio.listen server

io.set 'log level', 1

io.sockets.on 'connection', (socket) ->
	socket.emit 'hello'

server.listen 8001
