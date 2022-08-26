extends Node2D
signal character_pick_up
const Item = preload("res://classes/Item.gd")
var mouse_pos
var menu_visible = false
var mouse_inside_menu = false
var item = Item.new('jpg', 'Marcos')

func is_box_left_clicked(event):
	return event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed == true

func _on_PopupMenu_id_pressed(id):
	emit_signal("character_pick_up", item)
	$ExclamationMarks.visible = true
	self.hide()

func _on_Area2D_mouse_entered():
	if !menu_visible:
		mouse_pos = get_global_mouse_position()
	show_menu()

func _on_PopupMenuArea_mouse_exited():
	if !mouse_inside_menu:
		hide_menu()

func show_menu():
	menu_visible = true
	$PopupMenu.popup(Rect2(mouse_pos, $PopupMenu.rect_size))
	$ExclamationMarks.visible = false

func hide_menu():
	menu_visible = false
	$PopupMenu.visible = false
	$ExclamationMarks.visible = true

func _on_PopupMenu_mouse_entered():
	mouse_inside_menu = true

func _on_PopupMenu_mouse_exited():
	mouse_inside_menu = false
	hide_menu()

