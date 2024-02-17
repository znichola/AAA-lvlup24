extends Node

signal api_data_received(property: String, data)

# The URL we will connect to.
var websocket_url = "ws://10.177.34.145"
var socket := WebSocketPeer.new()

var connectionEstablished = false

func log_message(message):
	var time = "[color=#aaaaaa] %s [/color]" % Time.get_time_string_from_system()
	print(time + message + "\n")


func _process(_delta):
	if !connectionEstablished:
		return
	socket.poll()

	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			log_message(socket.get_packet().get_string_from_ascii())
			var v =  bytes_to_var(socket.get_packet())
			print("Variant rescived", v)
			api_data_received.emit(v[0], v[1])


func _exit_tree():
	socket.close()
#
#
#func _input(event):
	#if event.is_action_pressed("down"):
		#socket.send_text("down")
	#elif event.is_action_pressed("up"):
		#socket.send_text("up")
	#elif event.is_action_pressed("left"):
		#socket.send_text("left")
	#elif event.is_action_pressed("space"):
		#socket.send_text("space")


func api_send_data(property,data):
	socket.send(var_to_bytes([property, data])) # it's an array because we want to indexinto it after decoding


func api_establish_connection():
	if socket.connect_to_url(websocket_url) != OK:
		log_message("Unable to connect.")
		set_process(false)
		return
	log_message("client connected")
	connectionEstablished = true
