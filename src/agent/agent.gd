extends Node2D

@onready var client_net = $Networking

# Called when the node enters the scene tree for the first time.
func _ready():
	print("url used:<", Global.host_ip, ">")
	if !client_net.api_establish_connection():
		#get_tree().change_scene_to_file("res://src/AA_main/main.tscn")
		print("failed to connect to this server, returning to menu")


func _on_world_api_move(pos):
	print("got new position update from chara")
	if client_net.socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		print("sent update over the wire")
		client_net.api_send_data("position", pos)
