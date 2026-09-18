extends CharacterBody3D

var move_speed := 0.0
var bob_height := 0.0
var bob_speed := 0.0

var _target := Vector3.ZERO
var _base_y := 0.0
var _t := 0.0

func _ready() -> void:
	move_speed = randf_range(3.0, 5.0)
	bob_height = randf_range(0.3, 0.5)
	bob_speed = randf_range(2.0, 4.0)

	add_to_group("faeries")
	_base_y = position.y
	_target = position

func _process(delta: float) -> void:
	_t += delta

	#move
	var flat := Vector2(position.x, position.z)
	var goal := Vector2(_target.x, _target.z)
	flat = flat.move_toward(goal, move_speed * delta)
	position.x = flat.x
	position.z = flat.y

	#hover
	position.y = _base_y + sin(_t*bob_speed)*bob_height

func catch() -> void:
	Wallet.add_coins(5, "stone") #TODO: Update when more fae types
	_target = position + Vector3(randf_range(-8, 8), 0, randf_range(-8, 8)) #placeholder flee, rehide behind rock
