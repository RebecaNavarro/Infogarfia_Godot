extends CharacterBody2D

const MAX_SPEED = 70
const ACCEL = 200

@export var hp = 30
@export var target = Vector2.ZERO
@export var patrol_radius = 50.0
@export var angular_speed = 1.0

var player_detected = false
var angle = 0.0

func _ready() -> void:
	target = global_position

func _physics_process(delta: float) -> void:
	if player_detected:
		# calcular la direccion a moverse:
		var direction = global_position.direction_to(target).normalized()
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCEL * delta)
		move_and_slide()
	else: 
		angle += angular_speed * delta
		var new_position = target + Vector2(cos(angle), sin(angle)) * patrol_radius
		var direction = global_position.direction_to(new_position).normalized()
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCEL * delta)
		move_and_slide()
	
func _on_hurt_box_area_entered(area: Area2D) -> void:
	hp -= 10
	print("OUCH (enemy)")
	if hp <= 0:
		queue_free()


func _on_detection_area_area_entered(area: Area2D) -> void:
	player_detected = true
	print("jugador detectado", area.global_position)
	target = area.global_position
	


func _on_detection_area_area_exited(area: Area2D) -> void:
	player_detected = false
	print("jugador escapo")
	target = global_position
