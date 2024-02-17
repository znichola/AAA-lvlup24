extends Node

# The URL we will connect to.
var websocket_url = "ws://10.177.34.146:9080"
var socket := WebSocketPeer.new()


func log_message(message):
	var time = "[color=#aaaaaa] %s [/color]" % Time.get_time_string_from_system()
	print(time + message + "\n")

func _ready():
	if socket.connect_to_url(websocket_url) != OK:
		log_message("Unable to connect.")
		set_process(false)
	print("client connected")

func _process(_delta):
	socket.poll()

	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			log_message(socket.get_packet().get_string_from_ascii())


func _exit_tree():
	socket.close()

func _input(event):
	if event.is_action_pressed("down"):
		socket.send_text("down")
	elif event.is_action_pressed("up"):
		socket.send_text("up")
	elif event.is_action_pressed("left"):
		socket.send_text("left")
	elif event.is_action_pressed("space"):
		socket.send_text("space")

