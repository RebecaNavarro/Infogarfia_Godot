extends CharacterBody2D

@onready var state_machine = $AnimationTree.get("parameters/playback")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		state_machine.travel("Attack")
	elif Input.is_action_just_pressed("ui_down"):
		state_machine.travel("Crouch")
	elif Input.is_action_just_pressed("ui_accept"):
		state_machine.travel("Death")
	elif Input.is_action_just_pressed("ui_left"):
		state_machine.travel("Fall")
