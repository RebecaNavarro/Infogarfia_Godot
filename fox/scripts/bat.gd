extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var state_machine = $AnimationTree.get("parameters/playback")

@export var hp = 30
@export var target = Vector2.ZERO

var player_detected = false

const MAX_SPEED = 70
const ACEEL = 200

func _ready() -> void:
	state_machine.travel("Fly")
	target = global_position

func _physics_process(delta: float) -> void:
	#calcular la direccion a moverse
	if player_detected:
		var direction = global_position.direction_to(target).normalized()
		velocity = velocity.move_toward(direction * MAX_SPEED, ACEEL * delta)
		move_and_slide()

func _on_hurt_box_area_entered(area: Area2D) -> void:
	hp -= 10
	print("OUCH enemy")
	if hp <= 0:
		queue_free()


func _on_detection_area_area_entered(area: Area2D) -> void:
	player_detected = true
	print("Jugador detectado")
	target = area.global_position


func _on_detection_area_area_exited(area: Area2D) -> void:
	player_detected = false
	print("Jugador escapó")
	target = global_position
