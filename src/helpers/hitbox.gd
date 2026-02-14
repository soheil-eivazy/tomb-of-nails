class_name Hitbox extends Area2D

signal hit(body: Area2D)

@export var damage: int = 1
var direction: Vector2


func _ready() -> void:
	set_monitoring(true)
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)
	
	
func _on_body_entered(body: Node2D):
	hit.emit(body)

func _on_area_entered(body: Area2D):
	hit.emit(body)
