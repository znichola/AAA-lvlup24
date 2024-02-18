extends Node2D

enum role {DIERCTOR, AGENT}

@export var host = role.DIERCTOR
@onready var box = $RichTextLabel



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if host == role.DIERCTOR:
		box.text = Global.director_story[Global.story_index]
	elif host == role.AGENT:
		box.text = Global.agent_story[Global.story_index]
