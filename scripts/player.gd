extends CharacterBody3D

@export_group("Camera")
@export_range(0.0, 1.0) var mouse_sensitivity := 0.25

@export_group("Movement")
@export var move_speed := 8.0
@export var accel := 20.0
@export var rot_speed := 12.0

var _cam_input_dir := Vector2.ZERO
var _last_mvmt_dir := Vector3.FORWARD
var _in_range: Array = []

@onready var _cam_pivot: Node3D = %camPivot
@onready var _cam: Camera3D = %Camera3D
@onready var _skin: MeshInstance3D = %playerMesh
@onready var _talkArea: Area3D = %talkArea

func _ready() -> void:
	_talkArea.body_entered.connect(_on_talk_entered)
	_talkArea.body_exited.connect(_on_talk_exited)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event.is_action_pressed("talk") and not _in_range.is_empty():
		_in_range[0].catch(global_position)
	if event.is_action_pressed("spend"):
		if Wallet.spend_decay("stone", 7): #TODO: update to use selected type
			var faeries := get_tree().get_nodes_in_group("faeries")

			if faeries.is_empty():
				return #player spends stones but no faerie comes
			
			var closestFae := faeries[0]
			var minDist: float = global_position.distance_to(closestFae.global_position)
			for fae in faeries:
				var d := global_position.distance_to(fae.global_position)
				if d < minDist:
					closestFae = fae
					minDist = d
			closestFae.lure(global_position)


func _unhandled_input(event: InputEvent) -> void:
	var is_cam_motion := (
		event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	)

	if is_cam_motion:
		_cam_input_dir = event.screen_relative * mouse_sensitivity

func _physics_process(delta: float) -> void:
	var raw_inut:= Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var fwd := _cam.global_basis.z
	var right := _cam.global_basis.x

	var move_dir := fwd*raw_inut.y + right*raw_inut.x

	var target_angle := Vector3.FORWARD.signed_angle_to(_last_mvmt_dir, Vector3.UP)

	move_dir.y = 0.0
	move_dir = move_dir.normalized()

	velocity = velocity.move_toward(move_dir*move_speed, accel*delta)

	_cam_pivot.rotation.x -= _cam_input_dir.y*delta
	_cam_pivot.rotation.x = clamp(_cam_pivot.rotation.x, -PI/6.0, PI/3.0)

	_cam_pivot.rotation.y -= _cam_input_dir.x*delta

	_cam_input_dir = Vector2.ZERO

	if move_dir.length() > 0.2:
		_last_mvmt_dir = move_dir

	_skin.global_rotation.y = lerp_angle(_skin.rotation.y, target_angle, rot_speed * delta)

	move_and_slide()

func _on_talk_entered(body: Node) -> void:
	if body.is_in_group("faeries"):
		_in_range.append(body)

func _on_talk_exited(body: Node) -> void:
	_in_range.erase(body)