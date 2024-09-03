extends StaticBody2D

@export var chicken_scene: PackedScene  

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.has_method("set_target"):
		var new_chicken = chicken_scene.instantiate()
		new_chicken.position = position
		
		get_parent().add_child(new_chicken)
		
		queue_free()
