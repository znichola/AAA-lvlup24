extends Node2D

@onready var radar = $Radar 

func _on_networking_api_rodot_pos_update(pos):
	radar.api_ping_player_pos(pos)
