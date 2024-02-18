extends Node

signal api_data_received(property: String, data)
signal api_power_toggle(pow : bool)

# The URL we will connect to.
var websocket_url = "ws://localhost:9080"
var socket := WebSocketPeer.new()

func _ready():
	if Global.host_ip != "":
		websocket_url = "ws://" + Global.host_ip + ":9080"
		print("using:", websocket_url)
	if socket.connect_to_url(websocket_url) != OK:
		Global.log_message("Unable to connect.")
		set_process(false)
	else:
		print("client connected with success")
	
	var callable = Callable(self, "on_global_story_advanced")
	Global.connect("story_advanced", callable)


func on_global_story_advanced():
	print("story advanced callback")
	api_send_data("story", "advanced")


func _process(_delta):
	socket.poll()

	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			#Global.log_message(socket.get_packet().get_string_from_ascii())
			var packet = socket.get_packet() 
			Global.log_vet_message(packet)
			var data = bytes_to_var(packet)
			if data == null:
				print("error with data!")
				return
			if data[0] == "power":
				Global.robot_power = data[1]
				api_power_toggle.emit(data[1])


func _exit_tree():
	socket.close()



func api_send_data(property, data):
	socket.send(var_to_bytes([property, data])) # it's an array because we want to indexinto it after decoding
	print("trying to send : ", property)


func _on_pickup_btn_button_up():
	api_send_data("double", "shit")
