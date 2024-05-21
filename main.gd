extends Node2D

var screen_size : Vector2i
var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Insaneplayer.position

func new_game():
	$Insaneplayer.position = PlayerInitialPosition
	$Floor.position.x = 0

func game_over():
	GHUD.update_highscore_label()

func _process(delta):
	if ($Insaneplayer.position.x - $Floor.position.x) > screen_size.x:
		$Floor.position.x = $Floor.position.x + screen_size.x
		
	
