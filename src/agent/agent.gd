extends Node2D

@onready var client_net = $Networking

var pos_data_to_transfer = null


func _process(_delta):
	if pos_data_to_transfer != null:
		client_net.api_send_data("robot-pos", pos_data_to_transfer)
		pos_data_to_transfer = null


func _on_world_api_move(pos):
	print("got new position update from chara")
	if client_net.socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		print("sent update over the wire")
		pos_data_to_transfer = pos
		#client_net.api_send_data("position", pos)


func _on_send_ping_btn_button_down():
	client_net.api_send_data()
	#client_net.api_send_data("position", pos)
