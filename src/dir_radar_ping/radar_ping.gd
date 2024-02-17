extends Node2D

func _ready():
	var tween = $Sprite2D.create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "scale", Vector2(1.2, 1.2), 6)
	tween.tween_property($Sprite2D, "modulate", Color.TRANSPARENT, 6)
	tween.chain().tween_callback($Sprite2D.queue_free)

