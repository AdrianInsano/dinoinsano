extends Node2D

var screen_size : Vector2i
var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Insaneplayer.position

func new_game():
	$Insaneplayer.position = PlayerInitialPosition
	$Floor.position.x = 0
	$MobTimer.start()

func game_over():
	GHUD.update_highscore_label()

func _process(delta):
	$Floor.position.x = $Insaneplayer.position.x - 150

@export var mob_scene: PackedScene


func _on_mob_timer_timeout():
	print('creando mob...')
