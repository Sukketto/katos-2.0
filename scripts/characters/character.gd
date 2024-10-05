class_name Character extends Node2D

@export var type : CharacterType
@onready var character_sprite = $Path/PathFollow/CharacterSprite
@onready var path = $Path
@onready var path_follow = $Path/PathFollow
@onready var collision_area = $Path/PathFollow/CollisionArea
@onready var took_sound = $TookSound
@onready var miss_sound = $MissSound

func _ready() -> void:
	# Texture
	character_sprite.texture = type.character_sprite
	# Size
	path_follow.scale *= type.character_size
	collision_area.connect("area_entered", on_collision_area_entered)
	# Path
	path.curve = type.trajectory
	# Sounds
	took_sound.stream = type.took_sound
	miss_sound.stream = type.miss_sound

func _process(delta: float) -> void:
	move()

func on_collision_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		took()

## Il personaggio è stato raccolto dal giocatore
func took():
	fade_out(type.took_points)
	get_owner().add_points(type.took_points)
	took_sound.play()
	took_sound.connect("finished", queue_free)
	
## Il personaggio è caduto nella lava
func miss():
	fade_out(type.miss_points)
	get_owner().add_points(type.miss_points)
	miss_sound.play()
	miss_sound.connect("finished", queue_free)

func fade_out(points: int = 0, animation_duration: float = 0.5 ):
	if points != 0:
		pass # todo
	get_parent().summonRandomCharacter()
	
	# Fade-out
	var tween = get_tree().create_tween()
	set_process(false)
	tween.tween_property(character_sprite, "modulate:a", 0, animation_duration)
	tween.play()
	await tween.finished
	tween.kill()

func move(points : int = 0):
	var amount = type.falling_velocity_base
	amount += type.falling_velocity_per_point * points
	path_follow.progress += max(amount, type.falling_velocity_min)
