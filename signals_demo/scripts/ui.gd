extends Control
@onready var child_label = $Titulo

@onready var button = $Button

func _ready() -> void:
	child_label = get_node("Titulo")

func _on_button_3_button_down() -> void:
	if child_label.text == "Hola!!!!":
		child_label.text = "saludoooos"
		button.text = "Cambiado"
