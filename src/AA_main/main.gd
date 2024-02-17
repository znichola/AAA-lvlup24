extends Node

@onready var _host_edit = $Control/HBoxContainer/ClientContainer/LineEdit


func _on_director_btn_pressed():
	print("server button pressed")
	if _host_edit.text == "":
		print("can't have empty ip field")
		return
	Global.host_ip = _host_edit.text
	get_tree().change_scene_to_file("res://src/director/director.tscn")


func _on_agent_btn_pressed():
	print("agent button pressed")
	get_tree().change_scene_to_file("res://src/agent/agent.tscn")
