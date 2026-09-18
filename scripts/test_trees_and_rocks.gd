extends Node3D

@export var tree: PackedScene = preload("res://tree.tscn")
@export var rock: PackedScene = preload("res://rock.tscn")
@export var count := 50
@export var area := 60.0

func _ready() -> void:
	for i in count:
		var pos = Vector3(randf_range(-area, area), 0.0, randf_range(-area, area))
		if pos.length() < area:
			var t := tree.instantiate() as StaticBody3D
			t.position = pos
			add_child(t)

		if i%2 == 0:
			pos = Vector3(randf_range(-area, area), 0.0, randf_range(-area, area))
			if pos.length() < area:
				var r := rock.instantiate()
				r.position = pos
				add_child(r)

	var radVect = Vector3.FORWARD * area
	var ang = TAU/float(count)
	for i in range(count):
		var r := rock.instantiate()
		var s := Vector3(randf_range(3, 10), randf_range(3, 10), randf_range(3, 10))

		r.position = radVect + Vector3(randf_range(-2,0), 0, randf_range(-2,0))
		r.scale = s
		radVect = radVect.rotated(Vector3.UP, ang)
		add_child(r)
