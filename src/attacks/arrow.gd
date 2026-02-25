extends Attack

@export var speed: int = 600 
var direction: Vector2
var damage: int = 1
@onready var hitbox: Hitbox = $Hitbox

func _ready():
	hitbox.hit.connect(_on_hit)

func fire(g_pos: Vector2, dir: Vector2):
	direction = dir
	position = g_pos
	rotation_degrees = rad_to_deg(dir.angle()) 

func _physics_process(delta: float) -> void:
	position += (direction * speed) * delta


func _on_hit(body) -> void:
	print(body)
	if body is Hurtbox:
		print("hurtbox")
		body.damage(damage)
	
	queue_free()
