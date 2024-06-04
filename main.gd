extends Node2D

var screen_size : Vector2i
var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Insaneplayer.position
	GHUD.start_game_btn.connect(new_game)

func new_game():
	$Insaneplayer.position = PlayerInitialPosition
	$Floor.position.x = 0
	$MobTimer.start()

func game_over():
	GHUD.mob_counter = 0
	$MobTimer.stop()
	GHUD.update_highscore_label()

func _process(delta):
	$Floor.position.x = $Insaneplayer.position.x - 150

@export var mob_scene: PackedScene

func _on_mob_timer_timeout():
	if GHUD.mob_counter < 2:
		var mob = mob_scene.instantiate()
		mob.position.x = $Insaneplayer.position.x + 1500
		mob.position.y = 610
		add_child(mob)
		mob.hit.connect(game_over)

