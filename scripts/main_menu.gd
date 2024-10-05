extends Control

const API_URL = "https://aleclasher.altervista.org/api/"

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if !$StartButton.is_hovered() \
		and !$HelpButton.is_hovered() \
		and !$HowToPlayTexture/OkFromHelpButton.is_hovered() \
		and !$LeaderboardButton.is_hovered() \
		and !$LeaderboardTexture/OkFromLeaderboardButton.is_hovered():
			$PoopSFX.play()

func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$HTTPRequest.request(API_URL + "punteggi")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# Slot 1
	$LeaderboardTexture/VBoxContainer/Slot1/AvatarTexture.texture = match_avatar(json[0]["avatar"])
	$LeaderboardTexture/VBoxContainer/Slot1/VBoxContainer/NameLabel.text = str(json[0]["nome"])
	$LeaderboardTexture/VBoxContainer/Slot1/VBoxContainer/ScoreLabel.text = "PUNTEGGIO: " + str(json[0]["punteggio"])
	
	# Slot 2
	$LeaderboardTexture/VBoxContainer/Slot2/AvatarTexture.texture = match_avatar(json[1]["avatar"])
	$LeaderboardTexture/VBoxContainer/Slot2/VBoxContainer/NameLabel.text = str(json[1]["nome"])
	$LeaderboardTexture/VBoxContainer/Slot2/VBoxContainer/ScoreLabel.text = "PUNTEGGIO: " + str(json[1]["punteggio"])
	
	# Slot 3
	$LeaderboardTexture/VBoxContainer/Slot3/AvatarTexture.texture = match_avatar(json[2]["avatar"])
	$LeaderboardTexture/VBoxContainer/Slot3/VBoxContainer/NameLabel.text = str(json[2]["nome"])
	$LeaderboardTexture/VBoxContainer/Slot3/VBoxContainer/ScoreLabel.text = "PUNTEGGIO: " + str(json[2]["punteggio"])
	
	# Slot 4
	$LeaderboardTexture/VBoxContainer/Slot4/AvatarTexture.texture = match_avatar(json[3]["avatar"])
	$LeaderboardTexture/VBoxContainer/Slot4/VBoxContainer/NameLabel.text = str(json[3]["nome"])
	$LeaderboardTexture/VBoxContainer/Slot4/VBoxContainer/ScoreLabel.text = "PUNTEGGIO: " + str(json[3]["punteggio"])
	
	# Slot 5
	$LeaderboardTexture/VBoxContainer/Slot5/AvatarTexture.texture = match_avatar(json[4]["avatar"])
	$LeaderboardTexture/VBoxContainer/Slot5/VBoxContainer/NameLabel.text = str(json[4]["nome"])
	$LeaderboardTexture/VBoxContainer/Slot5/VBoxContainer/ScoreLabel.text = "PUNTEGGIO: " + str(json[4]["punteggio"])

func _on_start_button_pressed() -> void:
	$ClickSFX.play()
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_help_button_pressed() -> void:
	$HelpSFX.play()
	$HowToPlayTexture.visible = true

func _on_ok_from_help_button_pressed() -> void:
	$HelpSFX.play()
	$HowToPlayTexture.visible = false

func _on_leaderboard_button_pressed() -> void:
	$HelpSFX.play()
	$LeaderboardTexture.visible = true

func _on_ok_from_leaderboard_button_pressed() -> void:
	$HelpSFX.play()
	$LeaderboardTexture.visible = false

func match_avatar(avatar: int):
	return load("res://assets/avatars/avatars-%d.png" % avatar)
