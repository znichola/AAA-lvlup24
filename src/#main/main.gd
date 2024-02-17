extends Node

var director = preload("res://src/director/director.tscn")
var agent = preload("res://src/agent/agent.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_director_btn_pressed():
	print("server button pressed")
	get_tree().change_scene_to_file("res://src/director/director.tscn")


func _on_agent_btn_pressed():
	print("agent button pressed")
	get_tree().change_scene_to_file("res://src/agent/agent.tscn")
