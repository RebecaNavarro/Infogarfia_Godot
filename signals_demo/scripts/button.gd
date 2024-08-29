extends Button

@export var label: Label

func _on_button_down() -> void:
	print("Boton presionado")
	label.text = "HOLAAA"
