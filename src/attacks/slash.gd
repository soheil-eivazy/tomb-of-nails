extends Attack

var damage: int = 1

func fire(g_pos: Vector2, dir: Vector2):
	global_position = g_pos
	rotation_degrees = rad_to_deg(dir.angle()) + 90


func _on_timer_timeout() -> void:
	queue_free()


func _on_hit(body: Area2D) -> void:
	if body is Hurtbox:
		body.damage(damage)
	
	queue_free()
