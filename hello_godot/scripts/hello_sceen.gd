extends Node2D


var speed = 20

# inicializacion
func _ready() -> void:
	print("Hola Mundo")

#update una vez por frame
func _process(delta: float) -> void:
	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var vertical = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	position.x += delta * speed * horizontal
	position.y += delta * speed * vertical
	print(horizontal)
