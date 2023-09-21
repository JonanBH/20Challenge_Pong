extends CanvasLayer
class_name HUD

@onready var left_score := $LeftScore
@onready var right_score := $RightScore

var can_show_pause = true

func update_scores(left : int, right : int):
	left_score.text = str(left)
	right_score.text = str(right)


func open_pause_menu():
	if not can_show_pause:
		return
		
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


func show_result(left_win : bool) -> void:
	left_score.hide()
	right_score.hide()
	get_tree().paused = true
	
	var won = "Left" if left_win else "Right"
	$EndGameMenu/PlayerVictoryLabel.text = won + " victory!"
	$EndGameMenu.show()
	$EndGameMenu/Btn_PlayAgain.grab_focus()
	can_show_pause = false


func _on_btn_play_again_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Level/Level.tscn")


func _on_btn_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu/MainMenu.tscn")
