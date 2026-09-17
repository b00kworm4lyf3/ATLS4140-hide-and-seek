extends Node3D

@export var tree: PackedScene = preload("res://tree.tscn")
@export var rock: PackedScene = preload("res://rock.tscn")
@export var count := 50
@export var area := 45.0

func _ready() -> void:
    for i in count:
        var t := tree.instantiate() as StaticBody3D
        t.position = Vector3(randf_range(-area, area), 0.0, randf_range(-area, area))
        add_child(t)

        if i%2 == 0:
            var r := rock.instantiate()
            r.position = Vector3(randf_range(-area, area), 0.0, randf_range(-area, area))
            add_child(r)