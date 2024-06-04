extends Area2D
signal hit

func _ready():
	GHUD.mob_counter = GHUD.mob_counter + 1
	var collisions = [
		$BlueCollision, 
		$RedCollision, 
		$StoneCol, 
		$MossyCol, 
		$DioriteCol, 
		$CobbleCol, 
		$AndesiteCol
	]
	var sprites = [
		$BlueSprite, 
		$RedSprite, 
		$StoneSprite, 
		$MossySprite, 
		$DioriteSprite, 
		$CobbleSprite, 
		$AndesiteSprite
	]
	var random_int = randi() % collisions.size()
	
	var selected_collision = collisions[random_int]
	var selected_sprite = sprites[random_int]
	selected_sprite.visible = true
	selected_collision.visible = true 
	selected_collision.disabled = false

func _on_visible_on_screen_notifier_2d_screen_exited():
	if GHUD.mob_counter > 0:
		GHUD.mob_counter = GHUD.mob_counter - 1
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("dinomax"):
		hit.emit()
