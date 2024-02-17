extends Node2D

@onready var net = $Networking

# Called when the node enters the scene tree for the first time.
func _ready():
	if !net.api_establish_connection():
		get_tree().change_scene_to_file("res://src/AA_main/main.tscn")
		print("failed to connect to this server, returning to menu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_pressed("down") 
		or Input.is_action_just_pressed("up")
		or Input.is_action_just_pressed("left")
		or Input.is_action_just_pressed("right")
		):
		net.api_send_data(["position", get])

