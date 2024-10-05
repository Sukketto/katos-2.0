extends Control

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if !$StartButton.is_hovered() and !$HelpButton.is_hovered() and !$HowToPlayTexture/OkButton.is_hovered():
			$PoopSFX.play()

func _on_start_button_pressed() -> void:
	$ClickSFX.play()
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_help_button_pressed() -> void:
	$HelpSFX.play()
	$HowToPlayTexture.visible = true

func _on_ok_button_pressed() -> void:
	$HelpSFX.play()
	$HowToPlayTexture.visible = false
