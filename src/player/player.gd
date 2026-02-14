extends CharacterBody2D

@export var backstep_speed: int = 100
@export var speed: int = 200
@export var turn_speed: float = 5.0

var dir: Vector2 = Vector2.UP

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("TURN_LEFT"):
		rotation -= turn_speed * delta
	
	if Input.is_action_pressed("TURN_RIGHT"):
		rotation += turn_speed * delta

	dir = Vector2.from_angle(rotation)
	
	if Input.is_action_pressed("RUN"):
		velocity = speed * dir
		move_and_slide()
		
	if Input.is_action_pressed("BACKSTEP"):
		var backstep = Vector2(-dir.x, -dir.y)
		velocity = backstep_speed * backstep
		move_and_slide()
