extends Node2D

var radar_ping = preload("res://src/dir_radar_ping/radar_ping.tscn")
@onready var pings_store = $pings_store

func _ready():
	var tween = $RadarLine.create_tween().set_loops()
	tween.tween_property($RadarLine, "rotation", TAU, 6).as_relative()

func api_ping_player_pos(pos : Vector2):
	var new_ping = radar_ping.instantiate()
	new_ping.position = pos * 0.02
	pings_store.add_child(new_ping)
