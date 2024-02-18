extends Node2D

@onready var client_net = $Networking
@onready var theme_music = $AudioStreamPlayer
@onready var powered_standby = $powered_standby

var pos_data_to_transfer = null


func _ready():
	if !theme_music.is_playing():
		theme_music.play()


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


func _on_world_api_interact(action):
	print("new interaction recorded")
	client_net.api_send_data("story", "advanced")


func _on_send_ping_btn_button_down():
	client_net.api_send_data()
	#client_net.api_send_data("position", pos)


func _on_networking_api_power_toggle(pow):
	powered_standby.visible = !pow

