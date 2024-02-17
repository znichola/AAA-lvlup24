extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

	
func _input(event):
	if(event.is_action_pressed("right_click")):
		#print(get_local_mouse_position())
		#if(get_local_mouse_position().length() < 100):
	 	#	queue_free()
		
		if(Geometry2D.is_point_in_polygon(get_local_mouse_position(), $Polygon2D.polygon)):
			queue_free()
