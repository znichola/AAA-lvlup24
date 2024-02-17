extends Sprite2D

@export var ID = "def"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start() # Replace with function body.
	$RichTextLabel.text = ID


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	queue_free() # Replace with function body.
