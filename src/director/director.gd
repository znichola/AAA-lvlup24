extends Node2D

@onready var radar = $Radar 

@onready var radar_to_map = $radar_to_map/PathFollow2D
@onready var radar_to_ops = $radar_to_opts/PathFollow2D


func _on_networking_api_rodot_pos_update(pos):
	radar.api_ping_player_pos(pos)


func _on_radar_to_map_btn_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_map, "progress_ratio", 1, 0.8)


func _on_map_to_radar_btn_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_map, "progress_ratio", 0, 0.8)


func _on_radar_to_opts_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_ops, "progress_ratio", 1, 0.8)


func _on_opts_to_radar_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_ops, "progress_ratio", 0, 0.8)
