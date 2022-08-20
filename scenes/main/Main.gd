extends Node2D

export(bool) var main_screen_controls_active

func _on_main_hud_open_notebook():
	open_notebook_state()


func _on_NotebookScreen_close_notebook():
	close_notebook_state()

func open_notebook_state():
	main_screen_controls_active = false	
	$NotebookScreen.visible = true
	$main_hud.visible = false
	
func close_notebook_state():
	main_screen_controls_active = true
	$NotebookScreen.visible = false
	$main_hud.visible = true
