$ ->
	socket = io.connect()
	socket.on 'connect' ->
		socket.on 'hello', (msg) ->
			$('body').append msg
