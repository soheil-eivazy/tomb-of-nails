extends CharacterBody2D

@export var backstep_speed: int = 100
@export var speed: int = 200
@export var turn_speed: float = 5.0

@export var stat: ProtagStat

var slash_scene: PackedScene = preload("uid://cbj5q7xv80qbw")
var blood_bolt_scene: PackedScene = preload("uid://c7sscbio1fa62")
@onready var hurtbox: Hurtbox = $Hurtbox
@onready var interactor: Interactor = $Interactor

var attacks: Dictionary = {
	"slash": slash_creator,
	"blood_bolt": blood_bolt_creator,
}

var chosen_attack: String = "slash"

var dir: Vector2 = Vector2.UP

func _ready():
	hurtbox.hurt.connect(_on_hurt)
	#interactor.in_proximitee.connect(_in_proximity_of)
	#interactor.exit_proximitee.connect(_on_exit_proximity)


#func _in_proximity_of(item: Interactee):
	#interactee = item
#
#func _on_exit_proximity():
	#interactee = null

func _physics_process(delta: float) -> void:
	
	# TODO: how can we handle this?
	#if interactee != null:
		#if abs(interactee.global_position - global_position) >= Vector2(100, 100):
			#interactee = null
	
	#var state = Machine.get_state()
	#var dir = (get_global_mouse_position() - position).normalized()
	#if state == Machine.States.ATTACK:
		#move()
	#elif state == Machine.States.ENEMY:
		
	#else:
		#print("unknown")
	
	
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

	if Input.is_action_just_pressed("ATTACK"):
		if chosen_attack in attacks:
			attacks[chosen_attack].call(dir)
		
	if Input.is_action_just_pressed("ACT_BLOOD"):
		chosen_attack = "blood_bolt"
	
	if Input.is_action_just_pressed("ACT_SLASH"):
		chosen_attack = "slash"

	if Input.is_action_just_pressed("INTERACTION"):
		interactor.interact()
		#print(interactee)
		#if interactee != null:
			#interactee.interact()



	
	
func move() -> void:
	var dir = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = dir * speed
	move_and_slide()
	
		
		
func slash_creator(dir: Vector2) -> void:
	var slash = slash_scene.instantiate() as Attack
	slash.fire(global_position + (dir * 80), dir)
	get_parent().add_child(slash)
	
func blood_bolt_creator(dir: Vector2) -> void:
	var blood_bolt = blood_bolt_scene.instantiate() as Attack
	blood_bolt.fire(global_position + (dir * 80), dir)
	get_parent().add_child(blood_bolt)
		


func _on_hurt(value: int) -> void:
	print("player: ", stat.health)
	stat.health -= value
	if stat.health <= 0:
		queue_free()
