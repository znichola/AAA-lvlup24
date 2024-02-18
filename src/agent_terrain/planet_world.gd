extends Node2D

signal api_move(pos: Vector2)

@onready var chara = $"Chara"
@onready var radio = $radio_daisy_bell_bicycle

# Called when the node enters the scene tree for the first time.
func _ready():
	if !radio.is_playing():
		radio.play()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_chara_api_move():
	api_move.emit(chara.position)
