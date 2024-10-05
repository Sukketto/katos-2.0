class_name Item extends Node2D

@export var trajectory: Path2D
@export var path_follow: PathFollow2D
@export var item_sprite: Sprite2D
@export var item_collision_area: Area2D

var falling_velocity: int

@export var took_points: int
@export var miss_points: int

func _ready() -> void:
	item_collision_area.connect("area_entered", on_collision_area_entered)
	
	path_follow.progress += 1

func _process(delta: float) -> void:
	position.y += falling_velocity * delta

func on_collision_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		queue_free()
