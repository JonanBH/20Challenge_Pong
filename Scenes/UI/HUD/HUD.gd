extends CanvasLayer
class_name HUD

@onready var left_score := $LeftScore
@onready var right_score := $RightScore

func update_scores(left : int, right : int):
	left_score.text = str(left)
	right_score.text = str(right)


func open_pause_menu():
	left_score.hide()
	right_score.hide()
	$PauseMenu.show()
	$PauseMenu/Btn_Resume.grab_focus()
	get_tree().paused = true


func _on_btn_resume_pressed():
	left_score.show()
	right_score.show()
	$PauseMenu.hide()
	get_tree().paused = false
