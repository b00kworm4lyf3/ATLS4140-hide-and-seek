extends CharacterBody3D

var move_speed := 0.0
var bob_height := 0.0
var bob_speed := 0.0

var _target := Vector3.ZERO
var _base_y := 0.0
var _t := 0.0

func _ready() -> void:
	add_to_group("faeries")

	move_speed = randf_range(5.0, 10.0)
	bob_height = randf_range(0.3, 0.5)
	bob_speed = randf_range(2.0, 4.0)

	_base_y = position.y
	_target = find_hide(Vector3.ZERO)

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

func catch(from: Vector3) -> void:
	Wallet.add_coins(5, "stone") #TODO: Update when more fae types
	#_target = position + Vector3(randf_range(-8, 8), 0, randf_range(-8, 8)) #placeholder flee, rehide behind rock
	_target = find_hide(from, true)

func lure(to: Vector3) -> void:
	_target = to

func find_hide(from: Vector3, furthest := false) -> Vector3:
	var rocks:= get_tree().get_nodes_in_group("rocks")
	var pickRock := rocks[0]
	var bestDist: float = global_position.distance_to(pickRock.global_position)
	for rock in rocks:
		var d := global_position.distance_to(rock.global_position)
		if (d > bestDist) if furthest else (d < bestDist):
			pickRock = rock
			bestDist = d

	var to_rock: Vector3 = pickRock.global_position - from
	to_rock.y = 0
	to_rock = to_rock.normalized()
	return pickRock.global_position + to_rock
