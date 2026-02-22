class_name Attack extends Area2D

func _on_ready():
	body_entered.connect(_on_body_entered)


func fire(_g_pos: Vector2, _dir: Vector2):
	print("action")
	assert("not implemented")
	
func _on_body_entered(body: Node2D):
	# TODO: handle this in each object
	queue_free()
