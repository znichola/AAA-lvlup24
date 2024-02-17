extends Node

signal api_move_from_character(pos: Vector2)

# The port we will listen to.
const PORT = 9080
var tcp_server := TCPServer.new()
var socket := WebSocketPeer.new()

func log_message(message):
	var time = "%s" % Time.get_time_string_from_system()
	print(time + " : " + message + "\n")

func _ready():
	print("spwan server")

func _process(_delta):
	while tcp_server.is_connection_available():
		var conn: StreamPeerTCP = tcp_server.take_connection()
		assert(conn != null)
		socket.accept_stream(conn)
		print("loop here")

	socket.poll()
	print("asdasd", tcp_server.is_connection_available())
	print("server state:", WebSocketPeer.STATE_OPEN)
	
	if Input.is_action_just_pressed("space"):
		api_send_data("space", "tried to click space")
	
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		print("server open")
		while socket.get_available_packet_count():
			log_message(socket.get_packet().get_string_from_ascii())
			print("Variant rescived", bytes_to_var(socket.get_packet()))


func _exit_tree():
	socket.close()
	tcp_server.stop()


func start_server():
	if tcp_server.listen(PORT) != OK:
		log_message("Unable to start server.")
		set_process(false)
		return false
	print("server started")


func _on_button_pong_pressed():
	socket.send_text("Pong")


func api_send_data(property, data):
	socket.send(var_to_bytes([property, data])) # it's an array because we want to indexinto it after decoding
	print("trying to send : ", property)
