extends Node

var util = load("res://scripts/Util.gd").new()

onready var _lines := $Lines
var _pressed := false
var _current_line: Line2D
var _is_inside_area = false

func _input(event):
	if _is_inside_area:
		if event is InputEventMouseButton:
			_pressed = event.pressed
			if _pressed:
				_current_line = Line2D.new()
				_current_line.set_default_color(Color.black)
				_current_line.width = 1
				_lines.add_child(_current_line)
		
		if event is InputEventMouseMotion && _pressed:
			_current_line.add_point(event.position)


func clean_page():
	util.remove_all_childs(_lines)

func _on_Area2D_mouse_entered():
	_is_inside_area = true


func _on_Area2D_mouse_exited():
	_is_inside_area = false
