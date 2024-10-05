extends Resource
## Personaggio che viene generato nel gioco

class_name CharacterType

## Indica la tipologia del personaggio
@export var character_kind : CharacterKind = CharacterKind.BONUS 

@export_category("Character Assets")
## Indica la texture che il personaggio userà nel gioco
@export var character_sprite: Texture2D
## Indica la dimensione del personaggio
@export var character_size: float = 1

@export_category("Character Movement")
## Indica la traiettoia che seguirà il personaggio mentre è nel gioco
@export var trajectory: Curve2D
## Indica la velocità di movimento minimo
@export var falling_velocity_min : float = 1
## Indica la velocità di movimento base
@export var falling_velocity_base: float
## Indica la velocità di movimento aggiuntiva per ogni punto ottenuto
@export var falling_velocity_per_point: float

@export_category("Character Rewards")
## Indica i punti che si ottengono se si raccoglie il personaggio
@export var took_points: int
## Indica il suono riprodotto quando si raccoglie il personaggio 
@export var took_sound: AudioStream
## Indica i punti che si ottengono se si fa cadere il personaggio
@export var miss_points: int
## Indica il suono riprodotto quando si fa cadere il personaggio
@export var miss_sound: AudioStream

@export_category("Character Spawn")
## Indica la probabilità di spawn  base
@export var spawn_weight_base: float = 1
## Indica la probabilità di spawn aggiuntiva di movimento per ogni punto ottenuto
@export var spawn_weight_per_point: float


enum CharacterKind {
	POSITIVO, 	## Personaggio positivo
	NEGATIVO, 	## Personaggio negativo
	BONUS, 		## Personaggio bonus, sullo schermo apparirà un bagliore verde una volta che l'oggetto viene raccolto
	MALUS 		## Personaggio malus, sullo schermo apparirà un bagliore rosso una volta che l'oggetto viene raccolto
}
