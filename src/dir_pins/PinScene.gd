extends Node2D

var pinElement = preload("res://src/dir_pins/PinElement.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if(event.is_action_pressed("left_click")):
		var initiatedElement = pinElement.instantiate()
		initiatedElement.position = get_local_mouse_position()
		$Pins.add_child(initiatedElement)
		
