extends Node2D

signal api_move(pos: Vector2)

@onready var chara = $"Chara"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_chara_api_move():
	api_move.emit(chara.position)

