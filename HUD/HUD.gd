extends CanvasLayer

signal start_game_btn

var Score = 0
var highscore = 0
var is_playing = false
var mob_counter = 0

func update_score_label():
	Score = Score + 10
	$ScoreLabel.text = "Score: %d"%(Score)

func update_highscore_label():
	if Score > highscore:
		highscore = Score
		$HighScoreLabel.text = "Score: %d"%(highscore)
	is_playing = false
	$ScoreTimer.stop()
	$Button.visible = true

func _on_button_pressed():
	Score = 0
	update_score_label()
	start_game_btn.emit()
	is_playing = true
	$ScoreTimer.start()
	$Button.visible = false

func _on_score_timer_timeout():
	update_score_label()
