extends CharacterBody2D


@export var MAX_SPEED = 400
@export var ACCELERATION = 1500
@export var FRICTION = 1500

@onready var axis = Vector2.ZERO


func _physics_process(delta):
	move(delta)

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		pass

func get_input_axis():
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	
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
