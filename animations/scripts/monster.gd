extends CharacterBody2D

@onready var player = $AnimationPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		player.play("Attack")
		
