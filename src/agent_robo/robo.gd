extends CharacterBody2D

signal api_move

@export var MAX_SPEED = 400
@export var ACCELERATION = 1500
@export var FRICTION = 1500

@export var INVENTORY = ["bop", "bap", "ding", "pow"]

@onready var axis = Vector2.ZERO

var item = preload("res://src/agent_terrain/item.tscn")

func _physics_process(delta):
	move(delta)

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		interact()

func interact():
	pass

func get_input_axis():
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	# we do this check to not spam the server with updates, only on release
	if (Input.is_action_just_released("down")
		or Input.is_action_just_released("up")
		or Input.is_action_just_released("left")
		or Input.is_action_just_released("right")):
		api_move.emit()
	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	
	move_and_slide()

func apply_friction(fricc):
	if velocity.length() > fricc:
		velocity -= velocity.normalized() * fricc
	else:
		velocity = Vector2.ZERO

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(MAX_SPEED)
