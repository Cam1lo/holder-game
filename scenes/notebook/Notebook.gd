extends Node2D


onready var active_page_name = 'p1'

func _on_NotebookScreen_next_page():
	if active_page_name == 'p1':
		$Sprite/p1.visible = false
		$Sprite/p2.visible = true
		active_page_name = 'p2'

	elif active_page_name == 'p2':
		$Sprite/p2.visible = false
		$Sprite/p3.visible = true
		active_page_name = 'p3'

	
func _on_NotebookScreen_prev_page():
	if active_page_name == 'p2':
		$Sprite/p1.visible = true
		$Sprite/p2.visible = false
		active_page_name = 'p1'
		
	elif active_page_name == 'p3':
		$Sprite/p2.visible = true
		$Sprite/p3.visible = false
		active_page_name = 'p2'


func _on_NotebookScreen_clean_page():
	if active_page_name == 'p1':
		get_node("Sprite/p1").clean_page()
		
	elif active_page_name == 'p2':
		get_node("Sprite/p2").clean_page()
	
	elif active_page_name == 'p3':
		get_node("Sprite/p3").clean_page()
