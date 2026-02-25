class_name Hurtbox extends Area2D

signal hurt(value: int)

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
	
func _on_area_entered(body: Area2D):
	#print(body)
	#hurt.emit(body)
	pass

func damage(value: int): 
	print("hurt")
	hurt.emit(value)
