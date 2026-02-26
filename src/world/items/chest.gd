extends StaticBody2D


@onready var closed: Sprite2D = $Closed
@onready var open: Sprite2D = $Open
@onready var interactee: Interactee = $Interactee


func _ready() -> void:
	interactee.interaction.connect(_on_interaction)


func _on_interaction():
	closed.visible = !closed.visible
	open.visible = !open.visible
