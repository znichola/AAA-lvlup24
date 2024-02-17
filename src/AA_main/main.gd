extends Node

@onready var _host_edit = $LineEdit


func _on_start_server_pressed():
	get_tree().change_scene_to_file("res://src/director/director.tscn")


func _on_input_ip_pressed():
	Global.host_ip = _host_edit.text
	if _host_edit.text == "":
		print("can't have empty ip field")
		#return
	get_tree().change_scene_to_file("res://src/agent/agent.tscn")
