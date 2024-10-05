class_name Player extends Node2D

func _process(delta: float) -> void:
	var screen_center = get_viewport_rect().size.x/2
	var finger_location = get_viewport().get_mouse_position().x
	position.x = clamp(finger_location-screen_center, -540, 540)
