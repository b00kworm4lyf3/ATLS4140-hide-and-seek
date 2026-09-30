extends Node3D

@export var tree: PackedScene = preload("res://tree.tscn")
@export var rock: PackedScene = preload("res://rock.tscn")
@export var count := 50
@export var area := 60.0
@export var clear := 12.0

var extraRocks := 20.0

func _ready() -> void:
	#randomly placed rocks and trees
	for i in (count*2):
		var pos = Vector3(randf_range(-area+2, area-2), 0.0, randf_range(-area+2, area-2))
		if _valid_pos(pos):
			var t := tree.instantiate() as StaticBody3D
			t.position = pos
			t.add_to_group("trees")
			add_child(t)

		if i%2 == 0:
			pos = Vector3(randf_range(-area+2, area-2), 0.0, randf_range(-area+2, area-2))
			if pos.length() < area:
				var r := rock.instantiate()
				r.position = pos
				r.add_to_group("rocks")
				add_child(r)

	var radVect = Vector3.FORWARD * area
	var ang = TAU/float(count)

	#rock wall
	for i in range(count):
		var r := rock.instantiate()
		var s := Vector3(randf_range(3, 10), randf_range(5, 13), randf_range(3, 10))

		r.position = radVect + Vector3(randf_range(-2,2), 0, randf_range(-2,2))
		r.scale = s
		radVect = radVect.rotated(Vector3.UP, ang)
		r.add_to_group("wall")
		add_child(r)

	#extra rocks in clearing
	radVect = Vector3.FORWARD
	ang = TAU/extraRocks

	for i in range(extraRocks):
		var dist = randf_range(2, clear)
		var r := rock.instantiate()

		r.position = radVect * dist
		radVect = radVect.rotated(Vector3.UP, ang)

		r.add_to_group("rocks")
		r.add_to_group("clearing_rocks")
		add_child(r)


func _valid_pos(pos: Vector3) -> bool:
	var d := pos.length()
	return d < area and d > clear
