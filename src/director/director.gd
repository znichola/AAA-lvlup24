extends Node2D

@onready var radar = $Radar 
@onready var server_net = $Networking

@onready var radar_to_map = $radar_to_map/PathFollow2D
@onready var radar_to_ops = $radar_to_opts/PathFollow2D
@onready var radar_to_sats = $radar_to_stats/PathFollow2D
@onready var stats_to_map = $stats_to_map/PathFollow2D

static var time = 0.8

func _on_networking_api_rodot_pos_update(pos):
	radar.api_ping_player_pos(pos)


func _on_robot_power_toggle_toggled(toggled_on):
	print("toggle:", toggled_on)
	server_net.api_send_data("power", toggled_on)
	#var sp: Sprite2D = get_child(1)
	#print(toggled_on)
	#sp.frame = toggled_on


########## Map navigation ########

func _on_radar_to_map_btn_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_map, "progress_ratio", 1, time)


func _on_map_to_radar_btn_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_map, "progress_ratio", 0, time)


func _on_radar_to_opts_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_ops, "progress_ratio", 1, time)


func _on_opts_to_radar_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_ops, "progress_ratio", 0, time)


func _on_radar_to_stats_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_sats, "progress_ratio", 1, time)


func _on_stats_to_radar_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(radar_to_sats, "progress_ratio", 0, time)


func _on_stas_to_map_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(stats_to_map, "progress_ratio", 1, time)


func _on_map_to_stats_pressed():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(stats_to_map, "progress_ratio", 0, time)

