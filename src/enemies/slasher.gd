extends CharacterBody2D

var slash_scene: PackedScene = preload("uid://cbj5q7xv80qbw")
@export var stat: EnemyStat
@onready var hurtbox: Hurtbox = $Hurtbox

func _ready():
	hurtbox.hurt.connect(_on_hurt)

func _physics_process(delta: float) -> void:
	#if randi() % 10 == 0:
		#var dir: Vector2 = Vector2(randi_range(-10, 10), randi_range(-10, 10)).normalized()
		#slash_creator(dir)
	pass


func slash_creator(dir: Vector2) -> void:
	var slash = slash_scene.instantiate() as Attack
	slash.fire(global_position + (dir * 80), dir)
	get_parent().add_child(slash)


func _on_hurt(value: int) -> void:
	print("slasher: ", stat.health)
	stat.health -= value
	if stat.health <= 0:
		queue_free()
