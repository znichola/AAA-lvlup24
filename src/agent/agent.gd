extends Node2D

@onready var net = $Networking

# Called when the node enters the scene tree for the first time.
func _ready():
	if !net.api_establish_connection():
		#get_tree().change_scene_to_file("res://src/AA_main/main.tscn")
		print("failed to connect to this server, returning to menu")


func _on_world_api_move(pos):
	print("got new position update from chara")
	if net.socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		print("sent update over the wire")
		net.api_send_data("position", pos)
