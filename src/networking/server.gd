extends Node

signal api_rodot_pos_update(pos: Vector2)

# The port we will listen to.
const PORT = 9080
var tcp_server := TCPServer.new()
var socket := WebSocketPeer.new()


func _ready():
	if tcp_server.listen(PORT) != OK:
		Global.log_message("Unable to start server.")
		set_process(false)
	print("srver started with success")

func _process(_delta):
	#Block while connecting? 
	while tcp_server.is_connection_available():
		var conn: StreamPeerTCP = tcp_server.take_connection()
		assert(conn != null)
		socket.accept_stream(conn)
		print("trying to accept connection from:", conn)
	socket.poll()
		
	#print("slkjdflksdj", WebSocketPeer.STATE_OPEN)
	
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		print("sdlkfjlksdjfklsdjklf")
		while socket.get_available_packet_count():
			#Global.log_message(socket.get_packet().get_string_from_ascii())
			var packet = socket.get_packet() 
			Global.log_vet_message(packet)
			var data = bytes_to_var(packet)
			if data == null:
				print("error with data!")
				return
			if data[0] == "robot-pos":
				api_rodot_pos_update.emit(data[1])


func _exit_tree():
	socket.close()
	tcp_server.stop()


func _on_button_pong_pressed():
	api_send_data("fuck", "this")



func api_send_data(property, data):
	socket.send(var_to_bytes([property, data])) # it's an array because we want to indexinto it after decoding
	#socket.send_text("fuck")
	print("trying to send : ", property)
