extends Node3D

@export var fae: PackedScene = preload("res://fairy.tscn")
@export var count := 25
@export var area := 50.0

@onready var clear = $"../testTreesandRocks".clear

var tut_fae := 12

func _ready() -> void:
	var radVect = Vector3.FORWARD
	var ang = TAU/float(count)

	for i in count:
		var f = fae.instantiate() as CharacterBody3D

		if i < tut_fae:
			f.position = radVect * randf_range(2, clear)
			f.hide_grp = "clearing_rocks"
		else:
			f.position = radVect * randf_range(2, area)
			f.hide_grp = "rocks"

		f.position.y = 0.5

		radVect = radVect.rotated(Vector3.UP, ang)
		add_child(f)
