extends Node2D
const Item = preload("res://classes/Item.gd")

var locker_open
var objects = create_map(6,4)
var current_locker
var popup: PopupMenu

func _ready():
	popup = get_owner().get_child(1)
	
	for i in range(24) :
		var locker = get_node('Locker' + str(i + 1))
		locker.add_item(check_items(i+1))
		locker.connect('locker_open', self, 'on_locker_open', [i+1])


func on_locker_open(locker_index):
	var character_item = get_node('/root/Main/Character').carrying
	
	close_previous(locker_index)
	locker_open = get_node("Locker" + str(locker_index))
	var locker_item = check_items(locker_index)
	if locker_item and character_item == null: 
		create_popup_get()
	elif !locker_item and character_item: create_popup_drop()
	current_locker = locker_index

func create_popup_get():
	var popup_menu: PopupMenu = get_owner().get_child(1)
	popup_menu.clear()
	popup_menu.add_item('Pick Up')
	show_popup()

func create_popup_drop():
	var popup_menu: PopupMenu = get_owner().get_child(1)
	popup_menu.clear()
	popup_menu.add_item('Drop')
	show_popup()

func check_items(locker_idx):
	var row = floor(locker_idx/7)
	var col = 1 - (locker_idx%7)
	return objects[col][row]

func get_locker_pos(locker_idx):
	return [1 - (locker_idx%7), floor(locker_idx/7)]

func close_previous(x):
	if locker_open != null and locker_open != get_node("Locker" + str(x)):
		locker_open.close()

func create_map(w, h):
	var map = []
	for x in range(w):
		var col = []
		col.resize(h)
		map.append(col)
	return map

func show_popup():
	popup.popup(Rect2(get_global_mouse_position(), popup.rect_size))

func _on_PopupMenu_id_pressed(id):
	if popup.get_item_text(id) == 'Pick Up':
		pickup()
	elif popup.get_item_text(id) == 'Drop':
		drop()

func pickup():
	var item = check_items(current_locker)
	var locker_pos = get_locker_pos(current_locker)
	objects[locker_pos[0]][locker_pos[1]] = null
	var locker = get_node("Locker" + str(current_locker))
	locker.remove_item()
	var character = get_node('/root/Main/Character')
	character.carrying = item
	
func drop():
	var character = get_node('/root/Main/Character')
	var locker_pos = get_locker_pos(current_locker)
	var locker = get_node("Locker" + str(current_locker))
	var item = character.carrying
	character.carrying = null
	objects[locker_pos[0]][locker_pos[1]] = item
	locker.add_item(item)
