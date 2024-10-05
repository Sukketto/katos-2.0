extends Control

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		$PoopSFX.play()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_help_button_pressed() -> void:
	$HowToPlayTexture.visible = true

func _on_ok_button_pressed() -> void:
	$HowToPlayTexture.visible = false
