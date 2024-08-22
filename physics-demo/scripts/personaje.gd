extends CharacterBody2D

var SPEED = 300
var JUMP_SPEED = -600

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	# var vertical = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity.x = horizontal * SPEED
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_SPEED
		if Input.is_action_just_pressed("ui_left") and CollisionShape2D:
			velocity.x = 0
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		print("me choqué con: ", collision.get_collider().name)
