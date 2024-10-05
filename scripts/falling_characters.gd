extends Node

@export
var characters : Array[CharacterType]

## Estrae un tipo personaggio casuale fra quelli che possono comparire con il punteggio attuale
func getRandomCharacterType(points: int = 0) -> CharacterType:
	var pool = []
	var max_weigth : float = 0

	for c in characters:
		var w : float = c.spawn_weight_base
		w += c.spawn_weight_per_point * points
		if w > 0:
			max_weigth += w
			pool.append([max_weigth, c])
	
	var random_weight = randf() * max_weigth
	print(pool)
	print(random_weight)
	var ret : CharacterType
	for pair in pool:
		ret = pair[1]
		if pair[0] > random_weight:
			return ret
	return null

var character_scene : PackedScene = load("res://scenes/character.tscn")
func getRandomCharacter(points: int = 0) -> Character:
	var ret = character_scene.instantiate()
	ret.type = getRandomCharacterType(points)
	print(ret.type)
	return ret

func summonRandomCharacter(points: int = 0):
	var character = getRandomCharacter(points)
	character.position.x = randi_range(0,1080)
	add_child(character)
	character.set_owner(get_parent())
