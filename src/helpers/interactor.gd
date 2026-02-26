class_name Interactor extends Area2D

#signal in_proximitee(Interactee)
#signal exit_proximitee()
#
#func _ready() -> void:

	#area_entered.connect(_on_entry)
	#area_exited.connect(_on_exit)
	
	
#func _on_entry(item: Interactee):
	#print(item, "enterd")
	#in_proximitee.emit(item)
	#
#func _on_exit():
	#print("exited")
	#exit_proximitee.emit()


func interact():
	print("interact")
	var items = get_overlapping_areas()
	if len(items) > 0:
		var item = items[0] as Interactee
		print("interact with ", item)
		item.interact()
