extends Node3D

@export var fae: PackedScene = preload("res://fairy.tscn")
@export var count := 25
@export var area := 50.0

func _ready() -> void:
    for i in count:
        var pos = Vector3(randf_range(-area, area), randf_range(0, 1), randf_range(-area, area))
        if pos.length() < area:
            var f := fae.instantiate() as CharacterBody3D
            f.position = pos
            add_child(f)