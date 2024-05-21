extends CanvasLayer

var Score = 0
var Highscore = 0
var is_playing = false

func update_score_label():
	Score = Score + 100
	$ScoreLabel.text = "Score: %d"%(Score)
	
func _on_button_pressed():
	is_playing = true
	$ScoreTimer.start()
	$Button.visible = false

func update_highscore_label():
	if Score > Highscore:
		Highscore = Score
		$HighScoreLabel.text = "Score: %d"%(Highscore)

func _on_score_timer_timeout():
	update_score_label()
