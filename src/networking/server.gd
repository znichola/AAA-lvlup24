extends Node

signal api_move_from_character(pos: Vector2)

# The port we will listen to.
const PORT = 9080
var tcp_server := TCPServer.new()
var socket := WebSocketPeer.new()

func log_message(message):
	var time = "%s" % Time.get_time_string_from_system()
	print(time + message + "\n")
	
func _ready():
	if tcp_server.listen(PORT) != OK:
		log_message("Unable to start server.")
		set_process(false)
	print("server started")

func _process(_delta):
	while tcp_server.is_connection_available():
		var conn: StreamPeerTCP = tcp_server.take_connection()
		assert(conn != null)
		socket.accept_stream(conn)

	socket.poll()

	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			log_message(socket.get_packet().get_string_from_ascii())
			print("Variant rescived", bytes_to_var(socket.get_packet()))


func _exit_tree():
	socket.close()
	tcp_server.stop()


func _on_button_pong_pressed():
	socket.send_text("Pong")
