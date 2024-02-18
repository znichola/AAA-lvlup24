extends Sprite2D

@export var ID = "Scrap"
var active = false


func _on_timer_timeout():
	queue_free() # Replace with function body.
