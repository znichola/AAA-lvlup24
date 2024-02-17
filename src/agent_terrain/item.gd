extends Sprite2D

@export var ID = "Scrap"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	queue_free() # Replace with function body.
