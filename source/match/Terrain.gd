extends StaticBody3D


func _ready():
	input_event.connect(_on_input_event)


func _on_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_RIGHT
		and event.pressed
	):
		var target_point = get_viewport().get_camera_3d().get_ray_intersection(event.position)
		MatchSignals.terrain_targeted.emit(target_point)
