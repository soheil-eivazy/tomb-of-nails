extends CharacterBody2D

var arrow_scene: PackedScene = preload("uid://bu8nycpjbon7x")
@export var stat: EnemyStat
@onready var hurtbox: Hurtbox = $Hurtbox

func _ready():
	hurtbox.hurt.connect(_on_hurt)


func _physics_process(delta: float) -> void:
	if randi() % 10 == 0:
		var dir: Vector2 = Vector2(randi_range(-10, 10), randi_range(-10, 10)).normalized()
		arrow_creator(dir)
	


func arrow_creator(dir: Vector2) -> void:
	var arrow = arrow_scene.instantiate() as Attack
	arrow.fire(global_position + (dir * 80), dir)
	get_parent().add_child(arrow)


func _on_hurt(value: int) -> void:
	print("ranger: ", stat.health)
	stat.health -= value
	if stat.health <= 0:
		queue_free()
