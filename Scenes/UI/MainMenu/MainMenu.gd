extends CanvasLayer

func _ready():
	$MainMenu/Btn_Play.grab_focus()


func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/Level.tscn")


func _on_btn_quit_pressed():
	get_tree().quit()


func _on_btn_play_pressed():
	Settings.left_player = Settings.PlayerType.PLAYER_CHARACTER
	Settings.right_player = Settings.PlayerType.PLAYER_CHARACTER
	$MainMenu.hide()
	$PlayerSelection.show()
	$PlayerSelection/Btn_Start.grab_focus()


func _on_btn_left_player_pressed():
	Settings.left_player = Settings.PlayerType.PLAYER_CHARACTER


func _on_btn_left_bot_pressed():
	Settings.left_player = Settings.PlayerType.BOT


func _on_btn_right_player_pressed():
	Settings.right_player = Settings.PlayerType.PLAYER_CHARACTER


func _on_btn_right_bot_pressed():
	Settings.right_player = Settings.PlayerType.BOT
