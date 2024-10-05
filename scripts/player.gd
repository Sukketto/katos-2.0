extends CharacterBody2D

func _process(delta: float) -> void:
	var viewport_width = get_viewport_rect().size.x
	position.x = clamp(get_viewport().get_mouse_position().x, -viewport_width/2, viewport_width/2)
